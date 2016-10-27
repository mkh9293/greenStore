package com.store.greenStore.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.greenStore.dto.Notice;
import com.store.greenStore.mapper.NoticeMapper;

@Controller

@RequestMapping("/notice/*")
public class NoticeController {
	@Autowired NoticeMapper noticeMapper;
	
	//글 전체 조회
	@RequestMapping(value="/listAll")
	public String list(Model model) {
		model.addAttribute("list", noticeMapper.listAll());
		return "notice/listAll";
	}

	//글작성
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public String write(Model model, Notice board) {
		return "notice/write";
	}
	
	@RequestMapping(value="/write")
	public String write(HttpServletRequest request, Model model, Notice board) {
		noticeMapper.write(board);
    	return "redirect:/notice/listAll";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(Model model, @RequestParam("nkey") int nkey, Notice board) {
		model.addAttribute("board", noticeMapper.selectById(nkey));
		return "notice/update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Model model, Notice board) {
		noticeMapper.update(board);
		return "redirect:/notice/listAll";
	}

	@RequestMapping("/delete")
	public String delete(Model model, @RequestParam("nkey") int nkey) {
		noticeMapper.delete(nkey);
		return "redirect:/notice/listAll";
	}
	//서비스페이지
	@RequestMapping("/service")
	public String service(Model model) {
		return "notice/service";
	}

}
