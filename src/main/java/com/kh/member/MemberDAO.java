package com.kh.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.singer.SingerDTO;

@Repository
public class MemberDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="MemberMapper.";
	
	public int memberJoin(MemberDTO memberDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"memberJoin", memberDTO);
	}
	
	public int singerJoin(SingerDTO singerDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"singerJoin", singerDTO);
	}
	
	
}
