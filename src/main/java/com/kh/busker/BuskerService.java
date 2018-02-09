package com.kh.busker;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.spon.SingerDTO;
@Service
public class BuskerService {

	@Inject
	private BuskerDAO buskerDAO;
	
	public List<SingerDTO> buskerList(){
		return buskerDAO.buskerList();
	}
	
}
