package com.kh.notice;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.util.ListData;
import com.kh.util.PageMaker;

@Service
public class NoticeService {

	@Inject
	private NoticeDAO noticeDAO; 
	
	public int noticeWrite(NoticeDTO noticeDTO) throws Exception{
		
		return noticeDAO.noticeWrite(noticeDTO);
	}

		public List<NoticeDTO> selectList(ListData listData) throws Exception {
			int totalCount = noticeDAO.totalCount(listData);
			PageMaker pageMaker = new PageMaker();
			pageMaker.pageMaker(totalCount, listData);
			return noticeDAO.selectList(listData);
		}

		public int update(NoticeDTO noticeDTO) throws Exception {
			return noticeDAO.update(noticeDTO);
		}
		
		
		 
}
