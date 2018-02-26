package com.kh.spon;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.point.PointDTO;

@Repository
public class SponDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "SponMapper.";
	
	public int spon(SponDTO sponDTO) {
		return sqlSession.insert(NAMESPACE+"spon", sponDTO);
	}
	public int spon(PointDTO pointDTO) {
		return sqlSession.insert(NAMESPACE+"point", pointDTO);
	}
	
}
