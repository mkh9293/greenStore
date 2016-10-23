package com.store.greenStore;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.greenStore.dto.Play;
import com.store.greenStore.dto.Review;
import com.store.greenStore.dto.Store;
import com.store.greenStore.dto.StoreLike;
import com.store.greenStore.mapper.LikeMapper;
import com.store.greenStore.mapper.RvMapper;
import com.store.greenStore.mapper.StoreDbMapper;
import com.store.greenStore.service.AppDetailService;

@Controller
@RequestMapping("/app")
public class AppDetailController {

	@Autowired
	StoreDbMapper storeDbMapper;
	@Autowired
	LikeMapper likeMapper;
	@Autowired
	AppDetailService appDetailService;
	@Autowired
	RvMapper rvMapper;
	
	@RequestMapping("/detail/{sh_id}")
	public @ResponseBody Map<String,List> appDetail(@PathVariable("sh_id") int sh_id) throws IOException, ParseException {
		Map<String,List> detailList = new HashMap<>();
		
		List<Store> storeList = storeDbMapper.appDetail(sh_id);
		Map<String, Double> map = appDetailService.getGps(storeList.get(0).getSh_addr());
		if(map.get("pointX")==null){
			storeList.get(0).setPointX(0);
			storeList.get(0).setPointY(0);
		}else{ 
			storeList.get(0).setPointX(map.get("pointX"));
			storeList.get(0).setPointY(map.get("pointY"));
		}
		List<Review> reviewList = rvMapper.select(sh_id);
		
		detailList.put("storeList", storeList);
		detailList.put("reviewList", reviewList);
		System.out.println(map.get("pointX")+" / "+map.get("pointY"));
		
		
		if(map.get("pointX")!=null){
			List<Play> playList = appDetailService.getPlayInfo(map.get("pointX"), map.get("pointY"));
			System.out.println(playList.size() + " / playList");
			Collections.shuffle(playList);
			detailList.put("playList",playList);
		}
		
		return detailList;
	}

	// 스토어 좋아요 메소드
	@RequestMapping("/storeLike")
	public @ResponseBody void storeLike(StoreLike storeLike) {
		System.out.println(storeLike.getMkey() + " / " + storeLike.getSh_id());
		likeMapper.storeLikeUp(storeLike.getSh_id());
		likeMapper.storeLike(storeLike);
	}

}
