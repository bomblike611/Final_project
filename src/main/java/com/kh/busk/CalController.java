package com.kh.busk;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	private String month;
	
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
			String [] arrr=arr.toString().split("-");
			System.out.println(arrr[1]);
				switch(arrr[1]){
				case "01": arrr[1] = "JAN";
				break;
				case "02": arrr[1] = "FEB";
				break;
				case "03": arrr[1] = "MAR";
				break;
				case "04": arrr[1] = "APR";
				break;
				case "05": arrr[1] = "MAY";
				break;
				case "06": arrr[1] = "JUN";
				break;
				case "07": arrr[1] = "JUL";
				break;
				case "08": arrr[1] = "AUG";
				break;
				case "09": arrr[1] = "SEP";
				break;
				case "10": arrr[1] = "OCT";
				break;
				case "11": arrr[1] = "NOV";
				break;
				case "12": arrr[1] = "DEC";
				break;
				}	
				mv.addObject("mon", arrr);
		}*/
		mv.addObject("list", ar);
		mv.addObject("page", listData);
		mv.setViewName("calendar/upcoming");
		return mv;
	}

}
