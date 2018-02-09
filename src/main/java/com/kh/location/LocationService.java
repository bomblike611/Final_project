package com.kh.location;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.file.FileDAO;
import com.kh.file.FileDTO;
import com.kh.util.FileSaver;

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
		return 0;
	}
	
	public int locationDelete(LocationDTO locationDTO) throws Exception{
		return 0;
	}
	
	public List<LocationDTO> locationList() throws Exception{
		int totalCount=locationDAO.locationTotalCount();
		=locationDAO.locationList();
		return null;
	}
	
}
