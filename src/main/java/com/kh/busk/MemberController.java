package com.kh.busk;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.member.MemberDTO;
import com.kh.member.MemberService;
import com.kh.singer.SingerDTO;

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
	public ModelAndView memberJoin(SingerDTO singerDTO,  MultipartFile file, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("file : " + file);
		int result=memberService.memberJoin(singerDTO, file, session);
		int result2=0;
		if(singerDTO.getJob().equals("singer")){
			result2=memberService.singerJoin(singerDTO);
		}
		System.out.println("re:"+result);
		System.out.println("re2:"+result2);
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
	public String memberLogin(MemberDTO memberDTO, MultipartFile file, HttpSession session) throws Exception{
		
		return "redirect:../";
	}
	
	
	
	
	
}
