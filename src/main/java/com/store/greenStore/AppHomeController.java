package com.store.greenStore;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.greenStore.dto.Store;
import com.store.greenStore.mapper.StoreMapper;

@Controller
@RequestMapping("/app")
public class AppHomeController {
	
	@Autowired
	StoreMapper storeMapper;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public @ResponseBody List<Store> home() {
		return storeMapper.selectAll();
	}
	
	@RequestMapping("/search/{searchText}")
	public @ResponseBody List<Store> search(@PathVariable("searchText")String searchText){
		return storeMapper.search(searchText);
	}
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public @ResponseBody String home(Model model) {
//		System.out.println("sssss");
//		return "success1111";	
//	}
	
	
}
