package com.store.greenStore;

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
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		return "home";
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
