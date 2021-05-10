package com.market.rabbit.admin.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.market.rabbit.admin.service.MemberMgtService;

@Controller
public class MemberMgtController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	MemberMgtService service;

	/* 회원 관리 */
	@RequestMapping(value = "/admin/callMemberList", method = RequestMethod.GET)
	public String callMemberList(HttpSession session) {
		logger.info("회원 관리 리스트 페이지 요청");
		return "admin/memberList";
	}

	@RequestMapping(value = "/admin/memberList/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> memberList(@PathVariable int pagePerCnt, @PathVariable int page) {
		logger.info("회원 리스트 요청 pagePerCnt: {}, page: {}", pagePerCnt, page);
		return service.memberList(page, pagePerCnt);
	}

	/* 블랙리스트 */
	@RequestMapping(value = "/admin/callBlackList", method = RequestMethod.GET)
	public String callBlackList(HttpSession session) {
		logger.info("블랙리스트 페이지 요청");
		return "admin/blackList";
	}

	@RequestMapping(value = "/admin/blackList/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> blackList(@PathVariable int pagePerCnt, @PathVariable int page) {
		logger.info("블랙리스트 목록 요청 pagePerCnt: {}, page: {}", pagePerCnt, page);
		return service.blackList(page, pagePerCnt);
	}

	@RequestMapping(value = "/admin/blackManageForm/{member_id}/{admin_id}", method = RequestMethod.GET)
	public ModelAndView callBlackManage(@PathVariable String member_id, @PathVariable String admin_id) {
		logger.info("관리자 / {} 회원 블랙리스트 등록 페이지 불러오기", member_id);
		return service.callBlackManage(member_id, admin_id);
	}

	@RequestMapping(value = "/admin/updateSetBlack/{member_id}/{admin_id}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> updateSetBlack(@PathVariable String member_id,
			@PathVariable String admin_id) {
		logger.info("관리자 / {} 회원 블랙리스트 등록 처리", member_id);
		return service.updateSetBlack(member_id, admin_id);
	}

	@RequestMapping(value = "/admin/unBlackManageForm/{member_id}/{admin_id}", method = RequestMethod.GET)
	public ModelAndView callUnBlackManage(@PathVariable String member_id, @PathVariable String admin_id) {
		logger.info("관리자 / {} 회원 블랙리스트 해제 페이지 불러오기", member_id);
		return service.callUnBlackManage(member_id, admin_id);
	}

	@RequestMapping(value = "/admin/updateSetUnBlack/{member_id}/{admin_id}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> updateSetUnBlack(@PathVariable String member_id,
			@PathVariable String admin_id) {
		logger.info("관리자 / {} 회원 블랙리스트 해제 처리", member_id);
		return service.updateSetUnBlack(member_id, admin_id);
	}

	/* 탈퇴 회원 */
	@RequestMapping(value = "/admin/callWithdrawList", method = RequestMethod.GET)
	public String callWithdrawList(HttpSession session) {
		logger.info("탈퇴회원 관리 리스트 페이지 요청");
		return "admin/withdrawList";
	}

	@RequestMapping(value = "/admin/withdrawList/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> withdrawList(@PathVariable int pagePerCnt, @PathVariable int page) {
		logger.info("탈퇴회원 리스트 요청 pagePerCnt: {}, page: {}", pagePerCnt, page);
		return service.withdrawList(page, pagePerCnt);
	}
}
