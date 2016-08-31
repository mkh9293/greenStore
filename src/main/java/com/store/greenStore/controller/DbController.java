package com.store.greenStore.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.store.greenStore.dto.Store;
import com.store.greenStore.dto.StoreMenu;
import com.store.greenStore.mapper.StoreMapper;
import com.store.greenStore.mapper.StoreMenuMapper;

@Controller
public class DbController {

	@Autowired
	StoreMapper storeMapper;
	@Autowired
	StoreMenuMapper storeMenuMapper;
	
	private final String storeList = "736c5664477472653232657a757945";

	@RequestMapping("/storeMenuDataInsert")
	public void storeMenuDataInsert() throws IOException, DocumentException {
		List<Node> nodes;
		
		nodes = selectMenuNode(0,1); // default로 1, 1개만 가져와도 total count를 알 수 있음.
		int num = 0;
		for (Node node : nodes) {
			num = Integer.parseInt(node.selectSingleNode("list_total_count").getText());
		}
		
		for(int i=0;i<2;i++){
			if(i==0){
				nodes = selectMenuNode(1,999); // 1000부터 1999까지
			}else{
				nodes = selectMenuNode(1000,num); // 1부터 999까지 
			}
			for (Node node : nodes) {
				StoreMenu db = new StoreMenu();
				db.setSh_id(Integer.parseInt(node.selectSingleNode("SH_ID").getText()));
				db.setMenu(node.selectSingleNode("IM_NAME").getText());
				if(node.selectSingleNode("IM_PRICE").getText().equals(""))
					db.setPrice(0);
				else
					db.setPrice(Integer.parseInt(node.selectSingleNode("IM_PRICE").getText()));
				storeMenuMapper.insert(db);
			}
		}
		
	}

	@RequestMapping("/storeDataInsert")
	public void dataInsert() throws IOException, DocumentException {

		List<Node> nodes;

		nodes = selectNode(1); // default로 1, 1개만 가져와도 total count를 알 수 있음.
		int num = 0;
		for (Node node : nodes) {
			num = Integer.parseInt(node.selectSingleNode("list_total_count").getText());
		}

		nodes = selectNode(num);
		for (Node node : nodes) {
			Store db = new Store();
			db.setSh_id(Integer.parseInt(node.selectSingleNode("SH_ID").getText()));
			db.setSh_name(node.selectSingleNode("SH_NAME").getText());
			db.setSh_addr(node.selectSingleNode("SH_ADDR").getText());
			db.setInduty_code_se(Integer.parseInt(node.selectSingleNode("INDUTY_CODE_SE").getText()));
			db.setInduty_code_se_name(node.selectSingleNode("INDUTY_CODE_SE_NAME").getText());
			db.setSh_phone(node.selectSingleNode("SH_PHONE").getText());
			db.setSh_way(node.selectSingleNode("SH_WAY").getText());
			db.setSh_info(node.selectSingleNode("SH_INFO").getText());
			db.setSh_pride(node.selectSingleNode("SH_PRIDE").getText());
			db.setSh_rcmn(Integer.parseInt(node.selectSingleNode("SH_RCMN").getText()));
			db.setSh_photo(node.selectSingleNode("SH_PHOTO").getText());
			db.setSh_like(0);
			storeMapper.insert(db);
		}
	}

	private List<Node> selectNode(int num) throws IOException, DocumentException {
		URL data = new URL("http://openAPI.seoul.go.kr:8088/" + storeList + "/xml/ListPriceModelStoreService/1/" + num);
		int lastIndex = 0;

		URLConnection yc = data.openConnection();
		BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
		String inputLine = "";
		String ins = "";

		while ((inputLine = in.readLine()) != null) {
			ins += inputLine;
		}

		SAXReader saxReader = new SAXReader();
		Document document = saxReader.read(new StringReader(ins));
		List<Node> nodes;
		if (num == 1) {
			// 1이면 total count를 알기 위한 것이므로 ListPriceModelStoreService까지만 들어감
			nodes = document.selectNodes("/ListPriceModelStoreService");
		} else {
			// 1이 아니면 데이터 모두 조회하는 것이므로 ListPriceModelStoreService/row까지 들어감
			nodes = document.selectNodes("/ListPriceModelStoreService/row");
		}
		in.close();
		return nodes;
	}
	
	private List<Node> selectMenuNode(int start,int end) throws IOException, DocumentException {
		URL data = new URL("http://openAPI.seoul.go.kr:8088/" + storeList + "/xml/ListPriceModelStoreProductService/"+start+"/"+end);
		int lastIndex = 0;

		URLConnection yc = data.openConnection();
		BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
		String inputLine = "";
		String ins = "";

		while ((inputLine = in.readLine()) != null) {
			ins += inputLine;
		}

		SAXReader saxReader = new SAXReader();
		Document document = saxReader.read(new StringReader(ins));
		List<Node> nodes;
		if(start == 0){
			nodes = document.selectNodes("/ListPriceModelStoreProductService");
		}else{
			nodes = document.selectNodes("/ListPriceModelStoreProductService/row");
		}
		in.close();
		return nodes;
	}
}
