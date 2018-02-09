package com.kh.member;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.member.MemberDTO;
import com.kh.util.FileSaver;

@Service
public class MemberService {

	@Inject
	private MemberDAO memberDAO;

	public int memberJoin(MemberDTO memberDTO, MultipartFile file, HttpSession session) throws Exception {
		String filePath = session.getServletContext().getRealPath("resources/upload");
		System.out.println(file);
		File f = new File(filePath);
		if (!f.exists()) {
			f.mkdirs();
		}
		if (!file.getOriginalFilename().equals("")) {
			FileSaver fs = new FileSaver();
			String name = fs.saver(file, filePath);
			memberDTO.setFname(name);
			memberDTO.setOname(file.getOriginalFilename());
		}else{
			memberDTO.setFname("노답.jpg");
			memberDTO.setOname("노답.jpg");
		}
		int result = memberDAO.memberJoin(memberDTO);
		return result;
	}
	
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception{
		return memberDAO.memberLogin(memberDTO);
	}

	public int memberUpdate(MemberDTO memberDTO, MultipartFile file, HttpSession session) throws Exception{
		if(file != null){
			String filePath = session.getServletContext().getRealPath("resources/upload");
			File f = new File(filePath);
			if(!f.exists()){
				f.mkdirs();
			}
			FileSaver fs = new FileSaver();
			String fileName = fs.saver(file, filePath);
			memberDTO.setFname(fileName);
			memberDTO.setOname(file.getOriginalFilename());
		}else{
			memberDTO.setFname(((MemberDTO)session.getAttribute("member")).getFname());
			memberDTO.setOname(((MemberDTO)session.getAttribute("member")).getOname());
		}
		return memberDAO.memberUpdate(memberDTO);
	}
	
	
	public int memberDelete(MemberDTO memberDTO, HttpSession session) throws Exception{
		String filePath = session.getServletContext().getRealPath("resources/upload");
		File f = new File(filePath, memberDTO.getFname());
		f.delete();
		return memberDAO.memberDelete(memberDTO);
	}
	
	
	public MemberDTO memberIdCheck(String id) throws Exception{
		return memberDAO.memberIdCheck(id);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
