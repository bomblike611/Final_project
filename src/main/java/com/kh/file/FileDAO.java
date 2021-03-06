package com.kh.file;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="FileMapper.";
	
	
	public int insert(FileDTO fileDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"insert", fileDTO);
	}
	
	public List<FileDTO> selectList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"selectList");
	}
	
	public List<FileDTO> selectList(int num) throws Exception{
		return sqlSession.selectList(NAMESPACE+"selectList1",num);
	}
	
	public int Delete(FileDTO fileDTO) throws Exception{
		System.out.println(fileDTO.getFname());
		return sqlSession.delete(NAMESPACE+"delete", fileDTO);
	}
	public int Delete1(FileDTO fileDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"delete1", fileDTO);
	}

}
