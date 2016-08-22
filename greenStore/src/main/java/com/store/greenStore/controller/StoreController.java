package com.store.greenStore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.store.greenStore.dto.Store;
import com.store.greenStore.mapper.StoreDbMapper;

@Controller
@RequestMapping(value="/store/*")
public class StoreController {
	
	@Autowired
	StoreDbMapper storeDbMapper;
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String detail(int id,Model model){
		Store store = storeDbMapper.detail(id);
		
		model.addAttribute("store", store);
		
		return "store/detail";
	}
	
	@RequestMapping(value="/detail/play", method=RequestMethod.GET)
	public String play(int id, Model model){
		
		return "store/play";
	}
	
	@RequestMapping(value="detail/navi", method=RequestMethod.GET)
	public String navi(int id,Model model){
		Store store = storeDbMapper.detail(id);
		
		model.addAttribute("store", store);
		
		return "store/detail";
	}
}
