package com.store.greenStore;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.greenStore.dto.Review;
import com.store.greenStore.mapper.RvMapper;

@Controller
@RequestMapping("/app/Review")
public class AppReviewController {

	@Autowired
	RvMapper rvmapper;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public @ResponseBody List<Review> review(Model model){
		return rvmapper.listAll();
	}
	
	
	
	
	
	
}
