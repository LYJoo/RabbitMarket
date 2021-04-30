package com.market.rabbit.dto;

import org.apache.ibatis.type.Alias;

@Alias("popup")
public class PopupDTO {

	private int popup_idx;
	private String popup_subject;
	private String popup_content;
	private String islook;//mybatis가 못 찾아서 isLook -> islook 으로 변경함.
	private String admin_id;
	private String reg_date;
	
	public int getPopup_idx() {
		return popup_idx;
	}
	public void setPopup_idx(int popup_idx) {
		this.popup_idx = popup_idx;
	}
	public String getPopup_subject() {
		return popup_subject;
	}
	public void setPopup_subject(String popup_subject) {
		this.popup_subject = popup_subject;
	}
	public String getPopup_content() {
		return popup_content;
	}
	public void setPopup_content(String popup_content) {
		this.popup_content = popup_content;
	}
	public String getIslook() {
		return islook;
	}
	public void setIslook(String islook) {
		this.islook = islook;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	

	

}
