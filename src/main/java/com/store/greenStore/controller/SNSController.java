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
	
	//카카오 REST API 키값
	private static final String restapi="55c4125dae1ff298482707a80f0bde7f"; 
	private static final String mydomainkakao ="http%3A%2F%2Flocalhost%3A8080%2FgreenStore%2Foauth%2Fcallback%2Fkakao";
	private static final String karequestUrl = "https://kauth.kakao.com/oauth/authorize?client_id="+restapi+"&redirect_uri="+mydomainkakao+"&response_type=code&state=";
	
	@RequestMapping(value = "/oauth/login")
	public String kakao(HttpSession session ,@RequestParam(required = false,value = "snsname") String snsname) {
	    if(snsname.equals("kakao")){
	        String state = Utils.generateState();
	        session.setAttribute("state", state);
	        logger.info("Sesstion.state :" + state);
	        logger.info("login 코드 요청 보낸 uri 값은 "+karequestUrl+state);
	        //인증요청
	        return "redirect:" + karequestUrl+state;   
	    }
	    else if(snsname.equals("facebook")) {
	    	//
	    }
	    return null;
	}
	
	@RequestMapping(value = "oauth/callback/kakao")
    public String callbackkakao(Member member, @RequestParam(required = false,value ="state") String state, @RequestParam(required = false,value = "code") String code, HttpServletRequest request, Model model, HttpSession session){
        logger.info("받은 변수의 값은 state :"+state);
        String grant_type="authorization_code";
        String tokenReqUrl="https://kauth.kakao.com/oauth/token?grant_type="+grant_type+"&client_id="+restapi+"&redirect_uri="+mydomainkakao+"&code="+code;
        logger.info("토큰 주소는 : "+tokenReqUrl);
        String data = getHtml(tokenReqUrl, code);      
        logger.info("응답바디는 :" + data);
        Map<String,String> map = JSONStringToMap(data); 
        String accessToken = map.get("access_token");
        String tokenType = map.get("token_type");
        String refresh_Token = map.get("refresh_token");
        String scope = map.get("scope");
        
        session = request.getSession();
        
        System.out.println(session.getAttribute("accessToken")+ " session Check");
        
        logger.info("accessToken : " + accessToken);
        String kakaoUserProfileReqUrl="https://kapi.kakao.com/v1/user/me?Authorization="+accessToken;
        logger.info("받아온 토큰으로 사용자 정보 요청 url 생성 : " + kakaoUserProfileReqUrl);
        String userData = getHtml(kakaoUserProfileReqUrl, tokenType + " " + accessToken);
        
        UserkakaoVo userkakaoVo = new Gson().fromJson(userData, UserkakaoVo.class );
	    logger.info("mid : " +userkakaoVo.getId());
        logger.info("mname : " +userkakaoVo.getProperties().get("nickname"));
        
       
		Member result = memberMapper.selectMember(userkakaoVo.getId());
		Member user = new Member();
		
		if(result.getMid().equals(userkakaoVo.getId()) == false) {
	        user.setMname(userkakaoVo.getProperties().get("nickname"));
	        user.setMphoto(userkakaoVo.getProperties().get("thumbnail_image"));
	        memberMapper.insertUser(user);
		} else {

        member = new Member();
        member.setMid(userkakaoVo.getId());
        member.setMname(userkakaoVo.getProperties().get("nickname"));
        member.setMphoto(userkakaoVo.getProperties().get("profile_image"));
        session.setAttribute("member", member);
        System.out.println(member.getMid());
		session = request.getSession(false);
			if(session!=null){
				Member vo = (Member)session.getAttribute("member");
				if(vo!=null){
					System.out.println(vo.getMphoto()+ " / "+vo.getMid());
					model.addAttribute("member", vo);
				}
			}
		}
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
