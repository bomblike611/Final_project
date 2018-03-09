package com.kh.recommend;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.util.ListData;

@Service
public class RecommendService {

	@Inject
	RecommendDAO recommendDAO;
	
	public List<RecommendDTO> recommendList(ListData listData) {
		return recommendDAO.recommendList(listData);
	}
	
}
