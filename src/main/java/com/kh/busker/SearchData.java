package com.kh.busker;

public class SearchData {
	
	private String kind;
	private String search;
	
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		if(search == null){
			search = "";
		}
		this.search = search;
	}
	
}
