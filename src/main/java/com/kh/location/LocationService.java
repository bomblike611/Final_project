package com.kh.location;

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
public class LocationService {

	@Inject
	private LocationDAO locationDAO;
	@Inject
	private FileDAO fileDAO;

	public int locationInsert(LocationDTO locationDTO,HttpSession session,MultipartFile [] file) throws Exception{
		String filepath=session.getServletContext().getRealPath("resources/upload");
		File f=new File(filepath);
		if(!f.exists()){
			f.mkdir();
		}
		FileSaver fileSaver=new FileSaver();
		for(MultipartFile files : file){
			String fname=fileSaver.saver(files, filepath);
			FileDTO fileDTO=new FileDTO();
			fileDTO.setFname(fname);
			fileDTO.setOname(files.getOriginalFilename());
			fileDTO.setLoc_name(locationDTO.getLoc_name());
			fileDTO.setNum(0);
			fileDTO.setTeamName("null");
			fileDAO.insert(fileDTO);
		}

		return locationDAO.locationInsert(locationDTO);
	}

	public int locationUpdate(LocationDTO locationDTO,HttpSession session,MultipartFile [] file) throws Exception{
		FileSaver fileSaver = new FileSaver();
		String filepath = session.getServletContext().getRealPath("resources/upload");
		File f = new File(filepath);
		if(!f.exists()){
			f.mkdir();
		}
		for(MultipartFile files : file){
			String fname=fileSaver.saver(files, filepath);
			FileDTO fileDTO=new FileDTO();
			fileDTO.setFname(fname);
			fileDTO.setOname(files.getOriginalFilename());
			fileDTO.setLoc_name(locationDTO.getLoc_name());
			fileDTO.setNum(0);
			fileDTO.setTeamName("null");
			fileDAO.insert(fileDTO);
		}
		
		
		return locationDAO.locationUpdate(locationDTO);
	}

	public int locationDelete(LocationDTO locationDTO,HttpSession session) throws Exception{
		List<FileDTO> ar=fileDAO.selectList();
		String filepath = session.getServletContext().getRealPath("resources/upload");
		FileSaver fileSaver=new FileSaver();
		for(FileDTO fileDTO: ar){
			if(fileDTO.getLoc_name().equals(locationDTO.getLoc_name())){
				fileSaver.fileDelete(filepath, fileDTO.getFname());
				int t=fileDAO.Delete(fileDTO);
			}
		}
		return locationDAO.locationDelete(locationDTO);
	}

	public ModelAndView locationList(ListData listData,ModelAndView mv) throws Exception{
		int totalCount=locationDAO.locationTotalCount(listData);
		PageMaker pageMaker=new PageMaker();
		pageMaker.pageMaker(totalCount, listData);
		List<FileDTO> fileAr=fileDAO.selectList();
		List<LocationDTO> ar=locationDAO.locationList(listData);
		mv.addObject("page", listData);
		mv.addObject("loc_list", ar);
		mv.addObject("files", fileAr);
		return mv;
	}
	public LocationDTO locationView(LocationDTO locationDTO) throws Exception{
		
		return locationDAO.locationView(locationDTO);
	}

}
