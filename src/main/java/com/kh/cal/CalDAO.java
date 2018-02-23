package com.kh.cal;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.util.ListData;

@Repository
public class CalDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="CalMapper.";
	
	public List<CalDTO> selectList(ListData listData) throws Exception{
		return sqlSession.selectList(NAMESPACE+"selectList", listData);
	}
	public int totalCount(ListData listData) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"totalCount", listData);
	}
	public CalDTO selectOne(CalDTO calDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectOne", calDTO);
	}

}
