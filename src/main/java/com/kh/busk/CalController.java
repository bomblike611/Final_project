package com.kh.busk;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.busking.BuskingDTO;

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
	public void search() throws Exception{
		
	}

}
