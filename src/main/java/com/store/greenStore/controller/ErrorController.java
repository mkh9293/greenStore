package com.store.greenStore.controller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
@RequestMapping("/error/*")
public class ErrorController {
	
	@RequestMapping("/404")
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String defaultError(){
		
		return "error/errorPage";
	}
	
	@RequestMapping("/500")
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public String internalServerError() {
		
	    return "/error/serverError";
	}
}