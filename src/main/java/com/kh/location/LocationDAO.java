package com.kh.location;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.util.ListData;

@Repository
public class LocationDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="LocationMapper.";


	public int locationInsert(LocationDTO locationDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"insert", locationDTO);	
	}
	
	public int locationUpdate(LocationDTO locationDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"update", locationDTO);
	}
	
	public int locationDelete(LocationDTO locationDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"delete", locationDTO);
	}
	
	public List<LocationDTO> locationList(ListData listData) throws Exception{
		return sqlSession.selectList(NAMESPACE+"selectList");
	}
	
	public int locationTotalCount(ListData listData) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"totalCount");
	}

}
