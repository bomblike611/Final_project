package com.kh.busk;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionController {

	@ExceptionHandler(NumberFormatException.class)
	public String test(){
		return "error/error404";
	}
	
}
