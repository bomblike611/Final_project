package com.kh.cal;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.kh.location.LocationDAO;
import com.kh.location.LocationDTO;
import com.kh.util.ListData;

@Repository
public class CalDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="CalMapper.";
	@Inject
	private LocationDAO locationDAO;

	public List<CalDTO> selectList(ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<LocationDTO> lar = locationDAO.locationList(listData);
		lar.get(0);
		mv.addObject("loca", lar);
		return sqlSession.selectList(NAMESPACE+"selectList", listData);
	}
	public CalDTO selectOne(CalDTO calDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectOne", calDTO);
	}
	public List<CalDTO> upcoming() throws Exception{
		return sqlSession.selectList(NAMESPACE+"upcoming");
	}
	public List<CalDTO> month() throws Exception{
		return sqlSession.selectList(NAMESPACE+"month");
	}
	public int totalCount(ListData listData) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"totalCount", listData);
	}


}
