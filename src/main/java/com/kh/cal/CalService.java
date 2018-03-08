package com.kh.cal;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.file.FileDAO;
import com.kh.file.FileDTO;
import com.kh.location.LocationDAO;
import com.kh.util.ListData;


@Service
public class CalService {
	
	@Inject
	private CalDAO calDAO;
	@Inject
	private FileDAO fileDAO;
	@Inject
	private LocationDAO locationDAO;

	public List<CalDTO> dd() throws Exception{
		return calDAO.dd();
	}
	
	public List<CalDTO> selectre(ListData listData) throws Exception{
		return calDAO.selectre(listData);
	}
	
	public ModelAndView selectList(CalDTO calDTO,ListData listData, ModelAndView mv) throws Exception{
	
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
		CalDTO calDTO2 = calDAO.selectOne(calDTO);
		mv.addObject("lis", calDTO2);
		mv.addObject("list", ar);
		mv.addObject("file", file);
		/*mv.addObject("page", listData);	*/	
		return mv;
	}
	public CalDTO selectOne(CalDTO calDTO) throws Exception{
		return calDAO.selectOne(calDTO);
	}
}
