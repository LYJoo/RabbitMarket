package com.market.rabbit.dto;

import org.apache.ibatis.type.Alias;

@Alias("profileFile")
public class ProfileFileDTO {
	
	private int file_idx;
	private String orifilename;
	private String newfilename;
	private String member_id;

	public int getFile_idx() {
		return file_idx;
	}

	public void setFile_idx(int file_idx) {
		this.file_idx = file_idx;
	}

	public String getOrifilename() {
		return orifilename;
	}

	public void setOrifilename(String orifilename) {
		this.orifilename = orifilename;
	}

	public String getNewfilename() {
		return newfilename;
	}

	public void setNewfilename(String newfilename) {
		this.newfilename = newfilename;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

}
