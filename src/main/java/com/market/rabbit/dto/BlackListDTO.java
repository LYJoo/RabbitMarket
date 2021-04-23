package com.market.rabbit.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("blackList")
public class BlackListDTO {
	
	private Number black_idx;
	private String black_reason;
	private String unblack_reason;
	private String admin_id;
	private String member_id;
	private Date unblack_date;
	private Date reg_date;
	
	public Number getBlack_idx() {
		return black_idx;
	}
	public void setBlack_idx(Number black_idx) {
		this.black_idx = black_idx;
	}
	public String getBlack_reason() {
		return black_reason;
	}
	public void setBlack_reason(String black_reason) {
		this.black_reason = black_reason;
	}
	public String getUnblack_reason() {
		return unblack_reason;
	}
	public void setUnblack_reason(String unblack_reason) {
		this.unblack_reason = unblack_reason;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Date getUnblack_date() {
		return unblack_date;
	}
	public void setUnblack_date(Date unblack_date) {
		this.unblack_date = unblack_date;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
}
