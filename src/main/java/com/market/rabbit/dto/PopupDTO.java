package com.market.rabbit.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("popup")
public class PopupDTO {

	private int popup_idx;
	private String popup_subject;
	private String popup_content;
	private boolean isLook;
	private String admin_id;
	private Date reg_date;
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
	public boolean isLook() {
		return isLook;
	}
	public void setLook(boolean isLook) {
		this.isLook = isLook;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	

}
