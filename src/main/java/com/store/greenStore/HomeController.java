package com.store.greenStore;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.store.greenStore.dto.Store;
import com.store.greenStore.mapper.StoreMapper;
import com.store.greenStore.service.FileUpload;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	StoreMapper storeMapper;
	
	  @RequestMapping(value = "/test", method = RequestMethod.GET)
	  public void ajaxTest() {

	  }
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model,HttpSession session,HttpServletRequest request) {
		List<Store> store = new ArrayList<Store>();
		List<Store> likeList = new ArrayList<Store>();
		List<String> regionLocal = new ArrayList<String>();
		
		store = storeMapper.webSelectAll();
		likeList = storeMapper.likeSelectAll();
		
		String[] areaList= {"강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구"
				,"노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구"
				,"송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"};
		//String[] cateList = {"한식","중식","일식","기타외식 ","미용업 ","목욕업 ","세탁업 ","숙박업 ","기타 "};
		HashMap<Integer, String> cateMap = new HashMap<Integer, String>();
		
		cateMap.put(1, "한식");
		cateMap.put(2, "중식");
		cateMap.put(3, "일식");
		cateMap.put(4, "기타외식");
		cateMap.put(5, "미용업");
		cateMap.put(6, "목욕업");
		cateMap.put(7, "세탁업");
		cateMap.put(8, "숙박업");
		cateMap.put(13, "기타");
		
		ArrayList<String> localList = new ArrayList<String>();
		
		for(int i=0;i<store.size();i++){
			String[] tempList = store.get(i).getSh_addr().split(" ");
			localList.add(tempList[1]);
		}
		
		model.addAttribute("store",store);
		model.addAttribute("likeList",likeList);
		model.addAttribute("areaList",areaList);
		//model.addAttribute("cateList",cateList);
		model.addAttribute("cateMap",cateMap);
		model.addAttribute("localList", localList);
		model.addAttribute("regionLocal", regionLocal);
		
		return "home";
	}
	
	//세션 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model,HttpSession session,HttpServletRequest request) {
		session.invalidate();
		logger.info("세션바이바이");
		if(session != null){
			logger.info("세션안사라짐...");
		}
		return "redirect:/";
	}
		
	@RequestMapping(value="/search/{searchText}",method = RequestMethod.GET)
	public @ResponseBody List<Store> search(@PathVariable("searchText")String searchText){
		List<Store> storeList = storeMapper.search(searchText);
		return storeList;
	}
	
	@RequestMapping(value="/search/{area}/{cate}",method = RequestMethod.GET)
	public @ResponseBody List<Store> cateSearch(@PathVariable("area")String area,@PathVariable("cate")String cate){
		//cate 가 음식으로 오면 한식,중식,일식
		List<Store> storeList = storeMapper.cateSearch(area,cate);
		return storeList;
	}
	
	//공지사항 파일업로드
	@RequestMapping(value = "/")
	public String home(Model model) {
		return "notice/write";
	}
	@RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
	public String fileUpload(Model model, MultipartRequest multipartRequest, HttpServletRequest request) throws IOException{
		MultipartFile imgfile = multipartRequest.getFile("Filedata");
		Calendar cal = Calendar.getInstance();
		String fileName = imgfile.getOriginalFilename();
		String fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());
		String replaceName = cal.getTimeInMillis() + fileType;  
		
		//저장경로 = 프로젝트파일 폴더안에 resources/upload 만들어야됨.
		String path = request.getSession().getServletContext().getRealPath("/")+"resources/upload";
		System.out.println(path);
		FileUpload.fileUpload(imgfile, path, replaceName);
		model.addAttribute("path", path);
		model.addAttribute("filename", replaceName);
		return "notice/file_upload";
	}

}
