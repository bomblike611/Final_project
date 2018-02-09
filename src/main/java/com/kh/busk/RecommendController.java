package com.kh.busk;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.recommend.RecommendDTO;

@Controller
@RequestMapping(value="/recommend/**")
public class RecommendController {

	@RequestMapping(value="communityList", method=RequestMethod.GET)
	public void communityList(){
		
	}

	
}
