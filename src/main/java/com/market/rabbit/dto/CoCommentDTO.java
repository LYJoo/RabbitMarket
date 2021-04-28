package com.market.rabbit.dto;

import org.apache.ibatis.type.Alias;

@Alias("coComent")
public class CoCommentDTO {
	
	private int cocomment_idx;
	private String cocomment_content;
	private String reg_date;
	private String isBlind;
	private String isDelete;
	private int comment_idx;
	private String member_id;
	
	public int getCocomment_idx() {
		return cocomment_idx;
	}
	public void setCocomment_idx(int cocomment_idx) {
		this.cocomment_idx = cocomment_idx;
	}
	public String getCocomment_content() {
		return cocomment_content;
	}
	public void setCocomment_content(String cocomment_content) {
		this.cocomment_content = cocomment_content;
	}
	
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getIsBlind() {
		return isBlind;
	}
	public void setIsBlind(String isBlind) {
		this.isBlind = isBlind;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	public int getComment_idx() {
		return comment_idx;
	}
	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	

	
	
}
