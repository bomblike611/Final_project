package com.kh.busk;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.member.MemberDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session) {
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId("456red");
		memberDTO.setName("이두호");
		memberDTO.setPhone("010-9689-9880");
		memberDTO.setEmail("456red@naver.com");
		session.setAttribute("member", memberDTO);
		return "home";
	}
	
}
