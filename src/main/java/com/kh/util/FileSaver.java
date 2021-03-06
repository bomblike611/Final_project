package com.kh.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileSaver {
	
	public String saver(MultipartFile file, String filepath)throws Exception{
		//1. 저장할 파일명 생성
		//iu.jpg
		String fileName= file.getOriginalFilename();
		fileName=fileName.substring(fileName.lastIndexOf("."));
		fileName=UUID.randomUUID().toString()+fileName;
		//fileName=UUID.randomUUID().toString()+"_"+fileName;
		File f = new File(filepath, fileName);
		//FileCopyUtils.copy(file.getBytes(), f);
		file.transferTo(f);
		return fileName;
	}
	

	public List<String> saver(MultipartFile [] file, String filepath)throws Exception{
	      List<String> fileNames = new ArrayList<String>();
	      for(MultipartFile f: file){
	         String fileName=this.saver(f, filepath);
	         fileNames.add(fileName);
	      }
	      return fileNames;
	   }

	public void fileDelete(String filepath,String fileName) throws Exception{
		try{
		File file=new File(filepath, fileName);
		file.delete();
		}catch (Exception e) {
			// TODO: handle exception
		}


	}
}
