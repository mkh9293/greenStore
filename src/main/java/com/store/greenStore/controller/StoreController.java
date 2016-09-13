package com.store.greenStore.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;

import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.io.SAXReader;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.dom4j.Element;
import org.dom4j.Node;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.greenStore.dto.Blog;
import com.store.greenStore.dto.Play;
import com.store.greenStore.dto.Store;
import com.store.greenStore.mapper.StoreDbMapper;
import com.store.greenStore.mapper.StoreMapper;

@Controller
@RequestMapping(value="/store/*")
public class StoreController {

	@Autowired
	StoreDbMapper storeDbMapper;

	@Autowired
	StoreMapper storeMapper;

	//data.go.kr appkey
	private final String serviceKey = "Hg3hdDoudw4mO5fh6hxBa3XnJBF2Zdr3o9s1EZu04FYctqRNkH2g5eEAWqF1xyivTDrUtwE5gWb0U9PTI7VP5A%3D%3D";


	//daum appkey
	private final String appkey = "01b35d68e4ea90f252393375e98e3958";

	private static String clientID = "JVXDLzbu3vF0iePeevrk"; //api 사용 신청시 제공되는 아이디
	private static String clientSecret = "RfnS7CQwHj"; //패스워드

	//좌표로 변경해준다.
	private HashMap<String, Double> getGps(String addr) throws IOException, ParseException{
		HashMap<String, Double> map = new HashMap<String, Double>();

		URL url = new URL("https://apis.daum.net/local/geo/addr2coord?apikey="+appkey+"&q="+URLEncoder.encode(addr, "UTF-8")+"&output=json");

		URLConnection yc = url.openConnection();
		BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
		String inputLine = "";
		String ins = "";

		while ((inputLine = in.readLine()) != null) {
			ins += inputLine;
		}

		JSONParser jsonParser = new JSONParser();

		//JSON데이터를 넣어 JSON Object 로 만들어 준다.
		JSONObject jsonObject = (JSONObject) jsonParser.parse(ins);
		jsonObject = (JSONObject) jsonObject.get("channel");

		JSONArray jsonArray = new JSONArray();
		jsonArray = (JSONArray) jsonObject.get("item");

		for(int i=0;i<jsonArray.size();i++){
			JSONObject jb = (JSONObject)jsonArray.get(i);
			map.put("pointX", (double)jb.get("point_x"));
			map.put("pointY", (double)jb.get("point_y"));
		}

		return map;
	}

	//놀거리 정보 리턴 
	private ArrayList<Play> getPlayInfo(double pointX, double pointY) throws IOException, ParseException{
		HashMap<String, String> codeList = getServiceCode();

		URL url = new URL("http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey="+serviceKey+"&numOfRows=10&pageSize=10&pageNo=1&startPage=1&arrange=A&listYN=Y&mapX="+pointX+"&mapY="+pointY+"&radius=4999&MobileOS=ETC&MobileApp=공유자원포털&_type=json");

		URLConnection yc = url.openConnection();
		BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
		String inputLine = "";
		String ins = "";

		while ((inputLine = in.readLine()) != null) {
			ins += inputLine;
		}
		JSONParser jsonParser = new JSONParser();

		JSONObject jsonObject2 = (JSONObject) jsonParser.parse(ins);

		jsonObject2 = (JSONObject) jsonObject2.get("response");
		jsonObject2 = (JSONObject) jsonObject2.get("body");
		jsonObject2 = (JSONObject) jsonObject2.get("items");

		JSONArray arrayResult =  new JSONArray();
		arrayResult = (JSONArray) jsonObject2.get("item");

		ArrayList<Play> playList = new ArrayList<Play>();

		for(int i=0;i<arrayResult.size();i++){
			JSONObject jsonTemp = (JSONObject)arrayResult.get(i);
			Play play = new Play();

			play.setContentid(jsonTemp.get("contentid"));
			play.setAddr1((String)jsonTemp.get("addr1"));
			play.setAddr2(jsonTemp.get("addr2"));
			play.setFirstimage((String)jsonTemp.get("firstimage"));

			play.setMapx(jsonTemp.get("mapx"));
			play.setMapy(jsonTemp.get("mapy"));

			play.setReadcount((long)jsonTemp.get("readcount"));
			play.setTitle((String)jsonTemp.get("title"));

			play.setCat1(codeList.get((String)jsonTemp.get("cat1")));
			play.setSigungucode(jsonTemp.get("sigungucode"));

			playList.add(play);
		}

		return playList;
	}

	private HashMap<String, String> getServiceCode(){
		HashMap<String, String> codeList = new HashMap<String, String>();
		codeList.put("A01", "자연");
		codeList.put("A02", "인문(문화/예술/역사)");
		codeList.put("A03", "레포츠");
		codeList.put("A04", "쇼핑");
		codeList.put("A05", "음식");
		//숙박 음식 빼고 ..
		codeList.put("B02", "숙박");
		codeList.put("C01", "추천코스");

		return codeList;
	}

	//놀거리 상세정보 리턴 
	private Play getPlayDetailInfo(String contentId) throws IOException, ParseException{
		HashMap<String, String> codeList = getServiceCode();
		URL url = new URL("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="+serviceKey+"&contentId="+contentId+"&defaultYN=Y&mapImageYN=Y&firstImageYN=Y&overviewYN=Y&MobileOS=ETC&MobileApp=공유자원포털&numOfRows=999&pageSize=999&pageNo=1&startPage=1&_type=json");

		URLConnection yc = url.openConnection();
		BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
		String inputLine = "";
		String ins = "";

		while ((inputLine = in.readLine()) != null) {
			ins += inputLine;
		}

		JSONParser jsonParser = new JSONParser();

		JSONObject jsonObject2 = (JSONObject) jsonParser.parse(ins);

		jsonObject2 = (JSONObject) jsonObject2.get("response");
		jsonObject2 = (JSONObject) jsonObject2.get("body");
		jsonObject2 = (JSONObject) jsonObject2.get("items");
		jsonObject2 = (JSONObject) jsonObject2.get("item");

		Play play = new Play();

		play.setFirstimage((String)jsonObject2.get("firstimage"));
		play.setFirstimage2((String)jsonObject2.get("firstimage2"));
		play.setTitle((String)jsonObject2.get("title"));
		play.setTel((String)jsonObject2.get("tel"));
		play.setCat1(codeList.get((String)jsonObject2.get("cat1")));
		play.setSigungucode((String)jsonObject2.get("sigungucode"));
		play.setOverview((String)jsonObject2.get("overview"));

		return play;
	}

	//놀거리 서비스 코드로 소분류 갖고 오기
	private String getPlayServiceCode(String cat1, String cat2, String cat3) throws IOException, ParseException{
		URL url = new URL("http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode?ServiceKey="+serviceKey+"&numOfRows=10&pageSize=10&pageNo=1&startPage=1&cat1="+cat1+"&cat2="+cat2+"&cat3="+cat3+"&MobileOS=ETC&MobileApp=공유자원포털&_type=json");

		URLConnection yc = url.openConnection();
		BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
		String inputLine = "";
		String ins = "";

		while ((inputLine = in.readLine()) != null) {
			ins += inputLine;
		}

		JSONParser jsonParser = new JSONParser();

		JSONObject jsonObject2 = (JSONObject) jsonParser.parse(ins);

		jsonObject2 = (JSONObject) jsonObject2.get("response");
		jsonObject2 = (JSONObject) jsonObject2.get("body");
		jsonObject2 = (JSONObject) jsonObject2.get("items");
		jsonObject2 = (JSONObject) jsonObject2.get("item");

		
		return "";
	}
	//놀거리 지역코드로 지역 갖고 오기


	//naver blog 검색 data 받아오기 
	private List<Node> getBlogContent(String searchStore) throws IOException, DocumentException{
		URL url;

		url = new URL("https://openapi.naver.com/v1/search/blog.xml?query=" + URLEncoder.encode(searchStore, "UTF-8") +
				"&display=5"  + "&start=1&sort=sim");
		URLConnection urlConn;

		//url 연결
		urlConn = url.openConnection();
		urlConn.setRequestProperty("X-naver-Client-Id", clientID);
		urlConn.setRequestProperty("X-naver-Client-Secret", clientSecret);

		BufferedReader in = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
		String inputLine = "";
		String ins = "";

		while ((inputLine = in.readLine()) != null) {
			ins += inputLine;
		}
		System.out.println(ins);

		SAXReader saxReader = new SAXReader();
		Document document = saxReader.read(new StringReader(ins));

		List<Node> nodes;

		nodes = document.selectNodes("//channel/item");
		in.close();

		return nodes;
	}

	//daum blog 검색 데이터 받아오기 
	private ArrayList<Blog> getDaumBlog(String searchText) throws IOException, ParseException{
		URL url = new URL("https://apis.daum.net/search/blog?apikey="+appkey+"&q="+URLEncoder.encode(searchText, "UTF-8")+"&sort=date&output=json");

		URLConnection yc = url.openConnection();
		BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
		String inputLine = "";
		String ins = "";

		while ((inputLine = in.readLine()) != null) {
			ins += inputLine;
		}
		ins = ins.replaceAll("&lt;b&gt;", "<b>");
		ins = ins.replaceAll("&lt;/b&gt;", "</b>");

		JSONParser jsonParser = new JSONParser();

		JSONObject jsonObject = (JSONObject) jsonParser.parse(ins);
		jsonObject = (JSONObject)jsonObject.get("channel");

		JSONArray arrayResult =  new JSONArray();
		arrayResult = (JSONArray) jsonObject.get("item");

		ArrayList<Blog> blogList = new ArrayList<Blog>();

		for(int i=0;i<arrayResult.size();i++){
			JSONObject jsonTemp = (JSONObject)arrayResult.get(i);
			Blog blog = new Blog();

			blog.setAuthor((String)jsonTemp.get("author"));
			blog.setDescription((String)jsonTemp.get("description"));
			blog.setLink((String)jsonTemp.get("link"));
			blog.setPubDate(jsonTemp.get("pubDdate"));
			blog.setTitle((String)jsonTemp.get("title"));

			blogList.add(blog);
		}

		return blogList;
	}

	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String detail(int id, Model model) throws IOException, ParseException, DocumentException{
		Store store = storeDbMapper.detail(id);

		//지역을 좌표로 변경 
		HashMap<String, Double> map = new HashMap<String, Double>();
		map = getGps(store.getSh_addr());

		//놀거리 리스트
		List<Play> playList =  getPlayInfo(map.get("pointX"),map.get("pointY"));
		Collections.shuffle(playList);

		//놀거리 소개 
		ArrayList<String> overviewList = new ArrayList<String>();
		for(int i=0;i<3;i++){
			Play play = getPlayDetailInfo(playList.get(i).getContentid().toString());
			overviewList.add((String)play.getOverview());
		}

		//naver blog	
		List<Node> nodes = getBlogContent(store.getSh_name());
		ArrayList<Blog> blogList = new ArrayList<Blog>();

		for (Node node : nodes) {
			Blog blog = new Blog();
			blog.setTitle(node.selectSingleNode("title").getText());
			blog.setLink(node.selectSingleNode("link").getText());
			blog.setBloggerlink(node.selectSingleNode("bloggerlink").getText());
			blog.setBloggername(node.selectSingleNode("bloggername").getText());
			blog.setDescription(node.selectSingleNode("description").getText());

			blogList.add(blog);
		}

		model.addAttribute("store", store);
		model.addAttribute("playList", playList);
		model.addAttribute("overviewList", overviewList);
		model.addAttribute("pointX", map.get("pointX"));
		model.addAttribute("pointY", map.get("pointY"));
		model.addAttribute("blogList", blogList);
		model.addAttribute("daumBlogList", getDaumBlog(store.getSh_name()));

		return "store/detail";
	}


	@RequestMapping(value="/detail/play", method=RequestMethod.GET)
	public String play(Model model, @RequestParam(value="contentId") String contentId) throws IOException, ParseException{
		Play play = getPlayDetailInfo(contentId);

		model.addAttribute("playInfo", play);

		return "store/playDetail";
	}

	@RequestMapping(value="/detail/navi", method=RequestMethod.GET)
	public String navi(Model model,Store store,@RequestParam(value="endPointX") Double endPointX,@RequestParam(value="endPointY") Double endPointY){

		model.addAttribute("store", store);
		model.addAttribute("pointX", endPointX);
		model.addAttribute("pointY", endPointY);

		return "store/daumNavi";
	}

	@RequestMapping(value="/search",method = RequestMethod.GET)
	public String searchAll(Model model) throws IOException, ParseException{
		List<Store> store = new ArrayList<Store>();
		store = storeMapper.webSelectAll();

		model.addAttribute("store", store);

		return "search/moreResult";
	}

	@RequestMapping(value="/search/{searchText}",method = RequestMethod.GET)
	public String search(@PathVariable("searchText")String searchText, Model model){
		List<Store> storeList = storeMapper.search(searchText);

		model.addAttribute("searchText", searchText);
		model.addAttribute("store", storeList);
		model.addAttribute("storeListSize", storeList.size());

		return "search/textResult";
	}

	@RequestMapping(value="/search/{area}/{cate}",method = RequestMethod.GET)
	public String cateSearch(@PathVariable("area")String area, @PathVariable("cate")String cate, Model model){
		//cate 가 음식으로 오면 한식,중식,일식
		List<Store> storeList = new ArrayList<Store>();
		storeList = storeMapper.cateSearch(area,cate);
		String indutyName ="";
		
		System.out.println("storeList: ");
		System.out.println(storeList);
		System.out.println(storeList.size());
		
		if(storeList.size()>1){
			System.out.println("not Null");
			indutyName = storeList.get(0).getInduty_code_se_name();
		}
		
		model.addAttribute("area",area);
		model.addAttribute("cate", indutyName);
		model.addAttribute("cateJson",cate);
		model.addAttribute("storeListSize",storeList.size());
		model.addAttribute("store",storeList);

		return "search/conditionResult";
	}
}
