package com.store.greenStore;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.greenStore.dto.Notice;
import com.store.greenStore.dto.Store;
import com.store.greenStore.mapper.NoticeMapper;

@Controller
@RequestMapping("/app/notice")
public class AppNoticeController {
	
	@Autowired
	NoticeMapper noticeMapper;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public @ResponseBody List<Notice> notice(Model model) {
		return noticeMapper.listAll();
	}
}
	
