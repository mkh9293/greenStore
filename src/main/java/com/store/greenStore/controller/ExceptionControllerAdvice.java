package com.store.greenStore.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionControllerAdvice {

	@ExceptionHandler(RuntimeException.class)
	public String runtimeException(Exception e){
		e.printStackTrace();
		
		return "error/errorPage";
	}
	
	@ExceptionHandler(Throwable.class)
	public String throwException(Exception e){
		e.printStackTrace();
		
		return "error/errorPage";
	}
	
	@ExceptionHandler(Exception.class)
	public String defaultException(Exception e){
		e.printStackTrace();
		
		return "error/errorPage";
	}
}
