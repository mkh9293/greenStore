package com.store.greenStore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.store.greenStore.dto.Member;
import com.store.greenStore.mapper.MemberMapper;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Autowired MemberMapper memberMapper;

	@RequestMapping("/login")
	public void registerPOST(Member member){
		/*memberMapper.insertUser(member);*/
	}
	
}
