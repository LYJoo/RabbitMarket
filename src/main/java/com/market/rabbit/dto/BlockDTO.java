package com.market.rabbit.dto;

import org.apache.ibatis.type.Alias;

@Alias("block")
public class BlockDTO {
	
	private int block_idx;
	private String target_id;
	private String member_id;
	
	public int getBlock_idx() {
		return block_idx;
	}
	public void setBlock_idx(int block_idx) {
		this.block_idx = block_idx;
	}
	public String getTarget_id() {
		return target_id;
	}
	public void setTarget_id(String target_id) {
		this.target_id = target_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
	
	
}
