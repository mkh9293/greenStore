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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.greenStore.dto.Play;
import com.store.greenStore.dto.Store;
import com.store.greenStore.mapper.StoreMapper;

@Controller
@RequestMapping(value="/json/*")
public class JsonController {
	@Autowired
	StoreMapper storeMapper;
	
	private final String appkey = "01b35d68e4ea90f252393375e98e3958";
	
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
	
	@RequestMapping(value="/searchJson",method = RequestMethod.GET)
	public @ResponseBody HashMap<Integer, Store> searchAllJson() throws IOException, ParseException{
		List<Store> store = storeMapper.selectAll();
		
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
	
	@RequestMapping(value="/searchTextJson",method = RequestMethod.GET)
	public @ResponseBody HashMap<Integer, Store> searchTextJson(String searchText) throws IOException, ParseException{
		List<Store> store =  storeMapper.search(searchText);
		
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
	
	@RequestMapping(value="/searchConditionJson",method = RequestMethod.GET)
	public @ResponseBody HashMap<Integer, Store> searchConditionJson(String area, String cate) throws IOException, ParseException{
		System.out.println("area: "+area+ " cate: "+cate);
		
		List<Store> store = storeMapper.cateSearch(area,cate);
		
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
		
	public HashMap<String, Double> getInsta(String storeName) throws IOException, ParseException{
		HashMap<String, Double> map = new HashMap<String, Double>();
		
		String token = "1971019434.7fc9473.b2be7841c1204ec4a121fec04ac686ea";
		
		System.out.println("storeName: "+storeName);
		URL url = new URL("https://api.instagram.com/v1/tags/"+URLEncoder.encode(storeName, "UTF-8")+"/media/recent?access_token="+token);
		URL url2 = new URL("https://api.instagram.com/v1/tags/"+URLEncoder.encode(storeName, "UTF-8")+"?access_token="+token);
		
		URLConnection yc = url2.openConnection();
		BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
		String inputLine = "";
		String ins = "";
		
		while ((inputLine = in.readLine()) != null) {
			ins += inputLine;
			System.out.println(inputLine);
		}
		
		JSONParser jsonParser = new JSONParser();
         
        //JSON데이터를 넣어 JSON Object 로 만들어 준다.
        JSONObject jsonObject = (JSONObject) jsonParser.parse(ins);
        
        JSONArray jsonArray = new JSONArray();
        jsonArray = (JSONArray) jsonObject.get("dtaa");
        System.out.println(jsonArray);
        
        System.out.println("result");
        
        for(int i=0;i<jsonArray.size();i++){
        	JSONObject jb = (JSONObject)jsonArray.get(i);
        	System.out.println(jb);
        }
		
        return map;
	}
	
	@RequestMapping(value="/regionBestList",method = RequestMethod.POST)
	public @ResponseBody HashMap<Integer, Store> regionBestListJson(String region) throws IOException, ParseException{
		List<Store> store = null;
		
		if("전체".equals(region)){
			store = storeMapper.webSelectAll();
		}else{
			store = storeMapper.region(region);
		}
		
		HashMap<Integer, Store> regionList = new HashMap<Integer, Store>();
		Store storeOb = null;
		
		for(int i=0;i<store.size();i++){
			storeOb = new Store();
			storeOb = store.get(i);
			
			regionList.put(i, storeOb);
		}
		
		return regionList;
	}
}
