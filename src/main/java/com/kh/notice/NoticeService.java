package com.kh.notice;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.file.FileDAO;
import com.kh.file.FileDTO;
import com.kh.util.FileSaver;
import com.kh.util.ListData;
import com.kh.util.PageMaker;

@Service
public class NoticeService {

	@Inject
	private NoticeDAO noticeDAO;
	private FileDAO fileDAO; 
	
	public int noticeWrite(NoticeDTO noticeDTO) throws Exception{
		
		return noticeDAO.noticeWrite(noticeDTO);
	}

		public List<NoticeDTO> selectList(ListData listData) throws Exception {
			int totalCount = noticeDAO.totalCount(listData);
			PageMaker pageMaker = new PageMaker();
			pageMaker.pageMaker(totalCount, listData);
			return noticeDAO.selectList(listData);
		}
	
	public NoticeDTO selectOne(int num) throws Exception {
		return noticeDAO.selectOne(num);
	}
	
	public int insert(NoticeDTO noticeDTO,MultipartFile [] file, HttpSession session) throws Exception{
		
		int result=noticeDAO.noticeWrite(noticeDTO);
		FileSaver fileSaver = new FileSaver();
		String filepath = session.getServletContext().getRealPath("resources/upload");
		System.out.println(filepath);
		File f = new File(filepath);
		if(!f.exists()){
			f.mkdirs();
		}
		
		
		return result;
	}
		
	}
	
	
		
		
		
		 

