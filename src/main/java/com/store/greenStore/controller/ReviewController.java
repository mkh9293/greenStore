package com.store.greenStore.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.greenStore.dto.Notice;
import com.store.greenStore.dto.Review;
import com.store.greenStore.mapper.RvMapper;

@Controller
@RequestMapping(value="/review/*")
public class ReviewController {
	@Autowired
	RvMapper rvMapper;
	
	//전체 리뷰 조회
	@RequestMapping(value="/listAll")
	public String list(Model model) {
		model.addAttribute("review", rvMapper.listAll());
		return "review/listAll";
	}
	//내가 작성한 리뷰 보기
	@RequestMapping(value="/myReview")
	public String myReview(Model model, @RequestParam("mid") int mid) {
		model.addAttribute("review", rvMapper.myReview(mid));
		return "review/myReview";
	}
	//글작성
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public String write(Model model, Notice board) {
		return "review/write";
	}
	
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String write(HttpServletRequest request, Model model, Review rv) {
		rvMapper.insert(rv);
    	return "redirect:/review/listAll";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(Model model, @RequestParam("rkey") int rkey, Review rv) {
		model.addAttribute("review", rvMapper.selectById(rkey));
		return "review/update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Model model, Review rv) {
		rvMapper.update(rv);
		return "redirect:/reivew/listAll";
	}

	@RequestMapping("/delete")
	public String delete(Model model, @RequestParam("rkey") int rkey) {
		rvMapper.delete(rkey);
		return "redirect:/review/listAll";
	}
	
		
//	@RequestMapping("/write")
//	public String reviewInsert(Review rv,  @RequestParam("sh_id") int sh_id, @RequestParam("mkey") int mkey, @RequestParam("rcontent") String rcontent){
//		
//		//임시로 내가 넣어준 값임. 후에는 rv만 받아와서 바로 insert하는 것으로.
////		Review rvexam = new Review();
////		rvexam.setMkey(1);
////		rvexam.setSh_id(9018);
////		rvexam.setRelike(110);
////		rvexam.setRcontent("맛있네요");
//		//↑여기까지 필요없음
////		rvMapper.insert(rvexam);
//		
//		rv.setMkey(mkey);
//		rv.setRcontent(rcontent);
//		rv.setRelike(0);
//		rv.setSh_id(sh_id);
//		rvMapper.insert(rv);
//		System.out.println("삽입성공");
//		return "store/detail?id="+sh_id;
//	}
//	
//	@RequestMapping("/reviewUpdate")
//	public void reviewUpdate(@RequestParam("rkey") int rkey){
//	//이렇게 써주려면 url에 reviewUpdate?rkey=1 이런식으로 직접 써주어야 에러가 안남.
//		Review rv = new Review();
////		rv.setRkey(rkey);
//		rv.setRkey(1);
//		rv.setRcontent("호이호");
//		rvMapper.update(rv);
//		System.out.println("수정완료");
//	}
//	
//	@RequestMapping("/reviewDelete")
////	public void reviewDelete(@RequestParam("rkey") int rkey){
//	public void reviewDelete(){
//		System.out.println("삭제하러간다");
//		rvMapper.delete(1);
//	}
//	
//	@RequestMapping("/select")
//	public void reviewOne(@RequestParam("sh_id") int sh_id){
//		
//		System.out.println();
//	}
	
	
	
}
