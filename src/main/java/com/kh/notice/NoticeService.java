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
	@Inject
	private FileDAO fileDAO; 
	
	public int noticewrite(NoticeDTO noticeDTO) throws Exception{
		
		return noticeDAO.noticeWrite(noticeDTO);
	}
	
	
	public int update(NoticeDTO noticeDTO, HttpSession session,MultipartFile [] file) throws Exception{
		FileSaver fileSaver = new FileSaver();
	      String filepath = session.getServletContext().getRealPath("resources/upload");
	      File f = new File(filepath);
	      if(!f.exists()){
	         f.mkdirs();
	      }
		
		return noticeDAO.update(noticeDTO);
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
		
		List<String> names=fileSaver.saver(file, filepath);
		
		
		for(int i=0;i<names.size();i++){
	         FileDTO fileDTO=new FileDTO();
	         fileDTO.setLoc_name("null");
	         fileDTO.setTeamName("null");
	         fileDTO.setNum(noticeDTO.getNum());
	         fileDTO.setFname(names.get(i));
	         fileDTO.setOname(file[i].getOriginalFilename());
	         fileDAO.insert(fileDTO);
	         }
			
		
		return result;
	}
	
	public int delete(int num, HttpSession session) throws Exception {
		String filePath = session.getServletContext().getRealPath("resources/upload");
		List<FileDTO> ar= fileDAO.selectList(num);
		int result=noticeDAO.delete(num);
		FileDTO fileDTO1 = new FileDTO();
		fileDTO1.setNum(num);
		result = fileDAO.delete(fileDTO1);
		for(FileDTO fileDTO: ar){
			try{
				File file = new File(filePath, fileDTO.getFname());
				file.delete();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
}
		
		
		
		 

