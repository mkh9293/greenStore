package com.store.greenStore;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.greenStore.dto.Store;
import com.store.greenStore.mapper.StoreMapper;

@Controller
@RequestMapping("/android")
public class AppHomeController {
	
	@Autowired
	StoreMapper storeMapper;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public @ResponseBody List<Store> home(Model model) {
		return storeMapper.appSelectAll();
	}
	
}
