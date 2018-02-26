package com.kh.entry;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class EntryDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="EntryMapper.";
	
	public int insert(EntryDTO entryDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"insert", entryDTO);
	}
	public int delete(EntryDTO entryDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"delete", entryDTO);
	}
}
