package com.kh.busk;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iu.util.ListData;
import com.kh.busking.BuskingDTO;
import com.kh.location.LocationDTO;
import com.kh.location.LocationService;

@Controller
@RequestMapping(value="/calendar/**")
public class CalController {
	
	@RequestMapping(value="upcoming")
	public void upcoming() throws Exception{
		/*ModelAndView mv = new ModelAndView();
		List<BuskingDTO> ar = */
	}
	
	@RequestMapping(value="month")
	public void month() throws Exception{
		
	}
	
	@RequestMapping(value="year")
	public void year() throws Exception{
		
	}
	
	@RequestMapping(value="search")
	public ModelAndView search(ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("page", listData);
		return mv;
	}

}
