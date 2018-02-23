package com.kh.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="MemberMapper.";
	
	public int memberJoin(MemberDTO memberDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"memberJoin", memberDTO);
	}
	
	
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberLogin", memberDTO);
	}

	
	public int memberUpdate(MemberDTO memberDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"memberUpdate", memberDTO);
	}
	
	public int APIUpdate(MemberDTO memberDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"APIUpdate", memberDTO);
	}
	
	public int memberDelete(MemberDTO memberDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"memberDelete", memberDTO);
	}
	
	public MemberDTO memberIdCheck(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberIdCheck", id);
	}
	
	//아이디 찾기
	public String memberID(String email) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberID", email);
	}
	

	//PW 찾기
	public String memberPW(String email) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberPW", email);
	}
	
	
	
	
	
	
	
	
	
	
}
