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
	
	@RequestMapping(value="/list")
	public String list(Model model) {

		return "notice/list";
	}

	@RequestMapping(value="/write", method = RequestMethod.GET)
	public String write(Model model) {
		return "notice/write";
	}
	
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String write(HttpServletRequest request, Model model) {
		
		return "rediret:/notice/list";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(Model model, @RequestParam("nkey") int nkey) {
		model.addAttribute("notice",noticeMapper.listOne(nkey));
		return "notice/update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Model model, Notice board) {
		noticeMapper.update(board);
		return "redirect:/notice/listOne?nkey=" + board.getNkey();
	}

	@RequestMapping("/delete")
	public String delete(Model model, @RequestParam("nkey") int nkey) {
		noticeMapper.remove(nkey);
		return "redirect:/notice/list?";
	}

}
