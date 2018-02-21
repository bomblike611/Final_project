package com.kh.busk;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.member.MemberDTO;
import com.kh.member.MemberService;
import com.kh.util.ListData;
import com.kh.util.PageMaker;

@Controller
@RequestMapping(value="/admin/**")
public class AdminController {
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value="memberList")
	public void memberList(ListData listData,Model model)throws Exception{
		int totalCount=memberService.totalCount(listData);
		PageMaker pageMaker=new PageMaker();
		pageMaker.pageMaker(totalCount, listData);
		List<MemberDTO> ar=memberService.memberList(listData);
		model.addAttribute("list", ar);
		model.addAttribute("page", listData);
	}
	
	@RequestMapping(value="singerJoin")
	public void singerJoin(ListData listData,Model model)throws Exception{
		int totalCount=memberService.totalCount(listData);
		PageMaker pageMaker=new PageMaker();
		pageMaker.pageMaker(totalCount, listData);
		List<MemberDTO> ar=memberService.singerList(listData);
		model.addAttribute("list", ar);
		model.addAttribute("page", listData);
	}
	
}
