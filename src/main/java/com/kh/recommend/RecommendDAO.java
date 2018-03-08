package com.kh.recommend;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.util.ListData;

@Repository
public class RecommendDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "RecommendMapper.";

	public List<RecommendDTO> recommendList(ListData listData) {
		return sqlSession.selectList(NAMESPACE+"recommendList", listData);
	}

}
