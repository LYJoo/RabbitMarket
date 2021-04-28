package com.market.rabbit.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("alarm")
public class AlarmDTO {
	
	private int alarm_idx;
	private String alarm_content;
	private Date reg_date;
	private Boolean isCheck;
	private String member_id;
	private int code_num;
	public int getAlarm_idx() {
		return alarm_idx;
	}
	public void setAlarm_idx(int alarm_idx) {
		this.alarm_idx = alarm_idx;
	}
	public String getAlarm_content() {
		return alarm_content;
	}
	public void setAlarm_content(String alarm_content) {
		this.alarm_content = alarm_content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Boolean getIsCheck() {
		return isCheck;
	}
	public void setIsCheck(Boolean isCheck) {
		this.isCheck = isCheck;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getCode_num() {
		return code_num;
	}
	public void setCode_num(int code_num) {
		this.code_num = code_num;
	}
	
	
	
	
	
}
