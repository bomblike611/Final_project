package com.kh.cal;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.file.FileDAO;
import com.kh.file.FileDTO;
import com.kh.util.ListData;
import com.kh.util.PageMaker;


@Service
public class CalService {
	
	@Inject
	private CalDAO calDAO;
	@Inject
	private FileDAO fileDAO;
	
	public ModelAndView selectList(ListData listData, ModelAndView mv) throws Exception{
		if(listData.getSearch() == null || listData.getKind() == null || listData.getFromDate() == null || listData.getToDate() == null){	
			listData.setSearch("");	
			listData.setKind("");
			listData.setFromDate("");
			listData.setToDate("");
		}
		int totalCount = calDAO.totalCount(listData);
		PageMaker pageMaker = new PageMaker();
		pageMaker.pageMaker(totalCount, listData);
		List<CalDTO> ar = calDAO.selectList(listData);
		List<FileDTO> file = fileDAO.selectList();
		mv.addObject("list", ar);
		mv.addObject("file", file);
		mv.addObject("page", listData);		
		return mv;
	}
	public CalDTO selectOne(CalDTO calDTO) throws Exception{
		return calDAO.selectOne(calDTO);
	}

}
