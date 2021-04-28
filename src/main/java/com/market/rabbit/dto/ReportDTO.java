package com.market.rabbit.dto;

import org.apache.ibatis.type.Alias;

@Alias("report")
public class ReportDTO {
	private int report_idx;//신고idx-pk
	private String reporter;//신고자id
	private String target;//피신고자
	private String report_reason;//사유
	private String reg_date;//신고날짜
	private String report_state;//처리상태
	private String complete_date;//처리날짜
	private int target_idx;//피신고자idx
	//
	private int code_num;//코드번호 : 신고분류 -fk
	private String code_content; //코드 내용
	//
	
	public int getReport_idx() {
		return report_idx;
	}
	public void setReport_idx(int report_idx) {
		this.report_idx = report_idx;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getReport_reason() {
		return report_reason;
	}
	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getReport_state() {
		return report_state;
	}
	public void setReport_state(String report_state) {
		this.report_state = report_state;
	}
	public String getComplete_date() {
		return complete_date;
	}
	public void setComplete_date(String complete_date) {
		this.complete_date = complete_date;
	}
	public int getTarget_idx() {
		return target_idx;
	}
	public void setTarget_idx(int target_idx) {
		this.target_idx = target_idx;
	}
	public int getCode_num() {
		return code_num;
	}
	public void setCode_num(int code_num) {
		this.code_num = code_num;
	}
	public String getCode_content() {
		return code_content;
	}
	public void setCode_content(String code_content) {
		this.code_content = code_content;
	}
	
	
}
