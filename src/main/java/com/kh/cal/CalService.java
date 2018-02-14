package com.kh.cal;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.util.ListData;
import com.kh.util.PageMaker;


@Service
public class CalService {
	
	@Inject
	private CalDAO calDAO;
	
	public List<CalDTO> selectList(ListData listData) throws Exception{
		
		int totalCount = calDAO.totalCount(listData);
		PageMaker pageMaker = new PageMaker();
		pageMaker.pageMaker(totalCount, listData);
		return calDAO.selectList(listData);
	}

}
