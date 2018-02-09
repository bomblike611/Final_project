package com.kh.spon;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class SponDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "SponMapper.";
	
	public int spon(SponDTO sponDTO) {
		return sqlSession.insert(NAMESPACE+"spon", sponDTO);
	}
	
}
