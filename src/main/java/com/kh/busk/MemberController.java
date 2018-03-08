package com.kh.busk;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.member.MemberDTO;
import com.kh.member.MemberService;
import com.kh.notice.NoticeDTO;
import com.kh.notice.NoticeService;
import com.kh.point.PointDTO;
import com.kh.point.PointService;
import com.kh.spon.SponDTO;
import com.kh.spon.SponService;
import com.kh.util.ListData;
import com.kh.util.PageMaker;

@Controller
@RequestMapping(value="/member/**")
public class MemberController {

	@Inject
	private MemberService memberService;
	@Inject
	private NoticeService noticeService;
	@Inject
	private PointService pointService;
	@Inject
	private SponService sponService;
	
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
		if (memberDTO != null) {
			String addar [] = memberDTO.getAddr().split(",");
			mv.addObject("message", "로그인 성공");
			session.setAttribute("member", memberDTO);
			session.setAttribute("addar", addar);
			mv.addObject("path", "../");
		}else{
			mv.addObject("message", "로그인 실패");
			mv.addObject("path", "memberLogin");
		}
		mv.setViewName("common/result");
		return mv;
	}
	
	@RequestMapping(value="memberLogOut")
	public ModelAndView memberLogOut(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", "로그아웃 완료");
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
		String message = "정보수정 실패";
		if (result>0) {
			session.setAttribute("member", memberDTO);
			message = "정보수정 완료";
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", message);
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		return mv;
	}
	
	@RequestMapping(value="memberPwUpdate", method=RequestMethod.POST)
	public ModelAndView memberPwUpdate(MemberDTO memberDTO, HttpSession session) throws Exception{
		int result = memberService.memberPwUpdate(memberDTO);
		String message = "비밀번호 변경 실패";
		if (result>0) {
			session.setAttribute("member", memberDTO);
			message = "비밀번호 변경 완료";
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", message);
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		return mv;
	}
	
	
	@RequestMapping(value="APIUpdate", method=RequestMethod.GET)
	public ModelAndView APIUpdate(MemberDTO memberDTO,  HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		memberDTO.setPw("FaceBook");
		int result = 0;
		MemberDTO memberDTO2 = memberService.memberLogin(memberDTO);
		//memberDTO : id, name, pw   memberDTO2 : MemberDTO or null
		if (memberDTO2 == null) {
			result = memberService.APIUpdate(memberDTO);   // memberDTO : id, name, pw   memberDTO2 : null
			if (result > 0) {
				session.setAttribute("member", memberDTO);  // memberDTO : id, name, pw
				mv.addObject("message", "로그인 성공");  //
				mv.addObject("path", "./memberAPIUpdate");
			}else{
				mv.addObject("message", "로그인 실패");
			}
		}else{ 												//로그인 됨
			session.setAttribute("member", memberDTO);      
			mv.addObject("message", "로그인 성공");
			mv.addObject("path", "../");
		}
		mv.setViewName("common/result");
		return mv;
	}
	
	@RequestMapping(value="memberAPIUpdate", method=RequestMethod.GET)
	public void memberAPIUpdate() throws Exception{}
	
	
	
	@RequestMapping(value="memberAPIUpdate", method=RequestMethod.POST)
	public ModelAndView memberAPIUpdate(MemberDTO memberDTO,  MultipartFile file, HttpSession session) throws Exception{
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
	
	
	
	@RequestMapping(value="memberDelete", method=RequestMethod.POST)
	public ModelAndView memberDelete(HttpSession session, RedirectAttributes rd) throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		int result = memberService.memberDelete(memberDTO, session);
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.addObject("message", "회원 삭제 완료");
			session.invalidate();
		}else{
			mv.addObject("message", "회원 삭제 실패");
		}
		mv.addObject("path", "../");
		mv.setViewName("common/result");
		return mv;
	}
	
	@RequestMapping(value="memberIdCheck", method=RequestMethod.GET)
	public ModelAndView memberIdCheck(String id) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = memberService.memberIdCheck(id);
		if (memberDTO == null) {
			mv.addObject("result", "사용가능한 ID 입니다");
		}else{
			mv.addObject("result", "중복된 아이디입니다.");
		}
		mv.setViewName("common/memberResult");
		return mv;
	}
	
	
	//ID 찾기
	@RequestMapping(value="memberIDSearch", method=RequestMethod.GET)
	public void memberIDSearch() throws Exception{
		
	}
	
	
	@RequestMapping(value="memberID", method=RequestMethod.POST)
	public String memberIdSearch(@RequestParam("email") String email, Model md, HttpServletResponse response) throws Exception{
		md.addAttribute("id", memberService.memberID(email, response));
		return "/member/memberID";
	}
	
	//비밀번호 찾기 
	@RequestMapping(value="memberPWSearch", method=RequestMethod.GET)
	public void memberPWSearch() throws Exception{}
	
	@RequestMapping(value="memberPW", method=RequestMethod.POST)
	public String memberPwSearch(@RequestParam("email") String email, Model md, HttpServletResponse response) throws Exception{
		md.addAttribute("pw", memberService.memberPW(email, response));
		return "member/memberPW";
	}
	
	@RequestMapping(value="member1", method=RequestMethod.GET)
	public ModelAndView member(ListData listData, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		PointDTO pointDTO = new PointDTO();
		SponDTO sponDTO = new SponDTO();
		pointDTO.setId(memberDTO.getId());
		sponDTO.setId(memberDTO.getId());
		List<NoticeDTO> ar = noticeService.selectList(listData);
		List<PointDTO> ar2 = pointService.pointList(pointDTO);
		List<SponDTO> ar3 = sponService.sponList(sponDTO);
		for(int i=0; i<ar.size();i++){
			String s = ar.get(i).getReg_date();
			s=s.substring(0,10);
			ar.get(i).setReg_date(s);
		}
		
		for(int u=0; u<ar2.size();u++){
			String k = ar2.get(u).getUse_date();
			k=k.substring(0,10);
			ar2.get(u).setUse_date(k);
		}
		
		mv.addObject("list", ar);
		mv.addObject("pointList", ar2);
		mv.addObject("sponList", ar3);
		mv.addObject("page", listData);
		mv.setViewName("member/member1");
		return mv;
	}
	
	@RequestMapping(value="memberNoticeList", method=RequestMethod.GET)
	public ModelAndView memberNoticeList(ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<NoticeDTO> ar = noticeService.selectList(listData);
		for(int i=0; i<ar.size();i++){
			String s = ar.get(i).getReg_date();
			s=s.substring(0,10);
			ar.get(i).setReg_date(s);
		}
		mv.addObject("list", ar);
		mv.addObject("page", listData);
		mv.setViewName("member/memberNoticeList");
		return mv;
	}
	
	@RequestMapping(value="memberNoticeView", method=RequestMethod.GET)
	public ModelAndView selectOne(int num)throws Exception{
		NoticeDTO noticeDTO=noticeService.selectOne(num);
		ModelAndView mv = new ModelAndView();
		String s = noticeDTO.getReg_date();
		s=s.substring(0, 10);
		mv.addObject("view", noticeDTO);
		mv.setViewName("member/memberNoticeView");
		return mv;

	}
	
	@RequestMapping(value="memberPointList", method=RequestMethod.GET)
	public ModelAndView memberPointList(HttpSession session, ListData listData)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		PointDTO pointDTO = new PointDTO();
		pointDTO.setId(memberDTO.getId());
		List<PointDTO> ar = pointService.pointList(pointDTO);
		for(int i=0; i<ar.size();i++){
			String s = ar.get(i).getUse_date();
			s=s.substring(0,10);
			ar.get(i).setUse_date(s);;
		}
		mv.addObject("list", ar);
		mv.addObject("page", listData);
		mv.setViewName("member/memberPointList");
		return mv;
	}
	
	@RequestMapping(value="memberSponList", method=RequestMethod.GET)
	public ModelAndView memberSponList(HttpSession session, ListData listData)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		SponDTO sponDTO = new SponDTO();
		sponDTO.setId(memberDTO.getId());
		List<SponDTO> ar = sponService.sponList(sponDTO);
		
		mv.addObject("list", ar);
		mv.addObject("page", listData);
		mv.setViewName("member/memberSponList");
		return mv;
	}
	
	@RequestMapping(value="access", method=RequestMethod.GET)
	public void Access() throws Exception{
	}
	
}
