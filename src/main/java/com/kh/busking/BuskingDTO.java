package com.kh.busking;

import java.sql.Date;

public class BuskingDTO {

	private int num;
	private String teamname;
	private String writer;
	private String title;
	private String write;
	private String contents;
	private String reg_date;
	private String location;
	private int entry;
	private Date busk_date;
	private int entry_member;
	private String fname;
	private String oname;
	
	
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public int getEntry_member() {
		return entry_member;
	}
	public void setEntry_member(int entry_member) {
		this.entry_member = entry_member;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWrite() {
		return write;
	}
	public void setWrite(String write) {
		this.write = write;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getEntry() {
		return entry;
	}
	public void setEntry(int entry) {
		this.entry = entry;
	}
	public Date getBusk_date() {
		return busk_date;
	}
	public void setBusk_date(Date busk_date) {
		this.busk_date = busk_date;
	}
	
	
}
