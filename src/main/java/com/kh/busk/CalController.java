package com.kh.busk;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/calendar/**")
public class CalController {
	
	@RequestMapping(value="upcoming")
	public void upcoming(){
		
	}
	
	@RequestMapping(value="month")
	public void month(){
		
	}
	
	@RequestMapping(value="year")
	public void year(){
		
	}
	
	@RequestMapping(value="search")
	public void search(){
		
	}

}
