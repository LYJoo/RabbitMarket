package com.market.rabbit.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("member")
public class MemberDTO {
	/*
	MEMBER_ID	NVARCHAR2(50 CHAR)
	PW	NVARCHAR2(50 CHAR)
	NAME	NVARCHAR2(30 CHAR)
	PHONE	NVARCHAR2(20 CHAR)
	EMAIL	NVARCHAR2(50 CHAR)
	BIRTH_DATE	DATE
	ADDRESS	NVARCHAR2(50 CHAR)
	REG_DATE	DATE
	REPORT_CNT	NUMBER(7,0)
	BLACK_CNT	NUMBER(7,0)
	BLIND_CNT	NUMBER(7,0)
	BLACK_BLIND_CNT	NUMBER(7,0)
	LOCATION	NVARCHAR2(50 CHAR)
	MANNER_PERCENT	NUMBER(3,2)
	MANNER_CNT	NUMBER(7,0)
	ISBLACK	NVARCHAR2(5 CHAR)
	WITHDRAW	NVARCHAR2(5 CHAR)*/
	
	private String member_id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private Date birth_date;
	private String address;
	private Date reg_date;
	private int report_cnt;
	private int black_cnt;
	private int blind_cnt;
	private int black_blind_cnt;
	private String location;
	private double manner_percent;
	private int manner_cnt;
	private boolean isBlack;
	private boolean withdraw;
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirth_date() {
		return birth_date;
	}
	public void setBirth_date(Date birth_date) {
		this.birth_date = birth_date;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getReport_cnt() {
		return report_cnt;
	}
	public void setReport_cnt(int report_cnt) {
		this.report_cnt = report_cnt;
	}
	public int getBlack_cnt() {
		return black_cnt;
	}
	public void setBlack_cnt(int black_cnt) {
		this.black_cnt = black_cnt;
	}
	public int getBlind_cnt() {
		return blind_cnt;
	}
	public void setBlind_cnt(int blind_cnt) {
		this.blind_cnt = blind_cnt;
	}
	public int getBlack_blind_cnt() {
		return black_blind_cnt;
	}
	public void setBlack_blind_cnt(int black_blind_cnt) {
		this.black_blind_cnt = black_blind_cnt;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public double getManner_percent() {
		return manner_percent;
	}
	public void setManner_percent(double manner_percent) {
		this.manner_percent = manner_percent;
	}
	public int getManner_cnt() {
		return manner_cnt;
	}
	public void setManner_cnt(int manner_cnt) {
		this.manner_cnt = manner_cnt;
	}
	public boolean isBlack() {
		return isBlack;
	}
	public void setBlack(boolean isBlack) {
		this.isBlack = isBlack;
	}
	public boolean isWithdraw() {
		return withdraw;
	}
	public void setWithdraw(boolean withdraw) {
		this.withdraw = withdraw;
	}
	
	
	
	

}
