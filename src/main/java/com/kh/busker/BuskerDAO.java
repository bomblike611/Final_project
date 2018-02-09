package com.kh.busker;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spon.SingerDTO;

@Repository
public class BuskerDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "BuskerMapper.";
	
	public List<SingerDTO> buskerList(){
		return sqlSession.selectList(NAMESPACE+"buskerList");
	}
	
}
