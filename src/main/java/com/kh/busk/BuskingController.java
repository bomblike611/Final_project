package com.kh.busk;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.busking.BuskingDTO;
import com.kh.busking.BuskingService;

@RequestMapping(value="/busking/**")
@Controller
public class BuskingController {
	
	@Inject
	private BuskingService buskingService;

	@RequestMapping(value="buskView")
	public void buskView() throws Exception{
		
	}
	
	@RequestMapping(value="buskWrite",method=RequestMethod.GET)
	public void buskWrite() throws Exception{
		
	}
	@RequestMapping(value="buskWrite",method=RequestMethod.POST)
	public ModelAndView buskWrite(BuskingDTO buskingDTO,HttpSession session,MultipartFile [] file) throws Exception{
		ModelAndView mv=new ModelAndView();
		int result=buskingService.insert(buskingDTO, session, file);
		if(result>0){
			mv.setViewName("redirect:../busking/buskList");
		}else{
			mv.addObject("message", "글쓰기 실패");
			mv.addObject("path", "./buskList");
			mv.setViewName("common/result");
		}
		return mv;
	}
	
	@RequestMapping(value="buskUpdate")
	public void buskUpdate() throws Exception{
		
	}
	
	@RequestMapping(value="buskList")
	public void buskList() throws Exception{
		
	}
	
}
