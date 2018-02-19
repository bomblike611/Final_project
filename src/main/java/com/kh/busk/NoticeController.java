package com.kh.busk;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Update;
import org.springframework.aop.ThrowsAdvice;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.notice.NoticeDTO;
import com.kh.notice.NoticeService;
import com.kh.util.ListData;

@Controller
@RequestMapping(value="/notice/**")
public class NoticeController {
	
	@Inject
	private NoticeService noticeService;
	
@RequestMapping(value="noticelist")
	public void noticelist(ListData listData) {
		
	}
@RequestMapping(value="noticewrite", method=RequestMethod.GET)
	public String insert() throws Exception {
		
		return "notice/noticewrite";
	}
     
@RequestMapping(value="noticewrite", method=RequestMethod.POST)
public String insert(NoticeDTO noticeDTO,MultipartFile [] file,HttpSession session, RedirectAttributes re) throws Exception{
	int result=noticeService.insert(noticeDTO, file, session);
	String message="Write Fail";
	if(result>0){
		message="Write Success";
	}
	
	re.addFlashAttribute("message", message);
	return "redirect:./noticelist";
}

@RequestMapping(value="noticeView")
	public ModelAndView selectOne(int num)throws Exception{
	NoticeDTO noticeDTO=noticeService.selectOne(num);
	ModelAndView mv = new ModelAndView();
	mv.addObject("view", noticeDTO);
	mv.setViewName("notice/noticeView");
	return mv;
	
}

}

	



