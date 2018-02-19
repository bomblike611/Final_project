package com.kh.busker;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.member.MemberDTO;
@Service
public class BuskerService {

	@Inject
	private BuskerDAO buskerDAO;
	
	public List<MemberDTO> buskerList(String teamname){
		return buskerDAO.buskerList(teamname);
	}
	
	public List<String> getteamname() {
		return buskerDAO.getteamname();
	}
	public List<MemberDTO> singerList(){
		return buskerDAO.singerList();
	}
	public MemberDTO buskerOne(SearchData searchData){
		return buskerDAO.buskerOne(searchData);
	}
}
