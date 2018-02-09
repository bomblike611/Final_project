package com.kh.busk;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value="/event/**")
@Controller
public class EventController {
	
	@RequestMapping(value="pointRotate")
	public void pointRotate() throws Exception{
		
	}
	
}
