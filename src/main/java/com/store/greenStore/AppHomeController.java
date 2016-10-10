package com.store.greenStore;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.greenStore.dto.Member;
import com.store.greenStore.dto.Store;
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
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public @ResponseBody List<Store> home() {
		return storeMapper.selectAll();
	}
	
	//멤버를 조회하는 액션 메소드
	@RequestMapping(value = "/memberLookup", method = RequestMethod.POST)
	public @ResponseBody int memberLookup(Member member) {
		int mkey = 0;
		Member result = memberMapper.selectMember(member.getMid());
		if(result!=null){
			mkey = result.getMkey();
		}else{
			memberMapper.insertUser(member);
		}
		mkey = member.getMkey();
		return mkey;
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
	
	@RequestMapping("/detail/{sh_id}")
	public @ResponseBody List<Store> appDetail(@PathVariable("sh_id")int sh_id){
		return storeDbMapper.appDetail(sh_id);
	}
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public @ResponseBody String home(Model model) {
//		System.out.println("sssss");
//		return "success1111";	
//	}
	
	
}
