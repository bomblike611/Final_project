package com.kh.singer;

import com.kh.member.MemberDTO;

public class SingerDTO extends MemberDTO{

	private String teamName;
	private String position;
	private String profile;
	private String sns;
	private String state;
	
	
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getSns() {
		return sns;
	}
	public void setSns(String sns) {
		this.sns = sns;
	}
	public String getState() {
		return state;
	}
	public void setState(String stae) {
		this.state = stae;
	}
	
	
	
	
	
	
}
