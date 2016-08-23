package test;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.store.greenStore.dto.Store;
import com.store.greenStore.mapper.StoreMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class TestMain {
	
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired 
	StoreMapper storeMapper;
	
//	@Test
//	public void TestStoreSelectAll(){
//		List<Store> store = storeMapper.selectAll();
//		int i = 1;
//		for(Store st : store){
//			System.out.println(st.getSh_name() + (i++));
//		}
//	}
//	
	@Test
	public void TestSelectById(){
		List<Store> store = storeMapper.selectById("커피");
		int i = 1;
		for(Store st : store){
			System.out.println(st.getSh_name() + (i++));	
		}
	}
	
}
