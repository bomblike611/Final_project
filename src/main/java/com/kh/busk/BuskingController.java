package com.kh.busk;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.busking.BuskingService;

@RequestMapping(value="/busking/**")
@Controller
public class BuskingController {
	
	@Inject
	private BuskingService buskingService;

	@RequestMapping(value="buskView")
	public void buskView() throws Exception{
		
	}
	
	@RequestMapping(value="buskWrite")
	public void buskWrite() throws Exception{
		
	}
	
	@RequestMapping(value="buskUpdate")
	public void buskUpdate() throws Exception{
		
	}
	
	@RequestMapping(value="buskList")
	public void buskList() throws Exception{
		
	}
	
}
