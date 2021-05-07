package com.market.rabbit.dto;

import org.apache.ibatis.type.Alias;

@Alias("review")
public class ReviewDTO {
	private int review_idx;//후기번호 -pk
	private String review_content;//내용
	private String reg_date;//작성일
	private String write_id;//작성자
	private String member_id;//회원id:판매자 -fk
	
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getWrite_id() {
		return write_id;
	}
	public void setWrite_id(String write_id) {
		this.write_id = write_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	
	
	
}
