package com.store.greenStore;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.greenStore.dto.Member;
import com.store.greenStore.dto.Review;
import com.store.greenStore.dto.ReviewLike;
import com.store.greenStore.dto.Store;
import com.store.greenStore.mapper.RvLikeMapper;
import com.store.greenStore.mapper.RvMapper;

@Controller
@RequestMapping("/app/review")
public class AppReviewController {

	@Autowired
	RvMapper rvmapper;
	
	@Autowired
	RvLikeMapper rvLikeMapper;
	
	@RequestMapping(value="/one", method=RequestMethod.GET)
	public @ResponseBody List<Review> reviewOne(@RequestParam("sh_id") int sh_id){
//		rvmapper.select(sh_id);
		return rvmapper.select(sh_id);
	}
	
	@RequestMapping(value="/oneStore/{sh_id}", method=RequestMethod.GET)
	public @ResponseBody List<Review> reviewOneStore(@PathVariable("sh_id") int sh_id){
		System.out.println(sh_id);
		
		return rvmapper.oneStore(sh_id);
	}
	
	
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
	public @ResponseBody List<Review> reviewAll(){
//		rvmapper.listAll();
		return rvmapper.listAll();
	}
	
	

	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public @ResponseBody void reviewWrtie(Review review){
		System.out.println(review.getMkey()+" / "+review.getRcontent()+" / "+review.getSh_id());
		
		rvmapper.insert(review);
		
	}

	@RequestMapping(value="/update", method=RequestMethod.POST)
	public @ResponseBody void reviewUpdate(Review review){
		System.out.println(review.getMkey()+" / "+review.getRcontent()+" / "+review.getSh_id());
		rvmapper.update(review);
		
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public @ResponseBody void reviewDelete(Review review){
		rvmapper.delete(review.getRkey());
		
	}
	
	@RequestMapping(value="/like", method=RequestMethod.GET)
	public @ResponseBody void reviewLike(ReviewLike reLike){
		ReviewLike myLike = rvLikeMapper.select(reLike);
		if(myLike != null)
			rvmapper.reUnlike(myLike.getRkey());
		else
			rvmapper.reLike(myLike.getRkey());
		
	}
	
	@RequestMapping(value="/appReviewCateSearch/{area}/{cate}", method=RequestMethod.GET)
	public @ResponseBody List<Review> reviewCateSearch(@PathVariable("area")String area,@PathVariable("cate")String cate){
		System.out.println(area +" ~~ " +cate);
		if(cate.equals("운동시설"))
			cate = "수영장"; // 수영장, 볼링장, 당구장, 골프장 등등.
		return rvmapper.appReviewCateSearch(area, cate);
	}
	

	
}
