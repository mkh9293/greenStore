package com.store.greenStore;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.greenStore.dto.Store;
import com.store.greenStore.mapper.StoreMapper;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	StoreMapper storeMapper;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	// 안드로이드용
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public @ResponseBody List<Stoe> home(Model model) {
//		return storeMapper.selectAll();
//	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		List<Store> store = new ArrayList<Store>();
		store = storeMapper.webSelectAll();
		String[] areaList= {"강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구"
				,"노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구"
				,"송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"};
		//String[] cateList = {"한식","중식","일식","기타외식 ","미용업 ","목욕업 ","세탁업 ","숙박업 ","기타 "};
		HashMap<Integer, String> cateMap = new HashMap<Integer, String>();
		
		cateMap.put(1, "한식");
		cateMap.put(2, "중식");
		cateMap.put(3, "일식");
		cateMap.put(4, "기타외식");
		cateMap.put(5, "미용업");
		cateMap.put(6, "목욕업");
		cateMap.put(7, "세탁업");
		cateMap.put(8, "숙박업");
		cateMap.put(13, "기타");
		
		ArrayList<String> localList = new ArrayList<String>();
		
		for(int i=0;i<store.size();i++){
			String[] tempList = store.get(i).getSh_addr().split(" ");
			localList.add(tempList[1]);
		}
		
		
		model.addAttribute("store",store);
		model.addAttribute("areaList",areaList);
		//model.addAttribute("cateList",cateList);
		model.addAttribute("cateMap",cateMap);
		model.addAttribute("localList", localList);
		
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login(Model model) {
	
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logout(Model model) {
		
	}
		
	@RequestMapping(value="/search/{searchText}",method = RequestMethod.GET)
	public @ResponseBody List<Store> search(@PathVariable("searchText")String searchText){
		List<Store> storeList = storeMapper.search(searchText);
		
		
		return storeList;
	}
	
	@RequestMapping(value="/search/{area}/{cate}",method = RequestMethod.GET)
	public @ResponseBody List<Store> cateSearch(@PathVariable("area")String area,@PathVariable("cate")String cate){
		//cate 가 음식으로 오면 한식,중식,일식
		List<Store> storeList = storeMapper.cateSearch(area,cate);
		
		return storeList;

	}
}
