package com.market.rabbit.dto;

import org.apache.ibatis.type.Alias;

@Alias("wish")
public class WishDTO {
	
	private int wish_idx;
	private String member_id;
	private int product_idx;
	private boolean isDelete;
	
	public int getWish_idx() {
		return wish_idx;
	}
	public void setWish_idx(int wish_idx) {
		this.wish_idx = wish_idx;
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
	public boolean isDelete() {
		return isDelete;
	}
	public void setDelete(boolean isDelete) {
		this.isDelete = isDelete;
	}
	
	
}
