package com.market.rabbit.admin.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.market.rabbit.admin.service.AdminMgtService;
import com.market.rabbit.dto.AdminDTO;
import com.market.rabbit.dto.PopupDTO;

@Controller
public class AdminMgtController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminMgtService service;
	
	/* 관리자 관리 */
	//리스트
	@RequestMapping(value = "/admin/callAdminList", method = RequestMethod.GET)
	public String callAdminList(HttpSession session) {
		logger.info("관리자 관리 리스트 페이지 요청");
		session.setAttribute("adminId", "admin");//로그인체크 시 지울 부분
		return "admin/adminList";
	}
	
	@RequestMapping(value = "/admin/adminList/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> adminList(@PathVariable int pagePerCnt, @PathVariable int page) {
		logger.info("관리자 리스트 요청 pagePerCnt: {}, page: {}",pagePerCnt,page);
		return service.adminList(page,pagePerCnt);
	}
	
	//등록
	@RequestMapping(value = "/admin/joinFormAdmin", method = RequestMethod.GET)
	public String joinFormAdmin() {
		logger.info("관리자 등록 폼 요청");
		return "admin/adminJoinForm";
	}
	
	@RequestMapping(value = "/admin/joinAdmin", method = RequestMethod.POST)
	public ModelAndView joinAdmin(@ModelAttribute AdminDTO dto) {
		logger.info("관리자 등록 요청 : "+dto.getAdmin_id()+"/"+dto.getAdmin_pw());
		ModelAndView mav = new ModelAndView();
		String page = "admin/adminJoinForm";//실패 : join 폼
		String msg = service.joinAdmin(dto);
		if(msg.equals("")) {//성공 : 리스트
			page = "redirect:/admin/callAdminList";
		}
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav;
	}
	
	//수정
	@RequestMapping(value = "/admin/updateFormAdmin/{admin_id}", method = RequestMethod.GET)
	public ModelAndView updateFormAdmin(@PathVariable String admin_id) {
		logger.info("관리자 수정 폼 요청 id : " + admin_id);
		ModelAndView mav = new ModelAndView();		
		String page = "redirect:/admin/callAdminList";//실패 : 리스트
		AdminDTO dto = service.detailAdmin(admin_id);
		if(dto != null) {//성공 : 수정 폼
			page = "admin/adminUpdateForm";
			mav.addObject("dto", dto);
		}
		mav.setViewName(page);
		return mav;
	}
	
	@RequestMapping(value = "/admin/updateAdmin", method = RequestMethod.POST)
	public ModelAndView updateAdmin(@ModelAttribute AdminDTO dto) {
		logger.info("관리자 수정 요청 id : " + dto.getAdmin_id());
		ModelAndView mav = new ModelAndView();		
		String page = "redirect:/admin/updateFormAdmin/"+dto.getAdmin_id();//실패 : 수정 폼
		if(service.updateAdmin(dto) > 0) {//성공 : 리스트 
			page = "redirect:/admin/callAdminList";
		}
		mav.setViewName(page);
		return mav;
	}
	
	//삭제
	@RequestMapping(value = "/admin/delAdmin/{admin_id}", method = RequestMethod.GET)
	public String delAdmin(@PathVariable String admin_id) {
		int success = service.delAdmin(admin_id);
		logger.info("팝업 삭제 요청 idx : "+admin_id+"/성공여부 : "+success);
		return "redirect:/admin/callAdminList";
	}
	
	
	

}
