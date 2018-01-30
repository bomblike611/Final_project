package com.kh.busk;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/location/**")
public class LocationController {
	
	@RequestMapping(value="locationWrite",method=RequestMethod.GET)
	public void locationWrite() throws Exception{	
	}
	
}
