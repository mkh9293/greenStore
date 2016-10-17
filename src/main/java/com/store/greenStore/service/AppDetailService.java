package com.store.greenStore.service;

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
import org.springframework.stereotype.Service;

import com.store.greenStore.dto.Play;

@Service
public class AppDetailService {
	// daum appkey
	private final String appkey = "01b35d68e4ea90f252393375e98e3958";
	// data.go.kr appkey
	private final String serviceKey = "Hg3hdDoudw4mO5fh6hxBa3XnJBF2Zdr3o9s1EZu04FYctqRNkH2g5eEAWqF1xyivTDrUtwE5gWb0U9PTI7VP5A%3D%3D";

	// 주소를 좌표로 변경
	public HashMap<String, Double> getGps(String addr) throws IOException, ParseException {
		HashMap<String, Double> map = new HashMap<String, Double>();

		URL url = new URL("https://apis.daum.net/local/geo/addr2coord?apikey=" + appkey + "&q="
				+ URLEncoder.encode(addr, "UTF-8") + "&output=json");

		URLConnection yc = url.openConnection();
		BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
		String inputLine = "";
		String ins = "";

		while ((inputLine = in.readLine()) != null) {
			ins += inputLine;
		}

		JSONParser jsonParser = new JSONParser();

		// JSON데이터를 넣어 JSON Object 로 만들어 준다.
		JSONObject jsonObject = (JSONObject) jsonParser.parse(ins);
		jsonObject = (JSONObject) jsonObject.get("channel");

		JSONArray jsonArray = new JSONArray();
		jsonArray = (JSONArray) jsonObject.get("item");

		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject jb = (JSONObject) jsonArray.get(i);
			map.put("pointX", (double) jb.get("point_x"));
			map.put("pointY", (double) jb.get("point_y"));
		}

		return map;
	}

	// 놀거리 정보 리턴
	public ArrayList<Play> getPlayInfo(double pointX, double pointY) throws IOException, ParseException {
		HashMap<String, String> codeList = getServiceCode();

		URL url = new URL("http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey="
				+ serviceKey + "&numOfRows=10&pageSize=10&pageNo=1&startPage=1&arrange=A&listYN=Y&mapX=" + pointX
				+ "&mapY=" + pointY + "&radius=4999&MobileOS=ETC&MobileApp=공유자원포털&_type=json");

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

		JSONArray arrayResult = new JSONArray();
		arrayResult = (JSONArray) jsonObject2.get("item");

		ArrayList<Play> playList = new ArrayList<Play>();

		for (int i = 0; i < arrayResult.size(); i++) {
			JSONObject jsonTemp = (JSONObject) arrayResult.get(i);
			Play play = new Play();

			play.setContentid(jsonTemp.get("contentid"));
			play.setAddr1((String) jsonTemp.get("addr1"));
			play.setAddr2(jsonTemp.get("addr2"));
			play.setFirstimage((String) jsonTemp.get("firstimage"));

			play.setMapx(jsonTemp.get("mapx"));
			play.setMapy(jsonTemp.get("mapy"));

			play.setReadcount((long) jsonTemp.get("readcount"));
			play.setTitle((String) jsonTemp.get("title"));

			play.setCat1(codeList.get((String) jsonTemp.get("cat1")));
			play.setSigungucode(jsonTemp.get("sigungucode"));

			playList.add(play);
		}

		return playList;
	}

	private HashMap<String, String> getServiceCode() {
		HashMap<String, String> codeList = new HashMap<String, String>();
		codeList.put("A01", "자연");
		codeList.put("A02", "인문(문화/예술/역사)");
		codeList.put("A03", "레포츠");
		codeList.put("A04", "쇼핑");
		codeList.put("A05", "음식");
		// 숙박 음식 빼고 ..
		codeList.put("B02", "숙박");
		codeList.put("C01", "추천코스");

		return codeList;
	}

	// 놀거리 상세정보 리턴
	public Play getPlayDetailInfo(String contentId) throws IOException, ParseException {
		HashMap<String, String> codeList = getServiceCode();
		URL url = new URL("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="
				+ serviceKey + "&contentId=" + contentId
				+ "&defaultYN=Y&mapImageYN=Y&firstImageYN=Y&overviewYN=Y&MobileOS=ETC&MobileApp=공유자원포털&numOfRows=999&pageSize=999&pageNo=1&startPage=1&_type=json");

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

		play.setFirstimage((String) jsonObject2.get("firstimage"));
		play.setFirstimage2((String) jsonObject2.get("firstimage2"));
		play.setTitle((String) jsonObject2.get("title"));
		play.setTel((String) jsonObject2.get("tel"));
		play.setCat1(codeList.get((String) jsonObject2.get("cat1")));
		play.setSigungucode((String) jsonObject2.get("sigungucode"));
		play.setOverview((String) jsonObject2.get("overview"));

		return play;
	}

}
