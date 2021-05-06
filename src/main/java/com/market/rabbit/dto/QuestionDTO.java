package com.market.rabbit.dto;

import org.apache.ibatis.type.Alias;

@Alias("question")
public class QuestionDTO {

	private int question_idx;
	private String subject;
	private String content;
	private String reg_date;
	private String state;
	private String answer;
	private String answer_date;
	private String admin_id;
	private String member_id;
	private String isDelete;
	private String isPw;
	
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	public String getIsPw() {
		return isPw;
	}
	public void setIsPw(String isPw) {
		this.isPw = isPw;
	}
	private int question_category;//카테고리번호-fk
	private String q_category_name;//카테고리이름
	
	public String getQ_category_name() {
		return q_category_name;
	}
	public void setQ_category_name(String q_category_name) {
		this.q_category_name = q_category_name;
	}
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
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
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
	public String getAnswer_date() {
		return answer_date;
	}
	public void setAnswer_date(String answer_date) {
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

	public int getQuestion_category() {
		return question_category;
	}
	public void setQuestion_category(int question_category) {
		this.question_category = question_category;
	}
	
	


}
