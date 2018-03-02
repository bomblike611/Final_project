package com.kh.cal;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.file.FileDAO;
import com.kh.file.FileDTO;
import com.kh.location.LocationDAO;
import com.kh.location.LocationDTO;
import com.kh.util.ListData;
import com.kh.util.PageMaker;


@Service
public class CalService {
	
	@Inject
	private CalDAO calDAO;
	@Inject
	private FileDAO fileDAO;
	@Inject
	private LocationDAO locationDAO;
	
	public List<CalDTO> selectre(ListData listData) throws Exception{
		return calDAO.selectre(listData);
	}
	
	public ModelAndView selectList(ListData listData, ModelAndView mv) throws Exception{
	
		if(listData.getKind()==null){			
			listData.setKind("");		
		}
		if(listData.getFromDate()==null){
			listData.setFromDate("");		
		}
		if(listData.getToDate()==null){
			listData.setToDate("");
		}
		if(listData.getSearch()==null){
			listData.setSearch("");
		}

		/*int totalCount = calDAO.totalCount(listData);
		PageMaker pageMaker = new PageMaker();
		pageMaker.pageMaker(totalCount, listData);*/
		
		List<CalDTO> ar = calDAO.selectList(listData);
		List<FileDTO> file = fileDAO.selectList();
		mv.addObject("list", ar);
		mv.addObject("file", file);
		/*mv.addObject("page", listData);	*/	
		return mv;
	}
	public CalDTO selectOne(CalDTO calDTO) throws Exception{
		return calDAO.selectOne(calDTO);
	}
}
