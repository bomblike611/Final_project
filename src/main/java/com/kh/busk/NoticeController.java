package com.kh.busk;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/notice/**")
public class NoticeController {

@RequestMapping(value="noticelist")
	public void noticelist() {
		
	}
@RequestMapping(value="noticewrite")
	public void noticewrite() {
		
	}
}
