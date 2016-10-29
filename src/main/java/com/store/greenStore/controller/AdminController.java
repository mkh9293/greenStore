package com.store.greenStore.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.store.greenStore.dto.Member;
import com.store.greenStore.mapper.MemberMapper;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired MemberMapper memberMapper;
	
	//mid=123456789 mname="admin"으로 로그인
	@RequestMapping("/adminLogin")
	public String login(Model model, Member member, HttpServletRequest request, HttpSession session){
		String mid = request.getParameter("mid");
		String mname = request.getParameter("mname");
		
	    int mkey = 0;
		Member result = memberMapper.selectMember(mid);
		
		if(result == null) {
			result = new Member(); 
			result.setMkey(mkey);
		}
		
		if(result.getMkey() != mkey) {
			System.out.println("디비에 저장되어있음.");
		} else {
			System.out.println("디비에 없음.");
			return "admin/adminLogin";
		}

        member = new Member();
        member.setMid(mid);
        member.setMname(mname);
        member.setMphoto("NULL");
        session.setAttribute("member", member);
        
        System.out.println(member.getMid());
		session = request.getSession(false);
			if(session!=null){
				Member vo = (Member)session.getAttribute("member");
				if(vo!=null){
					System.out.println(vo.getMphoto()+ " / "+vo.getMid()+ " / "+vo.getMkey());
					model.addAttribute("member", vo);
				}
			}
		
		return "redirect:/";
	}
	
	//세션 로그아웃
	@RequestMapping(value = "/adminLogout", method = RequestMethod.GET)
	public String logout(Model model,HttpSession session, HttpServletRequest request) {
		session.invalidate();
		System.out.println("세션바이바이");
		if(session != null){
			System.out.println("세션안사라짐...");
		}
		return "redirect:/";
	}

	
}
