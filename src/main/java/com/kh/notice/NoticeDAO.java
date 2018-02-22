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
	
	public int totalCount(ListData listData) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"totalCount", listData);
	}
	
	public List<NoticeDTO> selectList(ListData listData) throws Exception{
		return sqlSession.selectList(NAMESPACE+"selectList", listData);
	}
	
	public NoticeDTO selectOne(int num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"selectOne",num);
	}
	
	public int update(NoticeDTO noticeDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"update",noticeDTO);
	}
	
	public int delete(int num) throws Exception {
		return sqlSession.insert(NAMESPACE+"delete",num);
	}
	
    public int noticeWrite(NoticeDTO noticeDTO) throws Exception {
	return sqlSession.insert(NAMESPACE+"insert",noticeDTO);
	}
	
	
	
}
