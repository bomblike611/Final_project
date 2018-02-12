package com.kh.busk;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.location.LocationDTO;
import com.kh.location.LocationService;
import com.kh.util.ListData;

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
		int result=locationService.locationInsert(locationDTO, session, file);
		return "redirect:./locationList";
	}
	
	@RequestMapping(value="locationList")
	public ModelAndView locationList(ListData listData) throws Exception{
		ModelAndView mv=new ModelAndView();
		listData.setPerPage(6);
		mv=locationService.locationList(listData,mv);
		mv.setViewName("location/locationList");
		return mv;
	}
	
	@RequestMapping(value="locationUpdate",method=RequestMethod.GET)
	public void locationUpdate(int num,Model model) throws Exception{
		LocationDTO locationDTO=locationService.locationView(num);
		model.addAttribute("view", locationDTO);
	}
	
	
	@RequestMapping(value="locationUpdate",method=RequestMethod.POST)
	public void locationUpdate(LocationDTO locationDTO,HttpSession session,MultipartFile [] file) throws Exception{
		
	}
	@RequestMapping(value="locationMap")
	public void locationMap() throws Exception{
		
	}
	
}
