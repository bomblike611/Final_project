package com.kh.busk;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin/**")
public class AdminController {
	
	@RequestMapping(value="memberList")
	public void memberList()throws Exception{
		
	}
	
	@RequestMapping(value="singerJoin")
	public void singerJoin()throws Exception{
		
	}
	
}
