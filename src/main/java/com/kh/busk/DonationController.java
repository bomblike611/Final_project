package com.kh.busk;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.donation.DonationService;
import com.kh.donation.SingerDTO;

@Controller
@RequestMapping(value="/donation/**")
public class DonationController {
	
	@Inject
	private DonationService donationService;
	
	@RequestMapping(value="buskerList")
	public ModelAndView buskerList(){
		ModelAndView mv = new ModelAndView();
		List<SingerDTO> buskerList = donationService.buskerList();
		mv.addObject("buskerList", buskerList);
		mv.setViewName("donation/buskerList");
		return mv;
	}
	
	@RequestMapping(value="spon")
	public void donation(String id){
		System.out.println(id);
	}
}
