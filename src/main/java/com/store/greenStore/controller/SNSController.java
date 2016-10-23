package com.store.greenStore.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.store.greenStore.dto.Member;
import com.store.greenStore.dto.UserkakaoVo;
import com.store.greenStore.mapper.MemberMapper;
import com.store.greenStore.service.Utils;

@Controller
@RequestMapping("/*")
public class SNSController {
	private static final Logger logger = LoggerFactory.getLogger(SNSController.class);
	@Autowired MemberMapper memberMapper;
	
	//카카오 api
	private static final String restapi="55c4125dae1ff298482707a80f0bde7f"; 
	private static final String mydomainkakao ="http%3A%2F%2Flocalhost%3A8080%2FgreenStore%2Foauth%2Fcallback%2Fkakao";
	private static final String karequestUrl = "https://kauth.kakao.com/oauth/authorize?client_id="+restapi+"&redirect_uri="+mydomainkakao+"&response_type=code&state=";
	
	@RequestMapping(value = "/oauth/login")
	public String login(HttpSession session ,@RequestParam(required = false,value = "snsname") String snsname) {
	    if(snsname.equals("kakao")){
	        String state = Utils.generateState();
	        session.setAttribute("state", state);
	        logger.info("Sesstion.state :" + state);
	        logger.info("login 코드 요청 보낸 uri 값은 "+karequestUrl+state);
	        return "redirect:" + karequestUrl+state;   //만들어진 URL로 인증을 요청합니다.
	    }
	    else if(snsname.equals("facebook")) {
	    	//
	    }
	    logger.info("로직 종료");
	    return null;
	}
	
	@RequestMapping(value = "oauth/callback/kakao")
    public String callbackkakao(Member member, @RequestParam(required = false,value ="state") String state, @RequestParam(required = false,value = "code") String code, HttpServletRequest request, Model model, HttpSession session){
        logger.info("카카오로 부터 응답이 왔습니다.");
        logger.info("받은 변수의 값은 state :"+state);
        logger.info("받은 변수의 값은 code :"+code);
        String grant_type="authorization_code";
        logger.info("토큰을 받을 주소를 만듭니다.");
        String tokenReqUrl="https://kauth.kakao.com/oauth/token?grant_type="+grant_type+"&client_id="+restapi+"&redirect_uri="+mydomainkakao+"&code="+code;
        logger.info("토큰 주소는 : "+tokenReqUrl);
        String data = getHtml(tokenReqUrl, code);      
        logger.info("응답바디는 :" + data);
        Map<String,String> map = JSONStringToMap(data); 
        String accessToken = map.get("access_token");
        String tokenType = map.get("token_type");
        String refresh_Token = map.get("refresh_token");
        String scope = map.get("scope");
        session.setAttribute("accessToken", accessToken);
        logger.info("accessToken : " + accessToken);
        logger.info("token_type : " + tokenType);
        logger.info("refresh_token : " + refresh_Token);
        logger.info("scope : "+ scope);
        String kakaoUserProfileReqUrl="https://kapi.kakao.com/v1/user/me?Authorization="+accessToken;
        logger.info("받아온 토큰으로 사용자 정보 요청 url 생성 : " + kakaoUserProfileReqUrl);
        String userData = getHtml(kakaoUserProfileReqUrl, tokenType + " " + accessToken);
        logger.info("1.받아온 데이터는 : " + userData);
        model.addAttribute("userData", userData);
        UserkakaoVo userkakaoVo    = new Gson().fromJson(userData, UserkakaoVo.class );
        
        //db저장
    	Member user = new Member();
		user.setMid(userkakaoVo.getId());
        user.setMname(userkakaoVo.getProperties().get("nickname"));
        user.setMphoto(userkakaoVo.getProperties().get("thumbnail_image"));
        memberMapper.insertUser(user);
        logger.info("로그인 유저 카카오 ID : " +userkakaoVo.getId());
        logger.info("로그인 유저 카카오 닉네임 : " +userkakaoVo.getProperties().get("nickname"));
        
  
  
        return "redirect:/";
    } 

      public static String getHtml(String url, String authorization) {
        HttpURLConnection httpRequest = null;
        String resultValue = null;
        try {
            URL u = new URL(url);
            httpRequest = (HttpURLConnection) u.openConnection();
            httpRequest.setRequestProperty("Content-type", "text/xml; charset=UTF-8");
            if(authorization != null){
                httpRequest.setRequestProperty("Authorization", authorization);
            }
            httpRequest.connect();
            BufferedReader in = new BufferedReader(new InputStreamReader(httpRequest.getInputStream(), "UTF-8"));
            StringBuffer sb = new StringBuffer();
            String line = null;
            while((line = in.readLine()) != null){
                sb.append(line);
                sb.append("\n");
            }
            resultValue = sb.toString();
        } catch (IOException e) {
        } finally {
            if (httpRequest != null) {
                httpRequest.disconnect();
            }
        }
        return resultValue;
    }
     public static Map<String, String> JSONStringToMap(String str){
        Map<String,String> map = new HashMap<String,String>();
        ObjectMapper mapper = new ObjectMapper();
        try {
            map = mapper.readValue(str, new TypeReference<HashMap<String,String>>() {});
        } catch (JsonParseException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return map;
    }

}
