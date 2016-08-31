package com.store.greenStore.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.greenStore.dto.Notice;
import com.store.greenStore.dto.Pagination;
import com.store.greenStore.mapper.NoticeMapper;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	@Autowired NoticeMapper noticeMapper;
	
	@RequestMapping(value="/list")
	public String list(Model model, Pagination pagination) {
		pagination.setRecordCount(noticeMapper.selectCount(pagination));
		model.addAttribute("list", noticeMapper.selectPage(pagination));
		return "notice/list";
	}
	
	@RequestMapping(value="/write", method = RequestMethod.GET)
	public String write(Model model, Pagination pagination) {
		return "notice/write";
	}
	
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String write(HttpServletRequest request, Model model, Pagination pagination) {
		
		return "rediret:/notice/list?" + pagination.getQueryString();
	}
	
	@RequestMapping(value = "/listOne", method = RequestMethod.GET)
	public String listOne(Model model, @RequestParam("nkey") int nkey, Pagination pagination) throws Exception {
		model.addAttribute("notice", noticeMapper.listOne(nkey));
		return "notice/listOne";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(Model model, @RequestParam("nkey") int nkey, Pagination pagination) {
		model.addAttribute("notice",noticeMapper.listOne(nkey));
		return "notice/update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Model model, Pagination pagination, Notice board) {
		noticeMapper.update(board);
		return "redirect:/notice/listOne?nkey=" + board.getNkey() + "&" + pagination.getQueryString();
	}

	@RequestMapping("/delete")
	public String delete(Model model, @RequestParam("nkey") int nkey, Pagination pagination) {
		noticeMapper.remove(nkey);
		return "redirect:/notice/list?" + pagination.getQueryString();
	}

}
