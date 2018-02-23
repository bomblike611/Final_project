package com.kh.member;

import java.io.File;
import java.io.PrintStream;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.member.MemberDTO;
import com.kh.util.FileSaver;

@Service
public class MemberService {

	@Inject
	private MemberDAO memberDAO;
	private PrintStream out;

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
	
	public int APIUpdate(MemberDTO memberDTO) throws Exception{
		return memberDAO.APIUpdate(memberDTO);
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
	
	
	//ID 찾기
	public String memberID(String email, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = memberDAO.memberID(email);
		
		if (id == null){
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}else{
			
			return id;
		}
		
	}

	//PW 찾기
	public String memberPW(String email, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String pw = memberDAO.memberPW(email);
		
		if (pw == null) {
			out.println("<script>");
			out.println("alert('이메일에 해당하는 비밀번호가  없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}else{
			return pw;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
