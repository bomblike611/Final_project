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



import com.kh.util.ListData;


import com.kh.notice.NoticeDTO;
import com.kh.notice.NoticeService;
import com.kh.util.ListData;

@Controller
@RequestMapping(value="/notice/**")
public class NoticeController {
	
	@Inject
	private NoticeService noticeService;
	
@RequestMapping(value="noticelist")
	public ModelAndView selectList(ListData listData) throws Exception {
		
	ModelAndView mv = new ModelAndView();
	List<NoticeDTO> ar = noticeService.selectList(listData);
	for(int i=0; i<ar.size();i++){
		String s = ar.get(i).getReg_date();
		s=s.substring(0, 10);
		ar.get(i).setReg_date(s);
	}
	
	mv.addObject("list", ar);
	mv.addObject("page", listData);
	mv.setViewName("notice/noticelist");
	return mv;
	}

@RequestMapping(value="noticewrite", method=RequestMethod.GET)
	public String insert() throws Exception {
		
		return "notice/noticewrite";
	}
     
@RequestMapping(value="noticewrite", method=RequestMethod.POST)
public String insert(NoticeDTO noticeDTO,MultipartFile[] file,HttpSession session, RedirectAttributes re) throws Exception{
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

@RequestMapping(value="Update", method=RequestMethod.GET)
public String noticeupdate(int num, Model model)throws Exception{
	NoticeDTO noticeDTO = noticeService.selectOne(num);
	model.addAttribute("view", noticeDTO);
	
	return "notice/noticeUpdate";
}

@RequestMapping(value="Update",method=RequestMethod.POST)
public ModelAndView noticeUpdate(NoticeDTO noticeDTO,MultipartFile [] file,HttpSession session) throws Exception{
   ModelAndView mv=new ModelAndView();
   System.out.println(noticeDTO.getWriter());
   System.out.println(noticeDTO.getNum());
   int result=noticeService.update(noticeDTO, session, file);
   String s="Fail";
   if(result>0){
      s="Success";
   }
   mv.addObject("message", s);
   mv.addObject("path", "noticeView?num="+noticeDTO.getNum());
   mv.setViewName("common/result");
   return mv;
   
}

public String delete(int num, HttpSession session)throws Exception{
	int result=noticeService.delete(num, session);
	
	return "redirect:./noticeList";
	
}


	}


	



