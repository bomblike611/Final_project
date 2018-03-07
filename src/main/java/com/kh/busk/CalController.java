package com.kh.busk;

import java.net.URL;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cal.CalDTO;
import com.kh.cal.CalService;
import com.kh.location.LocationDAO;
import com.kh.location.LocationDTO;
import com.kh.util.ListData;

@Controller
@RequestMapping(value="/calendar/**")
public class CalController {
	
	@Inject
	private CalService calservice;
	@Inject
	private LocationDAO locationDAO;

	@RequestMapping(value="search")
	public ModelAndView search(CalDTO calDTO, ListData listData, LocationDTO locationDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		locationDTO.setLoc_name(calDTO.getLocation());
		locationDTO.setNum(0);
		LocationDTO locationDTO2 = locationDAO.locationView(locationDTO);
		mv.addObject("loca", locationDTO2);

		mv= calservice.selectList(calDTO, listData, mv);
		mv.setViewName("calendar/search");
		return mv;
	}

	@RequestMapping(value="dd")
	public ModelAndView dd(ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		String data = "[";
		List<CalDTO> ar = calservice.dd();
		URL url = new URL("http://localhost/busk/busking/buskView?num=");
		for (CalDTO calDTO : ar){
		data=data+"{"+"title:\""+calDTO.getTeamname()+"\",";
		data=data+"start:\""+calDTO.getBusk_date()+"\",";
		data=data+"url:\""+url+calDTO.getNum()+"&id="+calDTO.getWriter()+"\"}"+",";
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
