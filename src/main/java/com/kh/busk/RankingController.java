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
		System.out.println(listData.getKind());
		System.out.println(listData.getSearch());
		if(listData.getKind()==null || listData.getKind().equals("")){
			listData.setKind("다후원회원");
		}
		if(listData.getSearch()==null){
			listData.setSearch("");
		}
		System.out.println(listData.getKind());
		System.out.println(listData.getSearch());
		List<SponDTO> rankList = rankingService.sponMemberRank(listData);
		if(!rankList.isEmpty()){
			if(listData.getKind().equals("다후원회원")||listData.getKind().equals("다게시회원")){
				buskList = rankingService.sponMemberRank(rankList);
			}else if(listData.getKind().equals("다후원가수")||listData.getKind().equals("다참여가수")){
				buskList = rankingService.sponMemberRank1(rankList);
			}
		}
		mv.addObject("buskList", buskList);
		mv.addObject("rankList", rankList);
		if(listData.getKind().equals("다후원회원")||listData.getKind().equals("다게시회원")){
			mv.addObject("idorteam", "ID");
		}else if(listData.getKind().equals("다후원가수")||listData.getKind().equals("다참여가수")){
			mv.addObject("idorteam", "팀명");
		}
		if(listData.getKind().equals("다후원회원")||listData.getKind().equals("다후원가수")){
			mv.addObject("priceor", "후원금");
		}else if(listData.getKind().equals("다게시회원")){
			mv.addObject("priceor", "게시글");
		}else {
			mv.addObject("priceor", "참여자");
		}
		mv.addObject("kindof", listData.getKind());
		return mv;
	}
	
}
