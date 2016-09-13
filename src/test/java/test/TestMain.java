package test;

import java.io.IOException;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.DocumentException;
import org.json.simple.parser.ParseException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.store.greenStore.controller.JsonController;
import com.store.greenStore.controller.StoreController;
import com.store.greenStore.dto.Store;
import com.store.greenStore.mapper.StoreMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class TestMain {
	
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired 
	StoreMapper storeMapper;
	
	@Autowired
	JsonController controll;
	
	@Autowired
	StoreController storeCon;
	
	
//	@Test	
//	public void TestBlog() throws IOException, DocumentException {
//		storeCon.getBlogContent("망우찜쌈밥");
//	}
	
//	@Test
//	public void TestInsta() throws IOException, ParseException{
//		controll.getInsta("망우찜쌈밥");
//	}
	// 메인에 들어오면 추천수 가장 높은 6개 출력
//	@Test
//	public void TestStoreSelectAll(){
//		List<Store> store = storeMapper.selectAll();
//		int i = 1;
//		for(Store st : store){
//			System.out.println(st.getSh_name() + (i++));
//		}
//	}
//	
	
	// 검색했을 때.

//	@Test
//	public void TestSearch(){
//		List<Store> store = storeMapper.search("커피");
//		int i = 1;
//		for(Store st : store){
//			System.out.println(st.getSh_name() + (i++));	
//		}
//	}
	@Test
	public void TestSearch(){
		List<Store> store = storeMapper.search("커피");
		int i = 1;
		for(Store st : store){
			System.out.println(st.getSh_name() + (i++));	
		}
	}
//	@Test
//	public void TestSearch(){
//		List<Store> store = storeMapper.search("커피");
//		int i = 1;
//		for(Store st : store){
//			System.out.println(st.getSh_name() + (i++));	  
//		}
//	}
	
	// 카테고리 지역 검색했을 때
//	@Test
//	public void cateSearch(){
//		String area = "도봉구";
//		String cate = "2";
//		List<Store> cateList = storeMapper.cateSearch(area,cate);
//		for(Store s : cateList){
//			System.out.println(s.getSh_name()+ " / "+s.getInduty_code_se_name());
//		}
//	}
	
//	@Test
//	public void appSelectAll(){
//		for(Store s : storeMapper.appSelectAll()){
//			System.out.println(s.getSh_name() +" / "+s.getSh_rcmn());
//
//		}
//	}
//	

//	@Test
//	public void appSelectAll(){
//		for(Store s : storeMapper.selectAll()){
//			System.out.println(s.getSh_name() +" / "+s.getSh_rcmn());
//
//		}
//	}
	
	// 카테고리 지역 검색했을 때
//	//@Test
//	//public void cateSearch(){
//		String area = "도봉구";
//		String cate = "2";
//		List<Store> cateList = storeMapper.cateSearch(area,cate);
//		for(Store s : cateList){
//			System.out.println(s.getSh_name()+ " / "+s.getInduty_code_se_name());
//		}
//	}
	
}
