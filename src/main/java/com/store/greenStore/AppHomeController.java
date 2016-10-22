package com.store.greenStore;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.greenStore.dto.LikeDto;
import com.store.greenStore.dto.Member;
import com.store.greenStore.dto.Store;
import com.store.greenStore.mapper.LikeMapper;
import com.store.greenStore.mapper.MemberMapper;
import com.store.greenStore.mapper.StoreDbMapper;
import com.store.greenStore.mapper.StoreMapper;

@Controller
@RequestMapping("/app")
public class AppHomeController {
	@Autowired
	StoreMapper storeMapper;
	@Autowired
	MemberMapper memberMapper;
	@Autowired
	StoreDbMapper storeDbMapper;
	@Autowired
	LikeMapper likeMapper;
	
	@RequestMapping(value = "/{start}", method = RequestMethod.GET)
	public @ResponseBody List<Store> home(@PathVariable("start")int start) {
		System.out.println(start + " /start");
		return storeMapper.selectAll(start,6);
	}
	
	//멤버를 조회하는 액션 메소드
	@RequestMapping(value = "/memberLookup", method = RequestMethod.POST)
	public @ResponseBody List<LikeDto> memberLookup(Member member) {
		System.out.println("test123123s");
		int mkey = 0;
		
		//멤버를 조회한다.
		Member result = memberMapper.selectMember(member.getMid());
		
		//만약 멤버가 null이면 result값에 mkey의 값에 0 삽입
		if(result == null) {
			result = new Member(); 
			result.setMkey(mkey);
		}
		
		LikeDto likeDto = new LikeDto();
		List<LikeDto> like = new ArrayList<LikeDto>();
		
		//사용자 조회 후 이미 회원이 존재하면 like 정보들을 리턴. 만약 like한게 없으면 like.size()는 0 이됨.
		if(result.getMkey()!=mkey){
			System.out.println("1");
			likeDto.setMkey(result.getMkey());
			like = likeMapper.searchLikeByMkey(likeDto.getMkey());
			if(like.size() == 0){
				likeDto.setRkey("");
				likeDto.setSh_id("");
				like.add(likeDto);
			}
		}else{
			System.out.println("2");
			//사용자 조회 후 회원이 존재하지 않으면 정보 저장 후 값 리턴.
			memberMapper.insertUser(member);
			likeDto.setMkey(member.getMkey());
			like.add(likeDto);
		}
		return like;
	}
	
	@RequestMapping("/search/{searchText}")
	public @ResponseBody List<Store> search(@PathVariable("searchText")String searchText){
		return storeMapper.search(searchText);
	}
	
	@RequestMapping("/cateSearch/{area}/{cate}")
	public @ResponseBody List<Store> appCateSearch(@PathVariable("area")String area,@PathVariable("cate")String cate){
		System.out.println(area +" ~~ " +cate);
		if(cate.equals("운동시설"))
			cate = "수영장"; // 수영장, 볼링장, 당구장, 골프장 등등.
		return storeMapper.appCateSearch(area, cate);
	}
	
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public @ResponseBody String home(Model model) {
//		System.out.println("sssss");
//		return "success1111";	
//	}
	
	
}
