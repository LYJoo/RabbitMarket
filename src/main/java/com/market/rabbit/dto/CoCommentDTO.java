package com.market.rabbit.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("coComent")
public class CoCommentDTO {
	
	private Number cocomment_idx;
	private String comment_content;
	private Date reg_date;
	private boolean isblind;
	private boolean isdelete;
	private Number comment_idx;
	private String member_id;
	
	public Number getCocomment_idx() {
		return cocomment_idx;
	}
	public void setCocomment_idx(Number cocomment_idx) {
		this.cocomment_idx = cocomment_idx;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public boolean isIsblind() {
		return isblind;
	}
	public void setIsblind(boolean isblind) {
		this.isblind = isblind;
	}
	public boolean isIsdelete() {
		return isdelete;
	}
	public void setIsdelete(boolean isdelete) {
		this.isdelete = isdelete;
	}
	public Number getComment_idx() {
		return comment_idx;
	}
	public void setComment_idx(Number comment_idx) {
		this.comment_idx = comment_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	

	
}
