package com.kh.spon;

public class SponDTO {

	private String id;
	private String teamName;
	private String price;
	private String message;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		if(message==null){
			message="응원합니다!";
		}
		this.message = message;
	}
	
}
