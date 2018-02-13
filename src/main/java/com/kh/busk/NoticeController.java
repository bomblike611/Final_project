package com.kh.busk;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.util.ListData;
import com.kh.notice.NoticeDTO;
import com.kh.notice.NoticeSerivce;

@Controller
@RequestMapping(value="/notice/**")
public class NoticeController {
	
	@Inject
	private NoticeSerivce noticeService;
	
@RequestMapping(value="noticelist")
	public void noticelist(ListData listData) {
		
	}
@RequestMapping(value="noticewrite", method=RequestMethod.GET)
	public void noticewrite() {
		
	}

@RequestMapping(value="noticewrite", method=RequestMethod.POST)
public void noticewrite(NoticeDTO noticeDTO) {
	try {
		noticeService.noticeWrite(noticeDTO);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

}
