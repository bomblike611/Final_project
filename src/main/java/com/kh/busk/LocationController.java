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

import com.kh.file.FileDAO;
import com.kh.file.FileDTO;
import com.kh.location.LocationDTO;
import com.kh.location.LocationService;
import com.kh.util.FileSaver;
import com.kh.util.ListData;

@Controller
@RequestMapping(value="/location/**")
public class LocationController {
	
	@Inject
	private LocationService locationService;
	@Inject
	private FileDAO fileDAO;
	
	@RequestMapping(value="locationWrite",method=RequestMethod.GET)
	public void locationWrite() throws Exception{	
	}
	
	@RequestMapping(value="locationWrite",method=RequestMethod.POST)
	public String locationWrite(LocationDTO locationDTO,MultipartFile [] file,HttpSession session) throws Exception{
		int result=locationService.locationInsert(locationDTO, session, file);
		return "redirect:./locationList";
	}
	
	@RequestMapping(value="locationList")
	public ModelAndView locationList(ListData listData) throws Exception{
		ModelAndView mv=new ModelAndView();
		listData.setPerPage(6);
		mv=locationService.locationList(listData,mv);
		mv.setViewName("location/locationList");
		return mv;
	}
	
	@RequestMapping(value="locationUpdate",method=RequestMethod.GET)
	public void locationUpdate(LocationDTO locationDTO,Model model) throws Exception{
		LocationDTO locationDTO2=locationService.locationView(locationDTO);
		List<FileDTO> ar=fileDAO.selectList();
		model.addAttribute("view", locationDTO2);
		model.addAttribute("files", ar);
	}
	
	
	@RequestMapping(value="locationUpdate",method=RequestMethod.POST)
	public ModelAndView locationUpdate(LocationDTO locationDTO,HttpSession session,MultipartFile [] file) throws Exception{
		int result=locationService.locationUpdate(locationDTO, session, file);
		ModelAndView mv=new ModelAndView();
		String s="Fail";
		if(result>0){
			s="Success";
		}
		mv.addObject("message", s);
		mv.addObject("path", "./locationView?num="+locationDTO.getNum());
		mv.setViewName("common/result");
		return mv;
	}
	@RequestMapping(value="locationMap")
	public void locationMap() throws Exception{
		
	}
	@RequestMapping(value="locationView")
	public void locationView(LocationDTO locationDTO,Model model) throws Exception{
		LocationDTO locationDTO2=locationService.locationView(locationDTO);
		List<FileDTO> ar=fileDAO.selectList();
		model.addAttribute("view", locationDTO2);
		model.addAttribute("files", ar);
	}
	
	@RequestMapping(value="locationDelete")
	public ModelAndView locationDelete(LocationDTO locationDTO,HttpSession session) throws Exception{
		ModelAndView mv=new ModelAndView();
		
		int result=locationService.locationDelete(locationDTO, session);
		String message="fail";
		if(result>0){
			message="success";
		}
		mv.addObject("message", message);
		mv.addObject("path", "./locationList");
		mv.setViewName("common/result");
		return mv;
	}
	
	@RequestMapping(value="fileDelete")
	public ModelAndView fileDelete(FileDTO fileDTO,HttpSession session) throws Exception{
		ModelAndView mv=new ModelAndView();
		FileSaver fileSaver=new FileSaver();
		String filepath=session.getServletContext().getRealPath("resources/upload");
		fileSaver.fileDelete(filepath, fileDTO.getFname());
		int result=fileDAO.Delete(fileDTO);
		String s="fail";
		if(result>0){
			s="Success";
		}
		mv.addObject("result", s);
		mv.setViewName("common/fileResult");
		return mv;
	}
	
}
