package com.kh.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class MemberService {

	@Inject
	private MemberDAO memberDAO;
	
	public int memberJoin(MemberDTO memberDTO, MultipartFile file, HttpSession session) throws Exception{
		return memberDAO.memberJoin(memberDTO);
	}
	
	
}
