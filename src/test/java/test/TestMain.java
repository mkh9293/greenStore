package test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.store.greenStore.dto.Review;
import com.store.greenStore.dto.Store;
import com.store.greenStore.dto.LikeDto;
import com.store.greenStore.mapper.LikeMapper;
import com.store.greenStore.mapper.MemberMapper;
import com.store.greenStore.mapper.RvMapper;
import com.store.greenStore.mapper.StoreDbMapper;
import com.store.greenStore.mapper.StoreMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class TestMain {
	
//	private Log log = LogFactory.getLog(getClass());
	
	@Autowired 
	StoreMapper storeMapper;
	@Autowired 
	MemberMapper memberMapper;
	@Autowired
	StoreDbMapper storeDbMapper;
	@Autowired
	RvMapper rvmapper;
	@Autowired
	LikeMapper likeMapper;
	
//	@Autowired
//	JsonControllers controll;
//	
//	@Autowired
//	StoreController storeCon;
	
	
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
//	@Test
//	public void TestSearch(){
//		List<Store> storeList = storeMapper.appCateSearch("지역 선택","이 미용");
//		int i = 1;
//		System.out.println(storeList.size());
//		for(Store st : storeList){
//			System.out.println((i++));	
//		}
//	}
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

	
	//멤버 조회
//	@Test
//	public void selectMember(){
//		if(memberMapper.selectMember("123")!=null){
//			System.out.println("not null");
//		}else{
//			System.out.println("null");
//			Member member = new Member();
//			member.setMid("123");
//			member.setMname("mkh");
//			member.setMphoto("http://test.com");
//			memberMapper.insertUser(member);
//			System.out.println(member.getMkey() +" mkey~~");
//		}
//	}
	
	//상세 정보용
//	@Test
//	public void detail(){
//		List<Store> items = storeDbMapper.appDetail(2350);
//		for(Store item : items){
//			System.out.println(item.getMenu());
//		}
//	}
	
	@Test
	public void detail(){
		List<Review> items = rvmapper.appReviewCateSearch("강남구", "한식");
		if(items == null) System.out.println("값이 없다");
		for(Review item : items){
			System.out.println(item.getSh_addr());
			System.out.println(item.getINDUTY_CODE_SE_NAME());
			System.out.println("---------------------------");
		
			
		}
	}
	
//		List<LikeDto> items = likeMapper.searchLikeByMkey(3);
//		for(LikeDto item : items){
//			System.out.println(item.getMkey()+" / "+item.getSh_id()+" / "+item.getRkey());
//		}
		LikeDto ld = new LikeDto();
		ld.setMkey(3);
		List<LikeDto> items = new ArrayList<LikeDto>();
		items.add(ld);
		System.out.println(items.get(0));
	}
}
