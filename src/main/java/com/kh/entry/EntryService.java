package com.kh.entry;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class EntryService {
	@Inject
	private EntryDAO entryDAO;
	
	public int insert(EntryDTO entryDTO)throws Exception{
		return entryDAO.insert(entryDTO);
	}
	public int delete(EntryDTO entryDTO)throws Exception{
		return entryDAO.delete(entryDTO);
	}
	public List<EntryDTO> selectList(EntryDTO entryDTO) throws Exception{
		return entryDAO.selectList(entryDTO);
	}
}
