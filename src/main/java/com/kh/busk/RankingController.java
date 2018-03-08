package com.kh.busk;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.member.MemberDTO;
import com.kh.ranking.RankingService;
import com.kh.spon.SponDTO;
import com.kh.util.ListData;

@Controller
@RequestMapping(value="/ranking/**")
public class RankingController {
	
	@Inject
	private RankingService rankingService;
	
	@RequestMapping(value="rankingView")
	public ModelAndView rankingView(ListData listData) {
		ModelAndView mv = new ModelAndView();
		List<MemberDTO> buskList = null;
		if(listData.getKind()==null || listData.getKind().equals("")){
			listData.setKind("mostSponMember");
		}
		if(listData.getSearch()==null || listData.getSearch().equals("")){
			listData.setSearch("");
		}
		List<SponDTO> rankList = rankingService.sponMemberRank(listData);
		if(!rankList.isEmpty()){
			if(listData.getKind().equals("mostSponMember")||listData.getKind().equals("mostPostMember")){
				System.out.println(rankList.get(0).getId());
				System.out.println(rankList.size());
				buskList = rankingService.sponMemberRank(rankList);
			}else if(listData.getKind().equals("mostSponSinger")||listData.getKind().equals("mostJoinSinger")){
				buskList = rankingService.sponMemberRank1(rankList);
			}
		}
		mv.addObject("buskList", buskList);
		mv.addObject("rankList", rankList);
		for(SponDTO test : rankList){
			System.out.println(test.getTeamName());	
		}
		if(listData.getKind().equals("mostSponMember")||listData.getKind().equals("mostPostMember")){
			mv.addObject("idorteam", "ID");
		}else if(listData.getKind().equals("mostSponSinger")||listData.getKind().equals("mostJoinSinger")){
			mv.addObject("idorteam", "팀명");
		}
		if(listData.getKind().equals("mostSponMember")||listData.getKind().equals("mostSponSinger")){
			mv.addObject("priceor", "후원금");
		}else if(listData.getKind().equals("mostPostMember")){
			mv.addObject("priceor", "게시글");
		}else {
			mv.addObject("priceor", "참여자");
		}
		mv.addObject("kindof", listData.getKind());
		return mv;
	}
	
}
