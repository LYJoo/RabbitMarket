package com.market.rabbit.profile.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.rabbit.dto.MemberDTO;
import com.market.rabbit.profile.service.ProfileService2;


@Controller
public class ProfileController2 {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ProfileService2 service;
	
	@RequestMapping(value = "myPage/memberInfo", method = RequestMethod.GET)
	public ModelAndView callMemberInfo(Model model, HttpSession session) {
		logger.info("마이페이지-회원정보요청");
		//return "myPage/memberInfo";
		
		return service.callMemberInfo(session);
	}
	
	@RequestMapping(value = "myPage/memberInfoUpdateForm", method = RequestMethod.GET)
	public ModelAndView callInfoUpdateForm(Model model, HttpSession session) {
		logger.info("마이페이지-회원수정폼요청");
		//return "myPage/memberInfo_updateForm";
		return service.callInfoUpdateForm(session);
	}
	
	@RequestMapping(value = "myPage/memberInfoUpdate", method = RequestMethod.POST)
	//public ModelAndView callInfoUpdate(@ModelAttribute MemberDTO dto, @RequestParam String oriFileName, @RequestParam String newFileName) {
	public ModelAndView updateMemberInfo(@RequestParam HashMap<String, Object> dto) {
		logger.info("마이페이지-회원수정요청");
		//return "myPage/memberInfo_updateForm";
		return service.updateMemberInfo(dto);
	}
	
	@RequestMapping(value = "myPage/profileUploadForm", method = RequestMethod.GET)
	public String profileUploadForm(Model model) {
		logger.info("마이페이지-프로필사진업로드폼요청");
		return "myPage/profileUploadForm";
	}
	
	@RequestMapping(value = "myPage/profileUpload", method = RequestMethod.POST)
	public ModelAndView profileUpload(MultipartFile profilefile) {
		logger.info("마이페이지-프로필사진업로드요청");
		logger.info("file:"+profilefile);
		return service.profileUpload(profilefile);
	}
	
	@RequestMapping(value = "myPage/memberPwUpdateForm", method = RequestMethod.GET)
	public String callPwUpdateForm(Model model) {
		logger.info("마이페이지-비밀번호변경폼요청");
		return "myPage/memberInfo_pwUpdateForm";
	}
	
	@RequestMapping(value = "myPage/memberPwUpdate", method = RequestMethod.POST)
	public ModelAndView updateMemberPw(@RequestParam String currPw, @RequestParam String afterPw, RedirectAttributes rAttr) {
		logger.info("마이페이지-비밀번호변경요청");
		return service.updateMemberPw(currPw, afterPw, rAttr);
	}
	
	@RequestMapping(value = "myPage/memberWithdrawForm", method = RequestMethod.GET)
	public String callWithdrawForm(Model model) {
		logger.info("마이페이지-탈퇴폼요청");
		return "myPage/memberInfo_withdrawForm";
	}
	
	@RequestMapping(value = "myPage/memberAlarmList", method = RequestMethod.GET)
	public String callMemberAlarmList(Model model) {
		logger.info("마이페이지-알림리스트페이지요청");
		return "myPage/memberInfo_alarm";
	}
	
	@RequestMapping(value = "myPage/memberBlockList", method = RequestMethod.GET)
	public String callMemberBlockList(Model model) {
		logger.info("마이페이지-차단리스트페이지요청");
		return "myPage/memberInfo_block";
	}
	
	@RequestMapping(value = "myPage/memberSaleReportList", method = RequestMethod.GET)
	public String callMemberSaleReportList(Model model) {
		logger.info("마이페이지-판매글신고리스트페이지요청");
		return "myPage/memberInfo_reportSale";
	}
	
	@RequestMapping(value = "myPage/memberCommentReportList", method = RequestMethod.GET)
	public String callMemberCommentReportList(Model model) {
		logger.info("마이페이지-댓글신고리스트페이지요청");
		return "myPage/memberInfo_reportComment";
	}
	
	@RequestMapping(value = "myPage/memberCocommentReportList", method = RequestMethod.GET)
	public String callMemberCocommentReportList(Model model) {
		logger.info("마이페이지-대댓글신고리스트페이지요청");
		return "myPage/memberInfo_reportCocomment";
	}
	
	@RequestMapping(value = "myPage/memberQuestionList", method = RequestMethod.GET)
	public String callMemberQuestionList(Model model) {
		logger.info("마이페이지-대댓글신고리스트페이지요청");
		return "myPage/memberInfo_question";
	}
	
}
