package com.kh.busk;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
		l.setNum(0);
		LocationDTO locationDTO=locationDAO.locationView(l);
		model.addAttribute("team", memberDTO);
		model.addAttribute("view", buskingDTO2);
		model.addAttribute("fileAr", ar);
		model.addAttribute("loc", locationDTO);

	}

	@RequestMapping(value="buskWrite",method=RequestMethod.GET)
	public void buskWrite(Model model,HttpSession session) throws Exception{
		MemberDTO memberDTO=(MemberDTO)session.getAttribute("member");
		ListData listData=new ListData();
		int totalCount=locationDAO.locationTotalCount(listData);
		listData.setStartRow(1);
		listData.setLastRow(totalCount);
		List<LocationDTO> loc_ar=locationDAO.locationList(listData);
		model.addAttribute("loc", loc_ar);
		model.addAttribute("team", memberDTO);
	}
	
	@RequestMapping(value="buskWrite",method=RequestMethod.POST)
	public ModelAndView buskWrite(BuskingDTO buskingDTO,HttpSession session,MultipartFile [] file,MultipartFile f) throws Exception{
		ModelAndView mv=new ModelAndView();
		if(buskingDTO.getAudio()==null){
			buskingDTO.setAudio("null");
		}
		System.out.println(buskingDTO.getAudio());
		int result=buskingService.insert(buskingDTO, session, file,f);
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
		ListData listData=new ListData();
		int totalCount=locationDAO.locationTotalCount(listData);
		listData.setStartRow(1);
		listData.setLastRow(totalCount);
		List<LocationDTO> loc_ar=locationDAO.locationList(listData);
		BuskingDTO buskingDTO2=buskingService.selectOne(buskingDTO);
		String date=buskingDTO2.getBusk_date();
		String [] ar=date.split(" ");
		String [] ar2=ar[0].split("-");
		System.out.println(ar2[0]+" "+ar2[1]+" "+ar2[2]);
		System.out.println("ssss");
		Date date2=null;
		Calendar ca=Calendar.getInstance();
		String st=null;
		try {
			ca.set(Integer.parseInt(ar2[0]),Integer.parseInt(ar2[1])-1,Integer.parseInt(ar2[2]));
			SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd");
			st=sf.format(ca.getTime());
		} catch (Exception e) {
			e.printStackTrace();
		}
        model.addAttribute("date", st);
		model.addAttribute("loc", loc_ar);
		model.addAttribute("view", buskingDTO2);
	}
	@RequestMapping(value="buskUpdate",method=RequestMethod.POST)
	public ModelAndView buskUpdate(BuskingDTO buskingDTO,HttpSession session,MultipartFile [] file,MultipartFile f) throws Exception{
		int result=buskingService.update(buskingDTO, session, file,f);
		ModelAndView mv=new ModelAndView();
		String s="Fail";
		if(result>0){
			s="Success";
		}
		mv.addObject("message", s);
		mv.addObject("path", "buskView?num="+buskingDTO.getNum()+"&id="+buskingDTO.getWriter());
		mv.setViewName("common/result");
		return mv;
	}

	@RequestMapping(value="buskList")
	public ModelAndView buskList(ListData listData) throws Exception{
		ModelAndView mv=new ModelAndView();
		listData.setPerPage(9);
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
		boolean check=true;
		String s="fail";
		if(memberDTO!=null){
			EntryDTO entryDTO=new EntryDTO();
			entryDTO.setBusk_num(buskingDTO.getNum());
			entryDTO.setId(memberDTO.getId());
			List<EntryDTO> ar=entryService.selectList(entryDTO);
			for(EntryDTO entryDTO2:ar){
				if(ar==null||entryDTO2.getBusk_num()==buskingDTO.getNum()){
					check=false;
				}
			}
			if(check){
				System.out.println(entryDTO.getId());
				int result=entryService.insert(entryDTO);
				if(result>0){
					result=buskingService.entryUpdate(buskingDTO);
					if(result>0){
						s="Success";
					}
				}
			}else{
				s="참가는 한번만 가능합니다.";
			}
		}
		mv.addObject("path", "buskView?num="+buskingDTO.getNum()+"&id="+buskingDTO.getWriter());
		mv.addObject("message",s);
		mv.setViewName("common/result");
		return mv;
	}
	
	@RequestMapping(value="./audioSave")
	public void audioSave(MultipartFile file)throws Exception{
		
	}
	

}
