package com.market.rabbit.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("alarm")
public class AlarmDTO {
	
	private Number alarm_idx;
	private String alarm_content;
	private Date reg_date;
	private Boolean ischeck;
	private String member_id;
	private Number code_num;
	
	public Number getAlarm_idx() {
		return alarm_idx;
	}
	public void setAlarm_idx(Number alarm_idx) {
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
	public Boolean getIscheck() {
		return ischeck;
	}
	public void setIscheck(Boolean ischeck) {
		this.ischeck = ischeck;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Number getCode_num() {
		return code_num;
	}
	public void setCode_num(Number code_num) {
		this.code_num = code_num;
	}
	
	
}
