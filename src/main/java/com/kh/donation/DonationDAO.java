package com.kh.donation;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class DonationDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "DonationMapper.";
	
	public List<SingerDTO> buskerList(){
		return sqlSession.selectList(NAMESPACE+"buskerList");
	}
	
}
