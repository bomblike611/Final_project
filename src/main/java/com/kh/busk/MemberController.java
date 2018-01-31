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

@Controller
@RequestMapping(value="/member/**")
public class MemberController {

	@Inject
	private MemberService memberService;
	
	@RequestMapping(value="memberAgree", method=RequestMethod.GET )
	public void memberAgree(){}
	
	
	@RequestMapping(value="memberAgree", method=RequestMethod.POST)
	public String memberAgree(MemberDTO memberDTO, MultipartFile file, HttpSession session) throws Exception{
		
		return "redirect:../";
	}
	
	@RequestMapping(value="memberJoin", method=RequestMethod.GET )
	public void memberJoin(){}
	
	
	@RequestMapping(value="memberJoin", method=RequestMethod.POST)
	public String memberJoin(MemberDTO memberDTO, MultipartFile file, HttpSession session) throws Exception{
		
		return "redirect:../";
	}
	
}
