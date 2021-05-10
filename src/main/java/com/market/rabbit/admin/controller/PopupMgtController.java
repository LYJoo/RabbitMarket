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

import com.market.rabbit.admin.service.PopupService;
import com.market.rabbit.dto.PopupDTO;

@Controller
public class PopupMgtController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired PopupService service;
	
	/* 팝업 관리 */
	//리스트
	@RequestMapping(value = "/admin/callPopupList", method = RequestMethod.GET)
	public String callPopupList(HttpSession session) {
		logger.info("팝업 관리 리스트 페이지 요청");
		return "admin/popupList";
	}
	
	@RequestMapping(value = "/admin/popupList/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> popupList(@PathVariable int pagePerCnt, @PathVariable int page) {
		logger.info("팝업 리스트 요청 pagePerCnt: {}, page: {}",pagePerCnt,page);
		return service.popupList(page,pagePerCnt);
	}
	
	//등록
	@RequestMapping(value = "/admin/writeFormPopup", method = RequestMethod.GET)
	public String writeFormPopup() {
		logger.info("팝업 등록 폼 요청");
		return "admin/popupWriteForm";
	}
	
	@RequestMapping(value = "/admin/writePopup", method = RequestMethod.POST)
	public ModelAndView writePopup(@ModelAttribute PopupDTO dto) {
		logger.info("팝업 등록 요청 : "+dto.getPopup_subject()+"/"+dto.getIslook()+"/"+dto.getAdmin_id()+"/"+dto.getPopup_content());
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/admin/writeFormPopup";//실패 : 글쓰기 폼
		if(service.writePopup(dto)>0) {//성공 : 리스트
			logger.info("등록 완료 idx : "+dto.getPopup_idx());
			page = "redirect:/admin/callPopupList";
		}
		mav.setViewName(page);
		return mav;
	}
	
	//수정
	@RequestMapping(value = "/admin/updateFormPopup/{popup_idx}", method = RequestMethod.GET)
	public ModelAndView updateFormPopup(@PathVariable int popup_idx) {
		logger.info("팝업 수정 폼 요청 idx : " +popup_idx);
		ModelAndView mav = new ModelAndView();		
		String page = "redirect:/admin/callPopupList";//실패 : 리스트
		PopupDTO dto = service.detailPopup(popup_idx);
		if(dto != null) {//성공 : 수정 폼
			page = "admin/popupUpdateForm";
			mav.addObject("dto", dto);
		}
		mav.setViewName(page);
		return mav;
	}
	
	@RequestMapping(value = "/admin/updatePopup", method = RequestMethod.POST)
	public ModelAndView updateNotice(@ModelAttribute PopupDTO dto) {
		logger.info("팝업 수정 요청 idx : " + dto.getPopup_idx());
		ModelAndView mav = new ModelAndView();		
		String page = "redirect:/admin/updateFormPopup/"+dto.getPopup_idx();//실패 : 수정 폼
		if(service.updatePopup(dto) > 0) {//성공 : 리스트 
			page = "redirect:/admin/callPopupList";
		}
		mav.setViewName(page);
		return mav;
	}
	
	//삭제
	@RequestMapping(value = "/admin/delPopup/{popup_idx}", method = RequestMethod.GET)
	public String delPopup(@PathVariable int popup_idx) {
		int success = service.delPopup(popup_idx);
		logger.info("팝업 삭제 요청 idx : "+popup_idx+"/성공여부 : "+success);
		return "redirect:/admin/callPopupList";
	}
	
	
	

}
