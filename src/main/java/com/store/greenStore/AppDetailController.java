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
import com.store.greenStore.dto.Store;
import com.store.greenStore.dto.StoreLike;
import com.store.greenStore.mapper.LikeMapper;
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

	@RequestMapping("/detail/{sh_id}")
	public @ResponseBody Map<String,List> appDetail(@PathVariable("sh_id") int sh_id) throws IOException, ParseException {
		List<Store> storeList = storeDbMapper.appDetail(sh_id);
		HashMap<String, Double> map = appDetailService.getGps(storeList.get(0).getSh_addr());
		Map<String,List> detailList = new HashMap<>();
		detailList.put("storeList", storeList);
		
		System.out.println(map.get("pointX")+" / "+map.get("pointY"));
		
		
		if(map.get("pointX")!=null){
			List<Play> playList = appDetailService.getPlayInfo(map.get("pointX"), map.get("pointY"));
			Collections.shuffle(playList);
			detailList.put("playList",playList);
//			for(Play item : playList){
//				for(int i=0;i<4;++i){
//					Store st = new Store();
//					st.setAddr1(item.getAddr1());
//					st.setAddr2(item.getAddr2());
//					st.setFirstimage(item.getFirstimage());
//					st.setTitle(item.getTitle());
//					storeList.add(st);
//				}
//			}
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
