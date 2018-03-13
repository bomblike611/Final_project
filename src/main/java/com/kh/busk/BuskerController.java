package com.kh.busk;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.busker.BuskerService;
import com.kh.member.MemberDTO;
import com.kh.util.ListData;
@Controller
@RequestMapping(value="/busker/**")
public class BuskerController {

	@Inject
	private BuskerService buskerService;
	
	@RequestMapping(value="buskerList", method=RequestMethod.GET)
	public ModelAndView buskerList(){
		List<MemberDTO> buskerList = null;
		ModelAndView mv = new ModelAndView();
		List<String> getteamname = buskerService.getteamname();
		Map<String, Object> member = new HashMap<String, Object>();
		for(int i=0;i<getteamname.size();i++){
			buskerList = buskerService.buskerList(getteamname.get(i));
			ArrayList<String> member2 = new ArrayList<String>();
			for(int z =0;z<buskerList.size();z++){
				member2.add(buskerList.get(z).getName());
			}
			member.put(getteamname.get(i), member2);
		}
		List<MemberDTO> singerList = buskerService.singerList();
		mv.addObject("teamname",getteamname);
		mv.addObject("m", member);
		mv.addObject("list", singerList);
		mv.addObject("search", "");
		return mv;
	}
	@RequestMapping(value="buskerList", method=RequestMethod.POST)
	public ModelAndView buskerList(ListData listData){
		ModelAndView mv = new ModelAndView();
		List<MemberDTO> buskerList =buskerService.buskerOne(listData);
		mv.addObject("search", buskerList);
		mv.setViewName("busker/buskerAjax");
		return mv;
	}
	@RequestMapping(value="buskerView", method=RequestMethod.GET)
	public ModelAndView buskerView(String teamname){
		ModelAndView mv = new ModelAndView();
		List<MemberDTO> buskerList = buskerService.buskerList(teamname);
		mv.addObject("team", buskerList);
		System.out.println(buskerList.size());
		return mv;
	}
	@RequestMapping(value="buskerView", method=RequestMethod.POST)
	public ModelAndView buskerAjax(String id){
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = buskerService.memberView(id);
		mv.addObject("dto", memberDTO);
		mv.setViewName("busker/viewAjax");
		return mv;
	}
	
}
