package com.market.rabbit.dto;

import org.apache.ibatis.type.Alias;

@Alias("comments")
public class CommentsDTO {
	private int comment_idx;
	private String comment_content;
	private String reg_date;
	private boolean isBlind;
	private boolean isDelete;
	private String member_id;
	private int product_idx;
	private int cocommentCnt;
	private MemberDTO memberDto;
	private ProfileFileDTO profileFileDto;
	
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
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public boolean isIsBlind() {
		return isBlind;
	}
	public void setIsBlind(boolean isBlind) {
		this.isBlind = isBlind;
	}
	public boolean isIsDelete() {
		return isDelete;
	}
	public void setIsDelete(boolean isDelete) {
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
	public MemberDTO getMemberDto() {
		return memberDto;
	}
	public void setMemberDto(MemberDTO memberDto) {
		this.memberDto = memberDto;
	}
	public int getCocommentCnt() {
		return cocommentCnt;
	}
	public void setCocommentCnt(int cocommentCnt) {
		this.cocommentCnt = cocommentCnt;
	}
	public ProfileFileDTO getProfileFileDto() {
		return profileFileDto;
	}
	public void setProfileFileDto(ProfileFileDTO profileFileDto) {
		this.profileFileDto = profileFileDto;
	}
	
	
}
