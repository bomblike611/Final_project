package com.kh.busking;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.util.ListData;

@Repository
public class BuskingDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="BuskingMapper.";
	
	
	public int insert(BuskingDTO buskingDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"Insert", buskingDTO);
	}
	public List<BuskingDTO> selectList(ListData listData) throws Exception{
		return sqlSession.selectList(NAMESPACE+"Selectlist", listData);
	}
	public BuskingDTO selectOne(BuskingDTO buskingDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"SelectOne", buskingDTO);
	}
	public int update(BuskingDTO buskingDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"Update", buskingDTO);
	}
	public int getTotalCount(ListData listData) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"TotalCount", listData);
	}
	public int delete(BuskingDTO buskingDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"Delete", buskingDTO);
	}
}
