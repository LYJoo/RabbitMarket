package com.market.rabbit.profile.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value = "myPage/memberWithdraw", method = RequestMethod.POST)
	public ModelAndView delMemberWithdraw(HttpSession session, @RequestParam String currPw, RedirectAttributes rAttr) {
		logger.info("마이페이지-탈퇴요청");
		return service.delMemberWithdraw(session, currPw, rAttr);
	}
	
	@RequestMapping(value = "myPage/alarmList", method = RequestMethod.GET)
	public String callMemberAlarmListForm(Model model) {
		logger.info("마이페이지-알림리스트페이지요청");
		return "myPage/memberInfo_alarm";
	}
	
	@RequestMapping(value = "myPage/alarmList/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> callMsgList(@PathVariable int page) {
		
		logger.info("Alarm {} 페이지 리스트 요청", page);
		return service.callAlarmList(page);
	}
	
	@RequestMapping(value = "myPage/delAlarm/{alarm_idx}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> delAlarm(@PathVariable int alarm_idx) {
		
		logger.info("{}번 알람 삭제 요청", alarm_idx);
		return service.delAlarm(alarm_idx);
	}
	
	@RequestMapping(value = "myPage/blockList", method = RequestMethod.GET)
	public String callBlockListForm(Model model) {
		logger.info("마이페이지-차단리스트페이지요청");
		return "myPage/memberInfo_block";
	}
	
	@RequestMapping(value = "myPage/blockList/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> callBlockList(@PathVariable int page) {
		
		logger.info("Block {} 페이지 리스트 요청", page);
		return service.callBlockList(page);
	}
	
	@RequestMapping(value = "myPage/delBlock/{block_idx}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> delBlock(@PathVariable int block_idx) {
		
		logger.info("{}번 차단 삭제 요청", block_idx);
		return service.delBlock(block_idx);
	}
	
	@RequestMapping(value = "myPage/saleReportList", method = RequestMethod.GET)
	public String callSaleReportListForm(Model model) {
		logger.info("마이페이지-판매글신고리스트페이지요청");
		return "myPage/memberInfo_reportSale";
	}
	
	@RequestMapping(value = "myPage/commentReportList", method = RequestMethod.GET)
	public String callMemberCommentReportList(Model model) {
		logger.info("마이페이지-댓글신고리스트페이지요청");
		return "myPage/memberInfo_reportComment";
	}
	
	@RequestMapping(value = "myPage/cocommentReportList", method = RequestMethod.GET)
	public String callMemberCocommentReportList(Model model) {
		logger.info("마이페이지-대댓글신고리스트페이지요청");
		return "myPage/memberInfo_reportCocomment";
	}
	
	@RequestMapping(value = "myPage/questionList", method = RequestMethod.GET)
	public String callMemberQuestionList(Model model) {
		logger.info("마이페이지-대댓글신고리스트페이지요청");
		return "myPage/memberInfo_question";
	}
	
}
