package com.store.greenStore.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	private final String appkey = "76d0dfe96fd493ccedbee52792d36e32";
	
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
		
		URL url = new URL("http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey=Hg3hdDoudw4mO5fh6hxBa3XnJBF2Zdr3o9s1EZu04FYctqRNkH2g5eEAWqF1xyivTDrUtwE5gWb0U9PTI7VP5A%3D%3D&numOfRows=10&pageSize=10&pageNo=1&startPage=1&arrange=A&listYN=Y&mapX="+pointX+"&mapY="+pointY+"&radius=4999&MobileOS=ETC&MobileApp=공유자원포털&_type=json");
		
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
			
			play.setAddr1((String)jsonTemp.get("addr1"));
			play.setAddr2(jsonTemp.get("addr2"));
			play.setFirstimage((String)jsonTemp.get("firstimage"));
			
			play.setMapx(jsonTemp.get("mapx"));
			play.setMapy(jsonTemp.get("mapy"));
			
			play.setReadcount((long)jsonTemp.get("readcount"));
			play.setTitle((String)jsonTemp.get("title"));
			
			playList.add(play);
		}
		
		return playList;
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String detail(int id, Model model) throws IOException, ParseException{
		Store store = storeDbMapper.detail(id);
			
		HashMap<String, Double> map = new HashMap<String, Double>();
		map = getGps(store.getSh_addr());
        
        model.addAttribute("store", store);
		model.addAttribute("playList", getPlayInfo(map.get("pointX"),map.get("pointY")));
		model.addAttribute("pointX", map.get("pointX"));
		model.addAttribute("pointY", map.get("pointY"));
		
        return "store/detail";
	}
	
	
	@RequestMapping(value="/detail/play", method=RequestMethod.POST)
	public @ResponseBody HashMap<Integer,HashMap<String, String>> play(Model model,@RequestParam(value="pointx") int pointX, @RequestParam(value="pointy") int pointY) throws IOException{
		
		return null;
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
		
		return "store/searchResult";
	}
	
	@RequestMapping(value="/searchJson",method = RequestMethod.GET)
	public @ResponseBody HashMap<Integer, Store> searchAllJson() throws IOException, ParseException{
		List<Store> store = new ArrayList<Store>();
		store = storeMapper.webSelectAll();
		
		HashMap<Integer, Store> mapList = new HashMap<Integer, Store>();
		Store storeOb = null;
		
		for(int i=0;i<store.size();i++){
			storeOb = new Store();
			storeOb = store.get(i);
			
			HashMap<String, Double> map = new HashMap<String, Double>();
			map = getGps(store.get(i).getSh_addr());
			
			storeOb.setPointX(map.get("pointX"));
			storeOb.setPointY(map.get("pointY"));
			
			mapList.put(i, storeOb);
		}
		
		return mapList;
	}
	
}
