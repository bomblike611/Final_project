package com.kh.busk;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Update;
import org.springframework.aop.ThrowsAdvice;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.kh.notice.NoticeDTO;
import com.kh.notice.NoticeService;
import com.kh.util.ListData;

@Controller
@RequestMapping(value="/notice/**")
public class NoticeController {
	@Inject
	private NoticeService noticeService;
	
@RequestMapping(value="noticelist")
	public ModelAndView noticelist(ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<NoticeDTO> ar = noticeService.selectList(listData);
		
		mv.addObject("list", ar);
		mv.addObject("page", listData);
		mv.setViewName("notice/noticeList");
		return mv;
	}
@RequestMapping(value="noticewrite", method=RequestMethod.GET)
	public String insert() throws Exception{
		
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

	



