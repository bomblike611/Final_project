package com.kh.busk;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.member.MemberDTO;
import com.kh.point.PointDTO;
import com.kh.spon.SponDTO;
import com.kh.spon.SponService;

@Controller
@RequestMapping(value="/spon/**")
public class SponController {
	
	@Inject
	private SponService sponService;
	
	@RequestMapping(value="spon_main")
	public void spon_main(String id){
		System.out.println(id);
	}
	@RequestMapping(value="sponPage", method=RequestMethod.POST)
	public ModelAndView spon(String kind, Integer money){
		ModelAndView mv = new ModelAndView();
		mv.addObject("kind", kind);
		mv.addObject("money", money);
		return mv;
	}
	@RequestMapping(value="success")
	public ModelAndView success(SponDTO sponDTO, HttpSession session){
		ModelAndView mv = new ModelAndView();
		int result=0;
		result=sponService.spon(sponDTO);
		PointDTO pointDTO = new PointDTO();
		pointDTO.setId(((MemberDTO)session.getAttribute("member")).getId());
		pointDTO.setReason("후원 적립 포인트");
		pointDTO.setUse_point(Integer.parseInt(sponDTO.getPrice())/100);
		if(result>0){
			result=sponService.spon(pointDTO);
		}
		mv.setViewName("redirect: /busk/");
		return mv;
	}
}
