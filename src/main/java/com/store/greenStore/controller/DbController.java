package com.store.greenStore.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DbController {

	private final String storeList = "736c5664477472653232657a757945";

	@RequestMapping("/dataInsertQuery")
	public void dataInsertQuery() throws IOException {
		boolean check = false;

		URL data;
		int lastIndex = 0;

		if (check == false) {
			data = new URL("http://openAPI.seoul.go.kr:8088/" + storeList + "/xml/ListPriceModelStoreService/1/5/");
			lastIndex = checkLastIndex(data);
			check = true;
			System.out.println(lastIndex);
		}
		/*
		 * data = new URL("http://openAPI.seoul.go.kr:8088/" + storeList +
		 * "/xml/ListPriceModelStoreService/1/"+lastIndex);
		 * 
		 * URLConnection yc = data.openConnection(); BufferedReader in = new
		 * BufferedReader(new InputStreamReader(yc.getInputStream())); String
		 * inputLine;
		 * 
		 * while ((inputLine = in.readLine()) != null)
		 * System.out.println(inputLine); in.close();
		 * 
		 * parseXml(inputLine);
		 */
	}

	private int checkLastIndex(URL data) throws IOException {
		URLConnection yc = data.openConnection();
		BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
		String inputLine;
		int num = 0;

		while ((inputLine = in.readLine()) != null){System.out.println(inputLine);}
			/* System.out.println(inputLine); */

			try {
				SAXReader saxReader = new SAXReader();
				Document document = saxReader.read(new StringReader(inputLine));
				List<Node> nodes = document.selectNodes("/ListPriceModelStoreService/list_total_count");
				
				String test = document.getRootElement().getText().substring(0, 1);
				System.out.println(test + " ???");

			} catch (Exception e) {
			}
		return num;
	}

	/*
	 * private void parseXml(String inputLine) { try { SAXReader saxReader = new
	 * SAXReader(); Document document = saxReader.read(new
	 * StringReader(inputLine)); List<Node> nodes =
	 * document.selectNodes("/ListPriceModelStoreService");
	 * 
	 * for (Node node : nodes) { News news = new News();
	 * news.setTitle(node.selectSingleNode("title").getText());
	 * news.setLink(node.selectSingleNode("link").getText());
	 * news.setContents(node.selectSingleNode("description").getText()); // 날짜
	 * 형식 변환 후 객체에 저장 original_date =
	 * original_format.parse(node.selectSingleNode("pubDate").getText());
	 * news.setWriteTime(new_format.format(original_date));
	 * news.setImgPath(node.selectSingleNode("media:thumbnail").valueOf("@url"))
	 * ; newsList.add(news); } } catch (Exception e) { } return newsList; }
	 */
}
