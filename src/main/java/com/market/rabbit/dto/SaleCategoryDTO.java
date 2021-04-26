package com.market.rabbit.dto;

import org.apache.ibatis.type.Alias;

@Alias("saleCategory")
public class SaleCategoryDTO {
	
	private int s_category_idx;
	private String s_category_name;
	
	public int getS_category_idx() {
		return s_category_idx;
	}
	public void setS_category_idx(int s_category_idx) {
		this.s_category_idx = s_category_idx;
	}
	public String getS_category_name() {
		return s_category_name;
	}
	public void setS_category_name(String s_category_name) {
		this.s_category_name = s_category_name;
	}
}
