package com.store.greenStore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/member/*")
public class MemberController {
	
	@RequestMapping(value="/loginForm")
	public String loginForm(Model model){
		return "member/loginForm";
	}

	
}