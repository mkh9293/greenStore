package com.store.greenStore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.greenStore.dto.Review;
import com.store.greenStore.mapper.RvMapper;

@Controller
public class ReviewController {
	@Autowired
	RvMapper rvMapper;
	
	
	@RequestMapping("/reviewWrite")
	public void reviewInsert(Review rv){
		
		//임시로 내가 넣어준 값임. 후에는 rv만 받아와서 바로 insert하는 것으로.
		Review rvexam = new Review();
		rvexam.setMkey(1);
		rvexam.setSh_id(9018);
		rvexam.setRelike(110);
		rvexam.setRcontent("맛있네요");
		//↑여기까지 필요없음
		
		rvMapper.insert(rvexam);
		System.out.println("삽입성공");
	}
	
	@RequestMapping("/reviewUpdate")
	public void reviewUpdate(@RequestParam("rkey") int rkey){
	//이렇게 써주려면 url에 reviewUpdate?rkey=1 이런식으로 직접 써주어야 에러가 안남.
		
		Review rv = new Review();
//		rv.setRkey(rkey);
		rv.setRkey(1);
		rv.setRcontent("호이호");
		
		rvMapper.update(rv);
		System.out.println("수정완료");
	}
	
	@RequestMapping("/reviewDelete")
//	public void reviewDelete(@RequestParam("rkey") int rkey){
	public void reviewDelete(){
		System.out.println("삭제하러간다");
		rvMapper.delete(1);
	}
	
	/* 리뷰 하나 만드는 것 - 쿼리만 짜놓고 만들진 않음. 이건 상세보기에서 ! ^0^
	@RequestMapping("/select")
	public void reviewOne(@RequestParam("sh_id") int sh_id){
		System.out.println();
	}
	*/
	
	
	@RequestMapping("/listAll")
	public void listAll(){
		List<Review> rvlist = rvMapper.listAll();
		for(Review rv : rvlist){
			System.out.println("=============================");
			System.out.println(rv.getRkey());
			System.out.println(rv.getMkey());
			System.out.println(rv.getSh_id());
			System.out.println(rv.getRcontent());
			System.out.println(rv.getRelike());
			System.out.println(rv.getRdate());
			System.out.println("=============================");
		}
		
	}
	
	
}
