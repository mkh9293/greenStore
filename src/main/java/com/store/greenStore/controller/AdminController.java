package com.store.greenStore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.store.greenStore.dto.Member;
import com.store.greenStore.mapper.MemberMapper;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired MemberMapper memberMapper;
	
	//mid=123456789 mname="admin"으로 로그인
	@RequestMapping("/login")
	public void login(Member member){
		
		
	}

	
}
