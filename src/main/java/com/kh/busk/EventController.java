package com.kh.busk;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.member.MemberDTO;
import com.kh.point.PointDTO;
import com.kh.point.PointService;

@RequestMapping(value="/event/**")
@Controller
public class EventController {
	
	@Inject
	private PointService pointService;
	
	@RequestMapping(value="pointRotate")
	public void pointRotate() throws Exception{
		
	}
	
	@RequestMapping(value="pointInsert")
	public ModelAndView pointInsert(PointDTO pointDTO,HttpSession session) throws Exception{
		MemberDTO memberDTO=(MemberDTO)session.getAttribute("member");
		ModelAndView mv=new ModelAndView();
		if(memberDTO!=null){
			pointDTO.setReason("룰렛 포인트 적립");
			pointDTO.setId(memberDTO.getId());
			int result=pointService.insert(pointDTO);			
			if(result>0){
				mv.addObject("result", "축하드립니다~ "+pointDTO.getUse_point()+"점 획득하였습니다!");
			}else{
				mv.addObject("result", "점수 획득 실패!");
			}
		}else{
			System.out.println("dd");
			mv.addObject("result", "로그아웃되었거나 회원정보가 존재하지 않습니다.");
		}
		mv.setViewName("common/fileResult");
		return mv;
	}
	
}
