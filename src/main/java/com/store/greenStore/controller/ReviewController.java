package com.store.greenStore.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.greenStore.dto.Member;
import com.store.greenStore.dto.Notice;
import com.store.greenStore.dto.Review;
import com.store.greenStore.mapper.MemberMapper;
import com.store.greenStore.mapper.RvMapper;

@Controller
@RequestMapping(value="/review/*")
public class ReviewController {
	@Autowired
	RvMapper rvMapper;
	
	@Autowired
	MemberMapper memberMapper;
	
	//전체 리뷰 조회
	@RequestMapping(value="/listAll")
	public String list(Model model, HttpSession session) {
		Member vo = (Member)session.getAttribute("member");
		int mk = 0;
		if(vo !=null){
			mk = vo.getMkey();
		}
		model.addAttribute("review", rvMapper.weblistAll(mk));
		model.addAttribute("member", vo);
		
		return "review/listAll";
	}
	
	//내가 작성한 리뷰 보기
	@RequestMapping(value="/myReview")
	public String myReview(Model model, @RequestParam("mid") int mid) {
		model.addAttribute("review", rvMapper.myReview(mid));
		return "review/myReview";
	}
	
	//리뷰 수정
	@RequestMapping(value="/reviewUpdate")
	 public String reviewUpdate(Model model, @RequestParam("rkey") int rkey, HttpServletRequest request,HttpSession session) {
		String rcontent = request.getParameter("rcontent");
		int mid = Integer.parseInt(request.getParameter("mid"));
		Review review = new Review();
		review.setRkey(rkey);
		review.setRcontent(rcontent);
		rvMapper.update(review);
		return "redirect:/review/myReview?mid="+mid;
	 }
	
	//리뷰삭제
	@RequestMapping(value="/reviewRemove")
	 public String reviewRemove(HttpServletRequest request, @RequestParam("rkey") int rkey, HttpSession session) {
		int mid = rvMapper.findMid(rkey);
		rvMapper.delete(rkey);
	  return "redirect:/review/myReview?mid="+mid;
	 }
	
}
