package com.kh.notice;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.kh.file.FileDAO;




@Service
public class NoticeSerivce {
	
	@Inject
	private NoticeDAO noticeDAO; 
	@Inject
	private FileDAO fileDAO;
	

	
public int noticeWrite(NoticeDTO noticeDTO) throws Exception{
	
	return noticeDAO.noticeWrite(noticeDTO);
}

public int update(NoticeDTO noticeDTO) throws Exception {
	return noticeDAO.update(noticeDTO);
}
	 return noticeDAO.update(noticeDTO);
}
