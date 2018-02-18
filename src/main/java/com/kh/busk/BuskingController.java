package com.kh.busk;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.busking.BuskingDTO;
import com.kh.busking.BuskingService;
import com.kh.entry.EntryDTO;
import com.kh.entry.EntryService;
import com.kh.file.FileDAO;
import com.kh.file.FileDTO;
import com.kh.location.LocationDAO;
import com.kh.location.LocationDTO;
import com.kh.location.LocationService;
import com.kh.member.MemberDTO;
import com.kh.member.MemberService;
import com.kh.util.ListData;

@RequestMapping(value="/busking/**")
@Controller
public class BuskingController {
	
	@Inject
	private BuskingService buskingService;
	@Inject
	private FileDAO fileDAO;
	@Inject
	private MemberService memberService;
	@Inject
	private LocationDAO locationDAO;
	@Inject
	private EntryService entryService;

	@RequestMapping(value="buskView")
	public void buskView(String id,BuskingDTO buskingDTO,Model model) throws Exception{
		MemberDTO memberDTO=memberService.memberView(id);
		BuskingDTO buskingDTO2=buskingService.selectOne(buskingDTO);
		List<FileDTO> ar=fileDAO.selectList();
		LocationDTO l=new LocationDTO();
		l.setLoc_name(buskingDTO2.getLocation());
		LocationDTO locationDTO=locationDAO.locationView(l);
		model.addAttribute("team", memberDTO);
		model.addAttribute("view", buskingDTO2);
		model.addAttribute("fileAr", ar);
		model.addAttribute("loc", locationDTO);

	}
	
	@RequestMapping(value="buskWrite",method=RequestMethod.GET)
	public void buskWrite(BuskingDTO buskingDTO,Model model) throws Exception{
		BuskingDTO buskingDTO2=buskingService.selectOne(buskingDTO);
		
		List<FileDTO> ar=fileDAO.selectList();
		model.addAttribute("view", buskingDTO2);
		model.addAttribute("files", ar);
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
	
	@RequestMapping(value="buskUpdate",method=RequestMethod.GET)
	public void buskUpdate(BuskingDTO buskingDTO,Model model) throws Exception{
		BuskingDTO buskingDTO2=buskingService.selectOne(buskingDTO);
		List<FileDTO> ar=fileDAO.selectList();
		model.addAttribute("files", ar);
		model.addAttribute("view", buskingDTO2);
	}
	@RequestMapping(value="buskUpdate",method=RequestMethod.POST)
	public ModelAndView buskUpdate(BuskingDTO buskingDTO,HttpSession session,MultipartFile [] file) throws Exception{
		int result=buskingService.update(buskingDTO, session, file);
		ModelAndView mv=new ModelAndView();
		String s="Fail";
		if(result>0){
			s="Success";
		}
		mv.addObject("message", s);
		mv.addObject("path", "./buskView?num="+buskingDTO.getNum());
		mv.setViewName("common/result");
		return mv;
	}
	
	@RequestMapping(value="buskList")
	public ModelAndView buskList(ListData listData) throws Exception{
		ModelAndView mv=new ModelAndView();
		listData.setPerPage(6);
		mv=buskingService.selectList(listData, mv);
		mv.setViewName("busking/buskList");
		return mv;
	}
	@RequestMapping(value="buskDelete")
	public ModelAndView buskDelete(BuskingDTO buskingDTO,HttpSession session) throws Exception{
		ModelAndView mv=new ModelAndView();
		
		int result=buskingService.delete(buskingDTO, session);
		String message="fail";
		if(result>0){
			message="success";
		}
		mv.addObject("message", message);
		mv.addObject("path", "./buskList");
		mv.setViewName("common/result");
		return mv;
	}
	
	@RequestMapping(value="entryUpdate")
	public ModelAndView entryUpdate(BuskingDTO buskingDTO,HttpSession session) throws Exception{
		MemberDTO memberDTO=(MemberDTO)session.getAttribute("member");
		ModelAndView mv=new ModelAndView();
		EntryDTO entryDTO=new EntryDTO();
		entryDTO.setBusk_num(buskingDTO.getNum());
		entryDTO.setId(memberDTO.getId());
		int result=entryService.insert(entryDTO);
		String s="fail";
		if(result>0){
			result=buskingService.entryUpdate(buskingDTO);
			if(result>0){
				s="Success";
			}
		}
		mv.addObject("path", "buskView?num="+buskingDTO.getNum()+"&id="+buskingDTO.getWriter());
		mv.addObject("message",s);
		mv.setViewName("common/result");
		return mv;
	}
	
	
}
