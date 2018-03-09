package com.kh.busk;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.recommend.RecommendDTO;
import com.kh.recommend.RecommendService;
import com.kh.util.ListData;

@Controller
@RequestMapping(value="/recommend/**")
public class RecommendController {
	
	@Inject
	RecommendService recommendService;

	@RequestMapping(value="buskerRecommend", method=RequestMethod.GET)
	public void communityList(ListData listData){
		ModelAndView mv = new ModelAndView();
		List<RecommendDTO> recommendList =recommendService.recommendList(listData);
		mv.addObject("list", recommendList);
	}
	@RequestMapping(value="recommendWrite", method=RequestMethod.GET)
	public void recommendWrite(){}
	
	@RequestMapping(value="recommendWrite", method=RequestMethod.POST)
	public void recommendWrite(RecommendDTO recommendDTO){
		
	}

	
}
