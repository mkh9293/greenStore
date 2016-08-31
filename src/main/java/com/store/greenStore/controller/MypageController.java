package com.store.greenStore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.store.greenStore.dto.Pagination;
import com.store.greenStore.mapper.MypageMapper;
import com.store.greenStore.mapper.NoticeMapper;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Autowired MypageMapper mypageMapper;
	
	@RequestMapping(value="/")
	public String selectStoreLike(Model model) {
		model.addAttribute("selectStoreLike", mypageMapper.selectStoreLike());
		return "mypage";
	}
	
	@RequestMapping(value="/review")
	public String selectReviewLike(Model model) {
		model.addAttribute("selectReviewLike", mypageMapper.selectReviewLike());
		return "mypage/review";
	}
	
	@RequestMapping(value="/review/sort")
	public String sort(Model model) {
		
		return "mypage/review/sort";
	}
	
	
}
