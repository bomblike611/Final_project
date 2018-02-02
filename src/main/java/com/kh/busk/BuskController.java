package com.kh.busk;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value="/busking/**")
@Controller
public class BuskController {

	@RequestMapping(value="buskView")
	public void buskView() throws Exception{
		
	}
	
	@RequestMapping(value="buskWrite")
	public void buskWrite() throws Exception{
		
	}
	
}
