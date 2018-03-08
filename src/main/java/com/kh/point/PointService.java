package com.kh.point;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
@Service
public class PointService {
	
	@Inject
	private PointDAO pointDAO;
	
	public int insert(PointDTO pointDTO) throws Exception{
		return pointDAO.insert(pointDTO);
	}
	public int delete(PointDTO pointDTO) throws Exception{
		return pointDAO.delete(pointDTO);
	}


	public List<PointDTO> selectList(PointDTO pointDTO) throws Exception{
		return pointDAO.pointlist(pointDTO);

	}
}
