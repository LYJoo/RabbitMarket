package com.market.rabbit.dto;

import org.apache.ibatis.type.Alias;

@Alias("mannerQuestion")
public class MannerQuestionDTO {
	
	/*
	MANNER_IDX	NUMBER(10,0)
	MANNER_CONTENT	NVARCHAR2(200 CHAR)
	TARGET	NVARCHAR2(20 CHAR)
	TRADE_TYPE	NVARCHAR2(20 CHAR)
	 */
	
	private int manner_idx;
	private String manner_content;
	private String target;
	private String trade_type;
	private int look_order;
	
	
	public int getLook_order() {
		return look_order;
	}
	public void setLook_order(int look_order) {
		this.look_order = look_order;
	}
	public int getManner_idx() {
		return manner_idx;
	}
	public void setManner_idx(int manner_idx) {
		this.manner_idx = manner_idx;
	}
	public String getManner_content() {
		return manner_content;
	}
	public void setManner_content(String manner_content) {
		this.manner_content = manner_content;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getTrade_type() {
		return trade_type;
	}
	public void setTrade_type(String trade_type) {
		this.trade_type = trade_type;
	}
	
	

}
