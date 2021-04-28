package com.market.rabbit.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("question")
public class QuestionDTO {

	private int question_idx;
	private String subject;
	private String content;
	private Date reg_date;
	private String state;
	private String answer;
	private Date answer_date;
	private String admin_id;
	private String member_id;
	private boolean isDelete;
	private boolean isPw;
	private int question_category;
	public int getQuestion_idx() {
		return question_idx;
	}
	public void setQuestion_idx(int question_idx) {
		this.question_idx = question_idx;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Date getAnswer_date() {
		return answer_date;
	}
	public void setAnswer_date(Date answer_date) {
		this.answer_date = answer_date;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public boolean isDelete() {
		return isDelete;
	}
	public void setDelete(boolean isDelete) {
		this.isDelete = isDelete;
	}
	public boolean isPw() {
		return isPw;
	}
	public void setPw(boolean isPw) {
		this.isPw = isPw;
	}
	public int getQuestion_category() {
		return question_category;
	}
	public void setQuestion_category(int question_category) {
		this.question_category = question_category;
	}
	
	


}
