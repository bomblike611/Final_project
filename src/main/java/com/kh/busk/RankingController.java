package com.kh.busk;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/ranking/**")
public class RankingController {
	
	@RequestMapping(value="rankingView")
	public void rankingView() {
		
	}
	
}
