package com.store.greenStore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.store.greenStore.dto.Member;
import com.store.greenStore.mapper.MemberMapper;

@Controller
public class MemberController {
	@Autowired MemberMapper memberMapper;

//	@RequestMapping(value ="/join", method = RequestMethod.GET)
//	public void registerGET(Member member, Model model) throws Exception{
//		
//	}
//	
//	@RequestMapping(value ="/join", method = RequestMethod.POST)
//	public String registerPOST(Member member, RedirectAttributes rttr) throws Exception{
//		
//		
//		memberMapper.insertUser(member);
//		
//		return "redirect:/user/login";
//	}
	
	@RequestMapping("/join")
	public int registerPOST(Member member){
		System.out.println("teee");
		System.out.println(member.getMid()+" =mid "+member.getMname()+" =mname "+member.getMphoto()+" =photo");
		return 1;
	}
	
}
