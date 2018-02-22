package com.kh.member;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.member.MemberDTO;
import com.kh.util.FileSaver;
import com.kh.util.ListData;

@Service
public class MemberService {

	@Inject
	private MemberDAO memberDAO;

	public int memberJoin(MemberDTO memberDTO, MultipartFile file, HttpSession session) throws Exception {
		String filePath = session.getServletContext().getRealPath("resources/upload");
		System.out.println(filePath);
		File f = new File(filePath);
		if (!f.exists()) {
			f.mkdirs();
		}
		FileSaver fs = new FileSaver();
		String name = fs.saver(file, filePath);
		memberDTO.setFname(name);
		memberDTO.setOname(file.getOriginalFilename());
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
	
	public MemberDTO memberView(String id)throws Exception{
		return memberDAO.memberView(id);
	}
	
	
	public List<MemberDTO> memberList(ListData listData) throws Exception{
		return memberDAO.memberList(listData);
	}
	
	
	public List<MemberDTO> singerList(ListData listData) throws Exception{
		return memberDAO.singerList(listData);
	}
	
	public int totalCount(ListData listData) throws Exception{
		return memberDAO.totalCount(listData);
	}
	public int singerUpdate(MemberDTO memberDTO) throws Exception{
		return memberDAO.singerUpdate(memberDTO);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
