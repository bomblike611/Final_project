package com.kh.point;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
@Repository
public class PointDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="PointMapper.";
	
	public int insert(PointDTO pointDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"insert", pointDTO);
	}
	
	public int delete(PointDTO pointDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"delete", pointDTO);
	}
	
}
