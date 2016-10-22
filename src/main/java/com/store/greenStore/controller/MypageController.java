package com.store.greenStore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.greenStore.mapper.MypageMapper;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Autowired MypageMapper mypageMapper;

	@RequestMapping(value="/reviewLike")
	public String reviewLike(Model model, @RequestParam("mid") int mid) {
		model.addAttribute("reviewlike", mypageMapper.reviewLike(mid));
		return "mypage/reviewLike";
	}

	@RequestMapping(value="/storeLike")
	public String storeLike(Model model, @RequestParam("mid") int mid) {
		model.addAttribute("storelike", mypageMapper.storeLike(mid));
		return "mypage/storeLike";
	}
	
	
}
