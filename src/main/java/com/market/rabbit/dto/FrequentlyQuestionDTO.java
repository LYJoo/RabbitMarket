package com.market.rabbit.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("frequentlyQuestion")
public class FrequentlyQuestionDTO {
	/*
	FREQUENTLY_IDX	NUMBER(10,0)
	FQ_QUESTION	NVARCHAR2(200 CHAR)
	FQ_ANSWER	NVARCHAR2(1500 CHAR)
	ADMIN_ID	NVARCHAR2(50 CHAR)
	REG_DATE	DATE
	 */
	
	private int frequently_idx;
	private String fq_question;
	private String fq_answer;
	private String admin_id;
	private Date reg_date;
	
	
	public int getFrequently_idx() {
		return frequently_idx;
	}
	public void setFrequently_idx(int frequently_idx) {
		this.frequently_idx = frequently_idx;
	}
	public String getFq_question() {
		return fq_question;
	}
	public void setFq_question(String fq_question) {
		this.fq_question = fq_question;
	}
	public String getFq_answer() {
		return fq_answer;
	}
	public void setFq_answer(String fq_answer) {
		this.fq_answer = fq_answer;
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
