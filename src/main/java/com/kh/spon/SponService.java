package com.kh.spon;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class SponService {

	@Inject
	private SponDAO sponDAO;
	
	public int spon(SponDTO sponDTO) {
		return sponDAO.spon(sponDTO);
	}
	
}
