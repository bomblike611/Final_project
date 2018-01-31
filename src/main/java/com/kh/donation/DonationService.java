package com.kh.donation;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class DonationService {

	@Inject
	private DonationDAO donationDAO;
	
	public List<SingerDTO> buskerList(){
		return donationDAO.buskerList();
	}
	
}
