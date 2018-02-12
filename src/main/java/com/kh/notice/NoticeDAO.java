package com.kh.notice;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.kh.util.ListData;
@Repository
public class NoticeDAO{
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="noticeMapper.";
	
	public NoticeDAO(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	public List<NoticeDTO> selectList(ListData listData) throws Exception{
		return sqlSession.selectList(NAMESPACE+"selectList", listData);
	}
	
    public int noticeWrite(NoticeDTO noticeDTO) throws Exception {
	return sqlSession.insert(NAMESPACE+"insert",noticeDTO);
	}
	
	
	
}
