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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.rabbit.dto.NoticeDTO;
import com.market.rabbit.dto.QuestionDTO;
import com.market.rabbit.help.service.HelpService;


@Controller
public class HelpController {
	//고객센터 컨트롤러 : 일반회원 모두가 접근 가능.
	/* 본 컨트롤러 작성 시 안내 및 주의사항
	 	사용할 서비스 : HelpService
	 	관리자와 같이 사용 중인 기능 및 method명 :
	 		- 공지사항 : ~리스트 noticeList, ~상세보기 detailNotice 
	 		- 자주묻는질문 : ~리스트 faqList, ~상세보기 detailFaq
	 		- 1:1문의 : ~리스트 QList, ~상세보기 detailQ
	 		*리스트는 페이징처리가 된 값을 보내주게 처리 되어 있음.
	 		
	 	위 기능들은 서비스에서는 값만 보내 주게끔 되어 있으므로, 
	 	확인 후 고객센터에 맞는 !페이지! 분기 및 기타 작업들을 본 컨트롤러에서 해 줄 것.
	 */
	
	ModelAndView mav = new ModelAndView();
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired HelpService service;
	
	
	@RequestMapping(value = "/help/noticeMain", method = RequestMethod.GET)
	public String help_noticeMain(Model model) {
		logger.info("고객센터 요청");
		return "help/noticeMain";
	}
	@RequestMapping(value = "/help/help_QAnswer", method = RequestMethod.GET)
	public String help_QAnswer(Model model) {
		logger.info("1대1 문의글 등록 요청");
		return "help/help_QAnswer";
	}
	@RequestMapping(value = "/help/help_Question_Update", method = RequestMethod.GET)
	public String help_Question_Update(Model model) {
		logger.info("1대1 문의글 수정 요청");
		return "help/help_Question_Update";
	}

	//1:1문의하기 상세보기
		@RequestMapping(value = "/help/helpQuestionDetail/{question_idx}", method = RequestMethod.GET)
		public ModelAndView helpQuestionDetail(@PathVariable int question_idx) {
			logger.info("1:1문의하기 상세보기 요청 idx : " +question_idx);
			ModelAndView mav = new ModelAndView();
			String page = "redirect:/help/helpQuestionMain";//실패 : 리스트
			QuestionDTO dto = service.detailQ(question_idx);
			int a = Integer.parseInt(dto.getState());
			logger.info(dto.getState());
			String msg = "답변 대기중";
			if(a != 0) {
				msg ="답변완료";
			}
			if(dto != null) {//성공 : 상세보기
				page = "help/helpQuestionDetail";
				mav.addObject("dto", dto);
			}
			mav.addObject("msg", msg);
			mav.setViewName(page);
			return mav;
		}
		
		//1대1 문의 수정페이지 이동
		@RequestMapping(value = "/help/help_Question_Update/${question_idx}", method = RequestMethod.GET)
		public String help_Question_Update(Model model,@PathVariable int question_idx) {
			logger.info("1대1문의 수정 요청"+question_idx);
			QuestionDTO dto = service.detailQ(question_idx);
			model.addAttribute("dto", dto);
			return "help/help_Question_Update";
		}
		
		//1대1 문의 삭제
		@RequestMapping(value = "/help/helpQuestionDetail/help_Question_Delete/{question_idx}", method = RequestMethod.GET)
		public String helpDelete(@PathVariable int question_idx, RedirectAttributes rttr) throws Exception{
			int suc = service.helpDelete(question_idx, rttr);
			logger.info("삭제 idx : "+question_idx+"/"+suc);
			
			String msg = "삭제에 실패했습니다. 잠시 후 다시 시도해주세요";
			if(suc > 0) {
				msg ="삭제 했습니다.";
			}
			rttr.addFlashAttribute("removeOK",msg);
			return "redirect:/help/helpQuestionMain";
		}
		
		//1대1 문의글쓰기
		@RequestMapping(value = "/help/helpwrite", method = RequestMethod.POST)
		public String helpwrite(Model model, @ModelAttribute QuestionDTO dto) {
			logger.info("1대1 문의 글 등록 :"+dto.getSubject()+"/"+dto.getMember_id()+"/"+dto.getQuestion_category()+"/"+dto.getIsPw()+"/"+dto.getContent());
			int suc = service.helpwrite(dto);
			String msg ="문의글 등록에 실패했으니 다시 시도해주세요";
			String page = "redirect:/help/helpwrite";
			if(suc != 0) {
				msg ="등록 성공";
				page ="/help/helpQuestionMain";
			}
			model.addAttribute("help_write_msg", msg);
			return page;
		}
		
		//1대1 문의 페이지 요청
		@RequestMapping(value = "/help/helpQuestionMain", method = RequestMethod.GET)
		public String helpQuestionMain(Model model) {
			logger.info("1대1문의 요청");
			return "help/helpQuestionMain";
		}
		
		//1대1 문의 페이지 리스트 요청
		@RequestMapping(value = "/help/helpQuestionMain/{pagePerCnt}/{page}", method = RequestMethod.GET)
		public @ResponseBody HashMap<String, Object> helpQuestionMain(@PathVariable int pagePerCnt, @PathVariable int page) {
			logger.info("1:1문의하기 리스트 요청 pagePerCnt: {}, page: {}",pagePerCnt,page);
			return service.QList(page,pagePerCnt);
		}
		
		//공지 사항 상세보기 요청
		@RequestMapping(value = "/help/helpNoticeDetail/{notice_idx}", method = RequestMethod.GET)
		public ModelAndView help_detailNotice(@PathVariable int notice_idx) {
			logger.info("공지사항 상세보기 요청 idx : " +notice_idx);
			ModelAndView mav = new ModelAndView();
			String page = "redirect:/help/noticeMain";//실패 : 리스트
			NoticeDTO dto = service.detailNotice(notice_idx);
			if(dto != null) {//성공 : 상세보기
				page = "help/helpNoticeDetail";
				mav.addObject("dto", dto);
			}
			mav.setViewName(page);
			return mav;
		}
		
		@RequestMapping(value = "/help/noticeMain/{pagePerCnt}/{page}", method = RequestMethod.GET)
		public @ResponseBody HashMap<String, Object> noticeMain(@PathVariable int pagePerCnt, @PathVariable int page) {
			logger.info("공지사항 리스트 요청 pagePerCnt: {}, page: {}",pagePerCnt,page);
			return service.noticeList(page,pagePerCnt);
		}
		
		//자주묻는질문 
		@RequestMapping(value = "/help/helpFrequentlyMain", method = RequestMethod.GET)
		public String helpFrequentlyMain(HttpSession session) {
			logger.info("자주묻는질문 관리 리스트 페이지 요청");
			return "help/helpFrequentlyMain";
		}

		@RequestMapping(value = "/help/helpFrequentlyMain/{pagePerCnt}/{page}", method = RequestMethod.GET)
		public @ResponseBody HashMap<String, Object> helpFrequentlyMain(@PathVariable int pagePerCnt, @PathVariable int page) {
			logger.info("자주묻는질문 리스트 요청 pagePerCnt: {}, page: {}",pagePerCnt,page);
			return service.faqList(page,pagePerCnt);
		}
	
}
