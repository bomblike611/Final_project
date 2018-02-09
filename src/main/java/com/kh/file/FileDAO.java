package com.kh.file;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="FileMapper.";
	
	
	public int insert(FileDTO fileDTO)throws Exception{
		System.out.println(fileDTO.getFname());
		System.out.println(fileDTO.getLoc_name());
		System.out.println(fileDTO.getNum());
		System.out.println(fileDTO.getOname());
		System.out.println(fileDTO.getTeamName());
		System.out.println(sqlSession);
		return sqlSession.insert(NAMESPACE+"insert", fileDTO);
	}
	
	

}
