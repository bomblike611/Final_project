package com.kh.busk;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.member.MemberService;

@Controller
@RequestMapping(value="/admin/**")
public class AdminController {
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value="memberList")
	public void memberList()throws Exception{
		
	}
	
	@RequestMapping(value="singerJoin")
	public void singerJoin()throws Exception{
		
	}
	
}
