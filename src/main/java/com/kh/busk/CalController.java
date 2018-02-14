package com.kh.busk;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cal.CalDTO;
import com.kh.cal.CalService;
import com.kh.util.ListData;

@Controller
@RequestMapping(value="/calendar/**")
public class CalController {
	
	@Inject
	private CalService calservice;
	
	@RequestMapping(value="search")
	public ModelAndView search(CalDTO calDTO, ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<CalDTO> ar = calservice.selectList(listData);
		/*String[] arr =calDTO.getBusk_date().toString().split("-");
		for(int i=0; i<arr.length; i++){
			System.out.println(arr[i]);
		}*/
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
/*		for(CalDTO clCalDTO :ar){
			String arr =clCalDTO.getBusk_date().toString().substring(0, 16);
			arr=arr.replace(" ", "-");
			String [] arrr=clCalDTO.getBusk_date().toString().split("-");
			for(int i=0; i<arr.length; i++){
				System.out.println(arr[i]);
			}
			System.out.println(arrr);
		}*/
		
		mv.addObject("list", ar);
		mv.addObject("page", listData);
		mv.setViewName("calendar/upcoming");
		return mv;
	}

}
