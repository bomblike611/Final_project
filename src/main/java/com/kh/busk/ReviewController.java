package com.kh.busk;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.review.ReviewDTO;
import com.kh.review.ReviewService;
import com.kh.util.ListData;

@Controller
@RequestMapping(value="/review/**")
public class ReviewController {

	@Inject
	private ReviewService reviewService;
	
	@RequestMapping(value="reviewList")
	public ModelAndView selectList(ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ReviewDTO> ar = reviewService.selectList(listData);
		for(int i=0; i<ar.size(); i++){
			String s = ar.get(i).getReg_date();
			s=s.substring(0, 10);
			ar.get(i).setReg_date(s);
		}
		mv.addObject("list", ar);
		mv.addObject("page", listData);
		mv.setViewName("review/reviewList");
		return mv;
	}
	
}
