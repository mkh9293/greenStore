package com.store.greenStore;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.greenStore.dto.Review;
import com.store.greenStore.dto.Store;
import com.store.greenStore.mapper.LikeMapper;

@Controller
@RequestMapping("/app")
public class AppMyController {
	
	@Autowired LikeMapper likeMapper;
	
	@RequestMapping("/myStoreLike/{mkey}")
	public @ResponseBody List<Store> myStoreLike(@PathVariable("mkey")int mkey){
		return likeMapper.searchLikeStoreByMkey(mkey);
	}
	
	@RequestMapping("/myReviewLike/{mkey}")
	public @ResponseBody List<Review> myReviewLike(@PathVariable("mkey")int mkey){
		return likeMapper.searchLikeReviewByMkey(mkey);
	}
	
}
