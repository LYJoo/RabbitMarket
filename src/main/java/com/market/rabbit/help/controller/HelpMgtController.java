package com.market.rabbit.help.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.market.rabbit.dto.FrequentlyQuestionDTO;
import com.market.rabbit.dto.NoticeDTO;
import com.market.rabbit.dto.QuestionDTO;
import com.market.rabbit.help.service.HelpService;


@Controller
public class HelpMgtController {
	//고객센터 관리 컨트롤러 : 관리자 아이디를 가지고 있는 사람만 접근할 것.
	//각 리스트 부분에 임의로 adminId가 세션에 들어가게 되어 있음. 로그인 체크시 반드시 제거 할 것.
	
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
	
	//자주묻는질문 리스트
	@RequestMapping(value = "/admin/callFaqList", method = RequestMethod.GET)
	public String callFaqList(HttpSession session) {
		logger.info("자주묻는질문 관리 리스트 페이지 요청");
		session.setAttribute("adminId", "admin");//로그인체크 시 지울 부분
		return "admin/faqList";
	}
	
	@RequestMapping(value = "/admin/faqList/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> faqList(@PathVariable int pagePerCnt, @PathVariable int page) {
		logger.info("자주묻는질문 리스트 요청 pagePerCnt: {}, page: {}",pagePerCnt,page);
		return service.faqList(page,pagePerCnt);
	}
	
	//자주묻는질문 상세보기
	@RequestMapping(value = "/admin/detailFaq/{frequently_idx}", method = RequestMethod.GET)
	public ModelAndView detailFaq(@PathVariable int frequently_idx) {
		logger.info("자주묻는질문 상세보기 요청 idx : " +frequently_idx);
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/admin/callFaqList";//실패 : 리스트
		FrequentlyQuestionDTO dto = service.detailFaq(frequently_idx);
		if(dto != null) {//성공 : 상세보기
			page = "admin/faqDetail";
			mav.addObject("dto", dto);
		}
		mav.setViewName(page);
		return mav;
	}
	
	//자주묻는질문 등록
	@RequestMapping(value = "/admin/writeFormFaq", method = RequestMethod.GET)
	public String writeFormFaq() {
		logger.info("자주묻는질문 등록 폼 요청");
		return "admin/faqWriteForm";
	}
	
	@RequestMapping(value = "/admin/writeFaq", method = RequestMethod.POST)
	public ModelAndView writeFaq(@ModelAttribute FrequentlyQuestionDTO dto) {
		logger.info("공지사항 등록 요청 : "+dto.getFq_question()+"/"+dto.getAdmin_id()+"/"+dto.getFq_answer());
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/admin/writeFormFaq";//실패 : 글쓰기 폼
		if(service.writeFaq(dto)>0) {//성공 : 상세보기
			logger.info("등록 완료 idx : "+dto.getFrequently_idx());
			page = "redirect:/admin/detailFaq/"+dto.getFrequently_idx();
		}
		mav.setViewName(page);
		return mav;
	}
	
	//자주묻는질문 수정
	@RequestMapping(value = "/admin/updateFormFaq/{frequently_idx}", method = RequestMethod.GET)
	public ModelAndView updateFormFaq(@PathVariable int frequently_idx) {
		logger.info("공지사항 수정 폼 요청 idx : " +frequently_idx);
		ModelAndView mav = new ModelAndView();		
		String page = "redirect:/admin/detailFaq/"+frequently_idx;//실패 : 상세보기
		FrequentlyQuestionDTO dto = service.detailFaq(frequently_idx);
		if(dto != null) {//성공 : 수정 폼
			page = "admin/faqUpdateForm";
			mav.addObject("dto", dto);
		}
		mav.setViewName(page);
		return mav;
	}
	
	@RequestMapping(value = "/admin/updateFaq", method = RequestMethod.POST)
	public ModelAndView updateFaq(@ModelAttribute FrequentlyQuestionDTO dto) {
		logger.info("공지사항 수정 요청 idx : " + dto.getFrequently_idx());
		ModelAndView mav = new ModelAndView();		
		String page = "redirect:/admin/updateFormFaq/"+dto.getFrequently_idx();//실패 : 수정 폼
		if(service.updateFaq(dto) > 0) {//성공 : 상세보기 
			page = "redirect:/admin/detailFaq/"+dto.getFrequently_idx();
		}
		mav.setViewName(page);
		return mav;
	}
	
	//자주묻는질문 삭제
	@RequestMapping(value = "/admin/delFaq/{frequently_idx}", method = RequestMethod.GET)
	public String delFaq(@PathVariable int frequently_idx) {
		int success = service.delFaq(frequently_idx);
		logger.info("공지사항 삭제 요청 idx : "+frequently_idx+"/성공여부 : "+success);
		return "redirect:/admin/callFaqList";
	}
	
	/* 1:1문의하기 */
	
	//1:1문의하기 리스트
	@RequestMapping(value = "/admin/callQList", method = RequestMethod.GET)
	public String callQList(HttpSession session) {
		logger.info("1:1문의하기 관리 리스트 페이지 요청");
		session.setAttribute("adminId", "admin");//로그인체크 시 지울 부분
		return "admin/QList";
	}
	
	@RequestMapping(value = "/admin/QList/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> QList(@PathVariable int pagePerCnt, @PathVariable int page) {
		logger.info("1:1문의하기 리스트 요청 pagePerCnt: {}, page: {}",pagePerCnt,page);
		return service.QList(page,pagePerCnt);
	}
	
	//1:1문의하기 상세보기
	@RequestMapping(value = "/admin/detailQ/{question_idx}", method = RequestMethod.GET)
	public ModelAndView detailQ(@PathVariable int question_idx) {
		logger.info("1:1문의하기 상세보기 요청 idx : " +question_idx);
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/admin/callQList";//실패 : 리스트
		QuestionDTO dto = service.detailQ(question_idx);
		if(dto != null) {//성공 : 상세보기
			page = "admin/QDetail";
			mav.addObject("dto", dto);
		}
		mav.setViewName(page);
		return mav;
	}
	
	//1:1문의하기 답변하기
	@RequestMapping(value = "/admin/anwerQFrom/{question_idx}", method = RequestMethod.GET)
	public ModelAndView anwerQFrom(@PathVariable int question_idx) {
		logger.info("1:1문의하기 답변 폼 요청 idx : " +question_idx);
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/admin/callQList";//실패 : 리스트
		QuestionDTO dto = service.detailQ(question_idx);
		if(dto != null) {//성공 : 답변 폼
			page = "admin/QAnswer";
			mav.addObject("dto", dto);
		}
		mav.setViewName(page);
		return mav;
	}
	
	@RequestMapping(value = "/admin/anwerQ", method = RequestMethod.POST)
	public ModelAndView anwerQ(@ModelAttribute QuestionDTO dto) {
		logger.info("1:1문의하기 답변 하기 idx : " +dto.getQuestion_idx());
		ModelAndView mav = new ModelAndView();
		Date now = new Date();//답변시간 삽입
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		dto.setAnswer_date(transFormat.format(now));
		String page = "redirect:/admin/anwerQFrom/"+dto.getQuestion_idx();//실패 : 답변 폼
		if(service.answerQ(dto) > 0) {//성공 : 상세보기
			page = "redirect:/admin/detailQ/"+dto.getQuestion_idx();
		}
		mav.setViewName(page);
		return mav;
	}
	
	
	
}
