package com.market.rabbit.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("comments")
public class CommentsDTO {
	/*COMMENT_IDX	NUMBER(10,0)
	COMMENT_CONTENT	NVARCHAR2(100 CHAR)
	REG_DATE	DATE
	ISBLIND	NVARCHAR2(5 CHAR)
	ISDELETE	NVARCHAR2(5 CHAR)
	MEMBER_ID	NVARCHAR2(50 CHAR)
	PRODUCT_IDX	NUMBER(10,0)*/
	
	private int comment_idx;
	private String comment_content;
	private Date reg_date;
	private boolean isBlind;
	private boolean isDelete;
	private String member_id;
	private int product_idx;
	public int getComment_idx() {
		return comment_idx;
	}
	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
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
	public boolean isBlind() {
		return isBlind;
	}
	public void setBlind(boolean isBlind) {
		this.isBlind = isBlind;
	}
	public boolean isDelete() {
		return isDelete;
	}
	public void setDelete(boolean isDelete) {
		this.isDelete = isDelete;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	
	
	
	
	
	

}
