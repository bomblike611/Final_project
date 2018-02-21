package com.kh.member;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.util.ListData;


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
		System.out.println(memberDTO.getFname());
		return sqlSession.update(NAMESPACE+"memberUpdate", memberDTO);
	}
	
	public int memberDelete(MemberDTO memberDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"memberDelete", memberDTO);
	}
	public MemberDTO memberView(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberView", id);
	}
	
	public List<MemberDTO> memberList(ListData listData)throws Exception{
		return sqlSession.selectList(NAMESPACE+"memberList", listData);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
