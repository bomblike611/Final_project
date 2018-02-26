package com.kh.busk;

import java.util.List;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value="singerUpdate")
	public ModelAndView singerUpdate(MemberDTO memberDTO)throws Exception{
		ModelAndView mv=new ModelAndView();
		/*System.out.println(memberDTO.getId());*/
		int result=memberService.singerUpdate(memberDTO);
		mv.addObject("result", "승인완료");
		mv.setViewName("common/fileResult");
	return mv;
	}
	
	@RequestMapping(value="adminDelete")
	public ModelAndView memberDelete(HttpSession session,MemberDTO memberDTO) throws Exception{
		MemberDTO memberDTO2=memberService.memberView(memberDTO.getId());
		int result = memberService.memberDelete(memberDTO2, session);
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.addObject("result", "Delete Success");
			session.invalidate();
		}else{
			mv.addObject("result", "Delete Fail");
		}
		mv.setViewName("common/fileResult");
		return mv;
	}
	
	@RequestMapping(value = "mailSender")
	public ModelAndView mailSender(String [] email, ModelMap mo,String subject,String body) throws AddressException, MessagingException {
		ModelAndView mv=new ModelAndView();
		// 네이버일 경우 smtp.naver.com 을 입력합니다.
		// Google일 경우 smtp.gmail.com 을 입력합니다.
		String host = "smtp.daum.net";
		
		final String username = "rhtn611";       
		final String password = "busking01";   //네이버 이메일 비밀번호를 입력해주세요.
		int port=465; //포트번호
		 
		// 메일 내용
		for(int i=0;i<email.length;i++){
			
			String recipient = email[i];    //받는 사람의 메일주소를 입력해주세요.
			if(subject==null){
				subject="반갑습니다. 노래왕 버스킹 홈페이지 입니다.";
				body="반갑습니다. 노래왕 버스킹 홈페이지 입니다.";
			}
			Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성
			
			// SMTP 서버 정보 설정
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", port);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.trust", host);
			
			//Session 생성
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				String un=username;
				String pw=password;
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication(un, pw);
				}
			});
			session.setDebug(true); //for debug
			
			Message mimeMessage = new MimeMessage(session); //MimeMessage 생성
			mimeMessage.setFrom(new InternetAddress("rhtn611@daum.net")); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요.
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음
			
			
			mimeMessage.setSubject(subject);  //제목셋팅
			mimeMessage.setText(body);        //내용셋팅
			Transport.send(mimeMessage); //javax.mail.Transport.send() 이용
		}
		
		mv.setViewName("redirect:../admin/memberList");
		return mv;
	}
	@RequestMapping(value="NewFile")
	public void NewFile() throws Exception{
		
	}
}
