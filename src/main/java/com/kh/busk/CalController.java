package com.kh.busk;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cal.CalDTO;
import com.kh.cal.CalService;
import com.kh.location.LocationDAO;
import com.kh.util.ListData;

@Controller
@RequestMapping(value="/calendar/**")
public class CalController {
	
	@Inject
	private CalService calservice;
	@Inject
	private LocationDAO locationDAO;

	@RequestMapping(value="search"/*, method=RequestMethod.POST */)
	public ModelAndView search(CalDTO calDTO, ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		/*CalDTO calDTO2 = calservice.selectOne(calDTO);
		LocationDTO loca = new LocationDTO();
		loca.setLoc_name(calDTO2.getLocation());
		loca.setNum(0);
		LocationDTO locationDTO=locationDAO.locationView(loca);
		mv.addObject("list", calDTO2);
		mv.addObject("loca", locationDTO);*/
		mv= calservice.selectList(listData, mv);
		mv.setViewName("calendar/search");
		return mv;
	}

	@RequestMapping(value="dd")
	public ModelAndView dd(ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		String data = "[";
		List<CalDTO> ar = calservice.dd();
		for (CalDTO calDTO : ar){
		data=data+"{"+"title:\""+calDTO.getTeamname()+"\",";
		data=data+"start:\""+calDTO.getBusk_date()+"\"}"+",";
		}
		data=data+"]";
		mv.addObject("obj", data);
		mv.setViewName("calendar/dd");
		return mv;
	}
	
	@RequestMapping(value="upcoming")
	public ModelAndView upcoming(ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<CalDTO> ar = calservice.selectre(listData);
		mv.addObject("list", ar);
		mv.setViewName("calendar/upcoming");
		return mv;
	}

}
