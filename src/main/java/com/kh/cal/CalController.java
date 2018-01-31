package com.kh.cal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/calender/**")
public class CalController {
	
	@RequestMapping(value="month")
	public void month(){
		
	}
	
	@RequestMapping(value="memo")
	public void memo(){
		
	}

}
