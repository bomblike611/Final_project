package com.kh.busker;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.member.MemberDTO;



@Repository
public class BuskerDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "BuskerMapper.";
	
	public List<MemberDTO> buskerList(String teamname){
		return sqlSession.selectList(NAMESPACE+"buskerList", teamname);
	}
	public List<String> getteamname() {
		return sqlSession.selectList(NAMESPACE+"getteamname");
	}
	public List<MemberDTO> singerList() {
		return sqlSession.selectList(NAMESPACE+"singerList");
	}
	public MemberDTO buskerOne(SearchData searchData) {
		return sqlSession.selectOne(NAMESPACE+"buskerOne", searchData);
	}
	
}
