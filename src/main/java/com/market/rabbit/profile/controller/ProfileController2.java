package com.market.rabbit.profile.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ProfileController2 {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@RequestMapping(value = "/memberInfo", method = RequestMethod.GET)
	public String callMemberInfo(Model model) {
		logger.info("마이페이지-회원정보요청");
		return "myPage/memberInfo";
	}
	
	@RequestMapping(value = "/memberInfoUpdateForm", method = RequestMethod.GET)
	public String callInfoUpdateForm(Model model) {
		logger.info("마이페이지-회원수정폼요청");
		return "myPage/memberInfo_updateForm";
	}
	
	@RequestMapping(value = "/memberPwUpdateForm", method = RequestMethod.GET)
	public String callPwUpdateForm(Model model) {
		logger.info("마이페이지-비밀번호변경폼요청");
		return "myPage/memberInfo_pwUpdateForm";
	}
	
	@RequestMapping(value = "/memberWithdrawForm", method = RequestMethod.GET)
	public String callWithdrawForm(Model model) {
		logger.info("마이페이지-탈퇴폼요청");
		return "myPage/memberInfo_withdrawForm";
	}
	
	@RequestMapping(value = "/memberAlarmList", method = RequestMethod.GET)
	public String callMemberAlarmList(Model model) {
		logger.info("마이페이지-알림리스트페이지요청");
		return "myPage/memberInfo_alarm";
	}
	
	@RequestMapping(value = "/memberBlockList", method = RequestMethod.GET)
	public String callMemberBlockList(Model model) {
		logger.info("마이페이지-차단리스트페이지요청");
		return "myPage/memberInfo_block";
	}
	
	@RequestMapping(value = "/memberSaleReportList", method = RequestMethod.GET)
	public String callMemberSaleReportList(Model model) {
		logger.info("마이페이지-판매글신고리스트페이지요청");
		return "myPage/memberInfo_reportSale";
	}
	
	@RequestMapping(value = "/memberCommentReportList", method = RequestMethod.GET)
	public String callMemberCommentReportList(Model model) {
		logger.info("마이페이지-댓글신고리스트페이지요청");
		return "myPage/memberInfo_reportComment";
	}
	
	@RequestMapping(value = "/memberCocommentReportList", method = RequestMethod.GET)
	public String callMemberCocommentReportList(Model model) {
		logger.info("마이페이지-대댓글신고리스트페이지요청");
		return "myPage/memberInfo_reportCocomment";
	}
	
	@RequestMapping(value = "/memberQuestionList", method = RequestMethod.GET)
	public String callMemberQuestionList(Model model) {
		logger.info("마이페이지-대댓글신고리스트페이지요청");
		return "myPage/memberInfo_question";
	}
	
}
