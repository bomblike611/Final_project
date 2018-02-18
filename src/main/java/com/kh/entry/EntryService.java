package com.kh.entry;

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
}
