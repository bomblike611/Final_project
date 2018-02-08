package com.kh.busk;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.kh.location.LocationDTO;

@Controller
@RequestMapping(value="/location/**")
public class LocationController {
	
	@RequestMapping(value="locationWrite",method=RequestMethod.GET)
	public void locationWrite(LocationDTO locationDTO,MultipartFile [] files,HttpSession session) throws Exception{	
	}
	
	@RequestMapping(value="locationList")
	public void locationList() throws Exception{
		
	}
	
	@RequestMapping(value="locationUpdate")
	public void locationUpdate() throws Exception{
		
	}
	@RequestMapping(value="locationMap")
	public void locationMap() throws Exception{
		
	}
	
}
