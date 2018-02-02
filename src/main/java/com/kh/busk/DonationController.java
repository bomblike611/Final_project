package com.kh.busk;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.donation.DonationService;
import com.kh.donation.SingerDTO;
import com.kh.member.MemberDTO;

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
		return mv;
	}
	
	@RequestMapping(value="spon")
	public void donation(String id){
		System.out.println(id);
	}
	@RequestMapping(value="spon_main", method=RequestMethod.POST)
	public ModelAndView spon_main(String kind, Integer money, HttpSession session){
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = null;
		try {
			memberDTO = (MemberDTO)session.getAttribute("member");
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(memberDTO==null){
			memberDTO = new MemberDTO();
		}
		memberDTO.setName("이두호");
		memberDTO.setPhone("010-9689-9880");
		memberDTO.setEmail("456red@naver.com");
		mv.addObject("kind", kind);
		mv.addObject("money", money);
		mv.addObject("member", memberDTO);
		return mv;
	}
}
