package com.kh.cal;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.file.FileDAO;
import com.kh.file.FileDTO;
import com.kh.location.LocationDTO;
import com.kh.location.LocationService;
import com.kh.util.ListData;
import com.kh.util.PageMaker;


@Service
public class CalService {

	@Inject
	private CalDAO calDAO;
	@Inject
	private FileDAO fileDAO;
	@Inject
	private LocationService locationService;

	public List<CalDTO> month() throws Exception{
		return calDAO.month();
	}

	public List<CalDTO> upcoming() throws Exception{
		return calDAO.upcoming();
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

		int totalCount = calDAO.totalCount(listData);
		PageMaker pageMaker = new PageMaker();
		pageMaker.pageMaker(totalCount, listData);

		List<CalDTO> ar = calDAO.selectList(listData);
		List<FileDTO> file = fileDAO.selectList();
		
		locationService.locationList(listData, mv)   ar.get(0)
		mv.addObject("list", ar);
		mv.addObject("file", file);
		mv.addObject("page", listData);
		return mv;
	}

	public CalDTO selectOne(CalDTO calDTO) throws Exception{
		return calDAO.selectOne(calDTO);
	}
}
