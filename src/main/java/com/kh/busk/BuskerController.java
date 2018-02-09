package com.kh.busk;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.busker.BuskerService;
import com.kh.spon.SingerDTO;
@Controller
@RequestMapping(value="/busker/**")
public class BuskerController {

	@Inject
	private BuskerService buskerService;
	
	@RequestMapping(value="buskerList")
	public ModelAndView buskerList(){
		ModelAndView mv = new ModelAndView();
		List<SingerDTO> buskerList = buskerService.buskerList();
		mv.addObject("buskerList", buskerList);
		return mv;
	}
	@RequestMapping(value="buskerView")
	public void buskerView(){
		
		
	}
	
}
