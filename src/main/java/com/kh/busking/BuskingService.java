package com.kh.busking;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.file.FileDAO;
import com.kh.file.FileDTO;
import com.kh.util.FileSaver;
import com.kh.util.ListData;
import com.kh.util.PageMaker;

@Service
public class BuskingService {

	@Inject
	private BuskingDAO buskingDAO;
	@Inject
	private FileDAO fileDAO;

	public int insert(BuskingDTO buskingDTO,HttpSession session,MultipartFile [] files,MultipartFile file) throws Exception{
		String filepath=session.getServletContext().getRealPath("resources/upload");
		File f=new File(filepath);
		if(!f.exists()){
			f.mkdir();
		}
		FileSaver fileSaver=new FileSaver();
		if(file.getOriginalFilename()!=""){
			System.out.println("ss");
		String fname2=fileSaver.saver(file, filepath);
		buskingDTO.setFname(fname2);
		buskingDTO.setOname(file.getOriginalFilename());
		for(MultipartFile file2 : files){
			if(file2!=null){
				String fname=fileSaver.saver(file2, filepath);
				FileDTO fileDTO=new FileDTO();
				fileDTO.setFname(fname);
				fileDTO.setOname(file2.getOriginalFilename());
				fileDTO.setNum(buskingDTO.getNum());
				fileDTO.setLoc_name("null");
				fileDTO.setTeamName("null");
				fileDAO.insert(fileDTO);
			}
		}
		}else{
			buskingDTO.setFname("null");
			buskingDTO.setOname("null");
		}
		int result=buskingDAO.insert(buskingDTO);
		return result;
	}
	public ModelAndView selectList(ListData listData,ModelAndView mv) throws Exception{
		int totalCount=buskingDAO.getTotalCount(listData);
		PageMaker pageMaker=new PageMaker();
		pageMaker.pageMaker(totalCount, listData);
		List<FileDTO> fileAr=fileDAO.selectList();
		List<BuskingDTO> ar=buskingDAO.selectList(listData);
		mv.addObject("page", listData);
		mv.addObject("list", ar);
		mv.addObject("files", fileAr);
		return mv;
	}
	public BuskingDTO selectOne(BuskingDTO buskingDTO) throws Exception{
		return buskingDAO.selectOne(buskingDTO);
	}

	public int update(BuskingDTO buskingDTO,HttpSession session,MultipartFile [] files,MultipartFile f2) throws Exception{
		FileSaver fileSaver = new FileSaver();
		String filepath = session.getServletContext().getRealPath("resources/upload");
		File f = new File(filepath);
		if(!f.exists()){
			f.mkdir();
		}
		if(f2!=null){
			String fname2=fileSaver.saver(f2, filepath);
			buskingDTO.setFname(fname2);
			buskingDTO.setOname(f2.getOriginalFilename());
		}else{
			buskingDTO.setFname("null");
			buskingDTO.setOname("null");
		}
			for(MultipartFile file : files){
				if(file!=null){
					String fname=fileSaver.saver(file, filepath);
					FileDTO fileDTO=new FileDTO();
					fileDTO.setFname(fname);
					fileDTO.setOname(file.getOriginalFilename());
					fileDTO.setNum(buskingDTO.getNum());
					fileDTO.setLoc_name("null");
					fileDTO.setTeamName("null");
					fileDAO.insert(fileDTO);
				}
			}
		System.out.println(buskingDTO.getFname());

		return buskingDAO.update(buskingDTO);
	}

	public int delete(BuskingDTO buskingDTO,HttpSession session) throws Exception{
		List<FileDTO> ar=fileDAO.selectList();
		String filepath = session.getServletContext().getRealPath("resources/upload");
		FileSaver fileSaver=new FileSaver();
		for(FileDTO fileDTO: ar){
			if(fileDTO.getNum()==buskingDTO.getNum()){
				fileSaver.fileDelete(filepath, fileDTO.getFname());
				int t=fileDAO.Delete(fileDTO);
			}
		}

		return buskingDAO.delete(buskingDTO);
	}

	public int entryUpdate(BuskingDTO buskingDTO) throws Exception{
		return buskingDAO.entryUpdate(buskingDTO);
	}
}
