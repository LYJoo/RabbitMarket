package com.market.rabbit.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("message")
public class MessageDTO {

	private int msg_idx;
	private String send_id;
	private String msg_content;
	private Date send_time;
	private boolean read_boolean;
	private String member_id;
	private boolean receiver_delete;
	private boolean sender_delete;

	public int getMsg_idx() {
		return msg_idx;
	}

	public void setMsg_idx(int msg_idx) {
		this.msg_idx = msg_idx;
	}

	public String getSend_id() {
		return send_id;
	}

	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}

	public String getMsg_content() {
		return msg_content;
	}

	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}

	public Date getSend_time() {
		return send_time;
	}

	public void setSend_time(Date send_time) {
		this.send_time = send_time;
	}

	public boolean isRead_boolean() {
		return read_boolean;
	}

	public void setRead_boolean(boolean read_boolean) {
		this.read_boolean = read_boolean;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public boolean isReceiver_delete() {
		return receiver_delete;
	}

	public void setReceiver_delete(boolean receiver_delete) {
		this.receiver_delete = receiver_delete;
	}

	public boolean isSender_delete() {
		return sender_delete;
	}

	public void setSender_delete(boolean sender_delete) {
		this.sender_delete = sender_delete;
	}

}
