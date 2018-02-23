package com.kh.ranking;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.member.MemberDTO;
import com.kh.spon.SponDTO;
import com.kh.util.ListData;

@Repository
public class RankingDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "RankingMapper.";

	public List<SponDTO> sponMemberRank(ListData listData) {
		return sqlSession.selectList(NAMESPACE+"sponMemberRank", listData);
	}
	public List<MemberDTO> sponMemberRank(List<SponDTO> rankList) {
		return sqlSession.selectList(NAMESPACE+"sponMemberRank2", rankList);
	}
	public List<MemberDTO> sponMemberRank1(List<SponDTO> rankList) {
		return sqlSession.selectList(NAMESPACE+"sponMemberRank3", rankList);
	}
	
}
