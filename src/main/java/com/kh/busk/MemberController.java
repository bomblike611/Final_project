package com.kh.busk;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.member.MemberDTO;
import com.kh.member.MemberService;

@Controller
@RequestMapping(value="/member/**")
public class MemberController {

	@Inject
	private MemberService memberService;
	
	@RequestMapping(value="memberIdCheck")
	public ModelAndView memberIdCheck()throws Exception{
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	
	@RequestMapping(value="memberAgree", method=RequestMethod.GET )
	public void memberAgree(){}
	
	
	@RequestMapping(value="memberAgree", method=RequestMethod.POST)
	public String memberAgree(MemberDTO memberDTO, MultipartFile file, HttpSession session) throws Exception{
		
		return "redirect:../";
	}
	
	@RequestMapping(value="memberJoinOK", method=RequestMethod.GET )
	public void memberJoinOK(){}
	
	@RequestMapping(value="memberJoin", method=RequestMethod.GET )
	public void memberJoin(){}
	
	
	@RequestMapping(value="memberJoin", method=RequestMethod.POST)
	public ModelAndView memberJoin(MemberDTO memberDTO,  MultipartFile file, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result=memberService.memberJoin(memberDTO, file, session);
		if (result > 0) {
			mv.addObject("message", "회원가입 완료");
			mv.addObject("path", "./memberJoinOK");
			mv.setViewName("common/result");
		}else{
			mv.addObject("message", "회원가입 실패");
			mv.addObject("path", "../");
			mv.setViewName("common/result");
		}
		
		return mv;
	}
	
	
	@RequestMapping(value="memberLogin", method=RequestMethod.GET )
	public void memberLogin(){}
	
	
	@RequestMapping(value="memberLogin", method=RequestMethod.POST)
	public ModelAndView memberLogin(MemberDTO memberDTO,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		memberDTO = memberService.memberLogin(memberDTO);
		String addr = memberDTO.getAddr();
		String addar [] = addr.split(",");
		if (memberDTO != null) {
			mv.addObject("message", "LogIn Success");
			session.setAttribute("member", memberDTO);
			session.setAttribute("addar", addar);
		}else{
			mv.addObject("message", "Login Fail");
		}
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		return mv;
	}
	
	@RequestMapping(value="memberLogOut")
	public ModelAndView memberLogOut(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", "LogOut Success");
		session.invalidate();
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		return mv;
	}
	
	
	@RequestMapping(value="memberMyPage")
	public void memberMyPage(HttpSession session) throws Exception{}
	
	@RequestMapping(value="memberUpdate", method=RequestMethod.POST)
	public ModelAndView memberUpdate(MemberDTO memberDTO, MultipartFile file, HttpSession session) throws Exception{
		int result = memberService.memberUpdate(memberDTO, file, session);
		String message = "Update Fail";
		if (result>0) {
			session.setAttribute("member", memberDTO);
			message = "Update Success";
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", message);
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		return mv;
	}
	
	@RequestMapping(value="memberDelete", method=RequestMethod.POST)
	public ModelAndView memberDelete(HttpSession session, RedirectAttributes rd) throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		int result = memberService.memberDelete(memberDTO, session);
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.addObject("message", "Delete Success");
			session.invalidate();
		}else{
			mv.addObject("message", "Delete Fail");
		}
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
