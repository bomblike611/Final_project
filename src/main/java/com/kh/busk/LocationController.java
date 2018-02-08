package com.kh.busk;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.location.LocationDTO;
import com.kh.location.LocationService;

@Controller
@RequestMapping(value="/location/**")
public class LocationController {
	
	@Inject
	private LocationService locationService;
	
	@RequestMapping(value="locationWrite",method=RequestMethod.GET)
	public void locationWrite() throws Exception{	
	}
	
	@RequestMapping(value="locationWrite",method=RequestMethod.POST)
	public String locationWrite(LocationDTO locationDTO,MultipartFile [] file,HttpSession session) throws Exception{
		System.out.println(file.length);
		int result=locationService.locationInsert(locationDTO, session, file);
		System.out.println(result);
		return "redirect:./locationList";
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
