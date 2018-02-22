package com.kh.busk;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cal.CalDTO;
import com.kh.cal.CalService;
import com.kh.util.ListData;

@Controller
@RequestMapping(value="/calendar/**")
public class CalController {
	
	@Inject
	private CalService calservice;
	
/*	@RequestMapping(value="search")
	public void searche(CalDTO calDTO, ListData listData) throws Exception{
		
	}*/
	@RequestMapping(value="search"/*, method=RequestMethod.POST */)
	public ModelAndView search(CalDTO calDTO, ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<CalDTO> ar = calservice.selectList(listData);
		mv.addObject("list", ar);
		mv.addObject("page", listData);
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
		List<CalDTO> ar = calservice.selectList(listData);
		mv.addObject("list", ar);
		mv.addObject("page", listData);
		mv.setViewName("calendar/upcoming");
		return mv;
	}

}
