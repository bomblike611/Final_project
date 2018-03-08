package com.kh.review;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.kh.util.ListData;

@Repository
public class ReviewDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="ReviewMapper.";
	
	public ReviewDAO(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	public int totalCount(ListData listData) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"totalCount", listData);
	}
	
	public List<ReviewDTO> selectList(ListData listData) throws Exception{
		return sqlSession.selectList(NAMESPACE+"selectList", listData);
	}
}
