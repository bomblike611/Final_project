package com.kh.ranking;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.member.MemberDTO;
import com.kh.spon.SponDTO;
import com.kh.util.ListData;

@Service
public class RankingService {
	
	@Inject
	private RankingDAO rankingDAO;
	
	public List<SponDTO> sponMemberRank(ListData listData) {
		return rankingDAO.sponMemberRank(listData);
	}
	public List<MemberDTO> sponMemberRank(List<SponDTO> rankList) {
		return rankingDAO.sponMemberRank(rankList);
	}
	public List<MemberDTO> sponMemberRank1(List<SponDTO> rankList) {
		return rankingDAO.sponMemberRank1(rankList);
	}
	
}
