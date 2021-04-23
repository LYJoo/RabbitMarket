package com.market.rabbit.dto;

import org.apache.ibatis.type.Alias;

@Alias("keyword")
public class KeywordDTO {
	/*
	KEYWORD_IDX	NUMBER(10,0)
	MEMBER_ID	NVARCHAR2(50 CHAR)
	KEYWORD	NVARCHAR2(50 CHAR)*/
	
	private int keyword_idx;
	private String member_id;
	private String keyword;
	
	public int getKeyword_idx() {
		return keyword_idx;
	}
	public void setKeyword_idx(int keyword_idx) {
		this.keyword_idx = keyword_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	

}
