package com.kh.location;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class LocationService {

	public int locationInsert(LocationDTO locationDTO,HttpSession session,MultipartFile [] file) throws Exception{
		return 0;
	}
	
	public int locationUpdate(LocationDTO locationDTO,HttpSession session,MultipartFile [] file) throws Exception{
		return 0;
	}
	
	public int locationDelete(LocationDTO locationDTO) throws Exception{
		return 0;
	}
	
}
