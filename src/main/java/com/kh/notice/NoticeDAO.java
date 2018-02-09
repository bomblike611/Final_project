package com.kh.notice;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.iu.util.ListData;
@Repository
public class NoticeDAO{
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="noticeMapper.";
	
	
	
	
    public int noticeWrite(NoticeDTO noticeDTO) throws Exception {
	return sqlSession.insert(NAMESPACE+"insert",noticeDTO);
	}
	
	
	
}
