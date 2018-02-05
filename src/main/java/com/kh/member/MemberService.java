package com.kh.member;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.singer.SingerDTO;
import com.kh.util.FileSaver;

@Service
public class MemberService {

	@Inject
	private MemberDAO memberDAO;

	public int memberJoin(SingerDTO singerDTO, MultipartFile file, HttpSession session) throws Exception {
		String filePath = session.getServletContext().getRealPath("resources/upload");
		System.out.println(filePath);
		File f = new File(filePath);
		if (!f.exists()) {
			f.mkdirs();
		}
		FileSaver fs = new FileSaver();

		String name = fs.saver(file, filePath);
		singerDTO.setFname(name);
		singerDTO.setOname(file.getOriginalFilename());
		int result = memberDAO.memberJoin(singerDTO);

		return result;
	}

	public int singerJoin(SingerDTO singerDTO) throws Exception {

		return memberDAO.singerJoin(singerDTO);
	}
}
