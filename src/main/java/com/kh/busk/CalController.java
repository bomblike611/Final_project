package com.kh.busk;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cal.CalDTO;
import com.kh.cal.CalService;
import com.kh.file.FileDAO;
import com.kh.file.FileDTO;
import com.kh.location.LocationDAO;
import com.kh.location.LocationDTO;
import com.kh.location.LocationService;
import com.kh.util.ListData;

@Controller
@RequestMapping(value="/calendar/**")
public class CalController {
	
	@Inject
	private CalService calservice;
	@Inject
	private LocationDAO locationDAO;

/*	@RequestMapping(value="search")
	public void searche(CalDTO calDTO, ListData listData) throws Exception{
		
	}*/
	@RequestMapping(value="search"/*, method=RequestMethod.POST */)
	public ModelAndView search(CalDTO calDTO, ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		/*LocationDTO loca = new LocationDTO();
		loca.setLoc_name(calDTO.getLocation());
		loca.setNum(0);
		LocationDTO locationDTO=locationDAO.locationView(loca);
		System.out.println(locationDTO);*/
		mv= calservice.selectList(listData, mv);
		mv.setViewName("calendar/search");
		return mv;
	}

	@RequestMapping(value="month")
	public void month() throws Exception{
		
	}
	
	@RequestMapping(value="year")
	public void year() throws Exception{
		
	}
	
	@RequestMapping(value="upcoming")
	public ModelAndView upcoming(ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();		
		mv= calservice.selectList(listData, mv);
		mv.setViewName("calendar/upcoming");
		return mv;
	}

}
