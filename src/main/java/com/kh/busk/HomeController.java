package com.kh.busk;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.file.SeFileDTO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value="/file/seUpload",method=RequestMethod.POST)
	public String seUpload(SeFileDTO seFileDTO,HttpSession session) throws Exception{
		String file_result="";
		String callback=seFileDTO.getCallback();
		String callback_func=seFileDTO.getCallback_func();
		if(seFileDTO.getFiledata()!=null&&seFileDTO.getFiledata().getOriginalFilename()!=null&&!seFileDTO.getFiledata().getOriginalFilename().equals("")){
		//파일명
		String fileName=seFileDTO.getFiledata().getOriginalFilename();
		fileName=fileName.substring(fileName.lastIndexOf("."));
		fileName=UUID.randomUUID().toString()+fileName;
		
		//저장경로
		String filePath=session.getServletContext().getRealPath("resources/upload");
		File f=new File(filePath);
		if(f.exists()){
			f.mkdir();
		}
		f=new File(filePath, fileName);
		seFileDTO.getFiledata().transferTo(f);
		file_result+= "&bNewLine=true&sFileName="+seFileDTO.getFiledata().getOriginalFilename();
		file_result+="&sFileURL=/busk/resources/upload/"+fileName;
		}else{
			file_result+="&errstr=error";
		}
		System.out.println("redirect:"+callback+"?callback_func="+callback_func+file_result);
		return "redirect:"+callback+"?callback_func="+callback_func+file_result;
		
	}
	
}
