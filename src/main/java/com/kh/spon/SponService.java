package com.kh.spon;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.point.PointDTO;

@Service
public class SponService {

	@Inject
	private SponDAO sponDAO;
	
	public int spon(SponDTO sponDTO) {
		return sponDAO.spon(sponDTO);
	}
	public int spon(PointDTO pointDTO) {
		return sponDAO.spon(pointDTO);
	}
	
	public List<SponDTO> sponList(SponDTO sponDTO) throws Exception{
		return sponDAO.sponList(sponDTO);
	}
}
