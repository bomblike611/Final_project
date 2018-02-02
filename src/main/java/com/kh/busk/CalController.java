package com.kh.busk;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/calender/**")
public class CalController {
	
	@RequestMapping(value="upcoming")
	public void upcoming(){
		
	}
	
	@RequestMapping(value="month")
	public void month(){
		
	}
	
	@RequestMapping(value="memo")
	public void memo(){
		
	}

}
