package com.kh.review;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.util.ListData;
import com.kh.util.PageMaker;


@Service
public class ReviewService {

	@Inject
	private ReviewDAO reviewDAO;
	
	public List<ReviewDTO> selectList(ListData listData) throws Exception{
		int totalCount = reviewDAO.totalCount(listData);
		PageMaker pageMaker = new PageMaker();
		pageMaker.pageMaker(totalCount, listData);
		return reviewDAO.selectList(listData);
	}
	
}
