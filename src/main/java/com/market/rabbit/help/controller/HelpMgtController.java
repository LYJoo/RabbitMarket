package com.market.rabbit.help.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.market.rabbit.dto.NoticeDTO;
import com.market.rabbit.help.service.HelpService;


@Controller
public class HelpMgtController {
	//고객센터 관리 컨트롤러 : 관리자 아이디를 가지고 있는 사람만 접근할 것.
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired HelpService service;
	
	/* 공지 사항 */
	
	//공지사항 리스트
	@RequestMapping(value = "/admin/callNoticeList", method = RequestMethod.GET)
	public String callNoticeList(HttpSession session) {
		logger.info("공지사항 관리 리스트 페이지 요청");
		session.setAttribute("adminId", "admin");//로그인체크 시 지울 부분
		return "admin/noticeList";
	}
	
	@RequestMapping(value = "/admin/noticeList/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> noticeList(@PathVariable int pagePerCnt, @PathVariable int page) {
		logger.info("공지사항 리스트 요청 pagePerCnt: {}, page: {}",pagePerCnt,page);
		return service.noticeList(page,pagePerCnt);
	}
	
	//공비사항 상세보기
	@RequestMapping(value = "/admin/detailNotice/{notice_idx}", method = RequestMethod.GET)
	public ModelAndView detailNotice(@PathVariable int notice_idx) {
		logger.info("공지사항 상세보기 요청 idx : " +notice_idx);
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/admin/callNoticeList";//실패 : 리스트
		NoticeDTO dto = service.detailNotice(notice_idx);
		if(dto != null) {//성공 : 상세보기
			page = "admin/noticeDetail";
			mav.addObject("dto", dto);
		}
		mav.setViewName(page);
		return mav;
	}
	
	//공지사항 등록
	@RequestMapping(value = "/admin/writeFormNotice", method = RequestMethod.GET)
	public String writeFormNotice() {
		logger.info("공지사항 등록 폼 요청");
		return "admin/noticeWriteForm";
	}
	
	@RequestMapping(value = "/admin/writeNotice", method = RequestMethod.POST)
	public ModelAndView writeNotice(@ModelAttribute NoticeDTO dto) {
		logger.info("공지사항 등록 요청 : "+dto.getSubject()+"/"+dto.getAdmin_id()+"/"+dto.getContent());
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/admin/writeFormNotice";//실패 : 글쓰기 폼
		if(service.writeNotice(dto)>0) {//성공 : 상세보기
			logger.info("등록 완료 idx : "+dto.getNotice_idx());
			page = "redirect:/admin/detailNotice/"+dto.getNotice_idx();
		}
		mav.setViewName(page);
		return mav;
	}
	
	//공지사항 수정
	@RequestMapping(value = "/admin/updateFormNotice/{notice_idx}", method = RequestMethod.GET)
	public ModelAndView updateFormNotice(@PathVariable int notice_idx) {
		logger.info("공지사항 수정 폼 요청 idx : " +notice_idx);
		ModelAndView mav = new ModelAndView();		
		String page = "redirect:/admin/detailNotice/"+notice_idx;//실패 : 상세보기
		NoticeDTO dto = service.detailNotice(notice_idx);
		if(dto != null) {//성공 : 수정 폼
			page = "admin/noticeUpdateForm";
			mav.addObject("dto", dto);
		}
		mav.setViewName(page);
		return mav;
	}
	
	@RequestMapping(value = "/admin/updateNotice", method = RequestMethod.POST)
	public ModelAndView updateNotice(@ModelAttribute NoticeDTO dto) {
		logger.info("공지사항 수정 요청 idx : " + dto.getNotice_idx());
		ModelAndView mav = new ModelAndView();		
		String page = "redirect:/admin/updateFormNotice/"+dto.getNotice_idx();//실패 : 수정 폼
		if(service.updateNotice(dto) > 0) {//성공 : 상세보기 
			page = "redirect:/admin/detailNotice/"+dto.getNotice_idx();
		}
		mav.setViewName(page);
		return mav;
	}
	
	//공지사항 삭제
	@RequestMapping(value = "/admin/delNotice/{notice_idx}", method = RequestMethod.GET)
	public String delNotice(@PathVariable int notice_idx) {
		int success = service.delNotice(notice_idx);
		logger.info("공지사항 삭제 요청 idx : "+notice_idx+"/성공여부 : "+success);
		return "redirect:/admin/callNoticeList";
	}
	
	
	/* 자주묻는질문 */
	
	
	
}
