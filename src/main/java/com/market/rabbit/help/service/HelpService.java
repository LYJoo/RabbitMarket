package com.market.rabbit.help.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.rabbit.dto.FrequentlyQuestionDTO;
import com.market.rabbit.dto.NoticeDTO;
import com.market.rabbit.dto.QuestionDTO;
import com.market.rabbit.help.dao.HelpDAO;

@Service
public class HelpService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	ModelAndView mav = new ModelAndView();
	@Autowired HelpDAO dao;
	
	
	/* 공지 사항 */
	//공지사항 리스트
	public HashMap<String, Object> noticeList(int page, int pagePerCnt) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//pagePerCnt 의 기준으로 몇페이지나 만들수 있는가?
		int allCnt = dao.allCountNotice();//전체 게시글 수
		//게시글 수 : 21개, 페이지당 보여줄 수 : 5 = 최대 생성 가능한 페이지 : 5
		int range = allCnt%pagePerCnt > 0? Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);
		//생성 가능한 페이지 보다 현재페이지가 클 경우... 현재페이지를 생성 가능한 페이지로 맞춰준다.
		page=page>range? range: page;
		//시작, 끝
		int end = page*pagePerCnt;
		int start = end - pagePerCnt+1;
		ArrayList<NoticeDTO> list = dao.noticeList(start,end);	

		map.put("list", list);
		map.put("range", range);
		map.put("currPage", page);
		return map;
	}
	

	
	//공지사항 상세보기
	public NoticeDTO detailNotice(int notice_idx) {
		return dao.detailNotice(notice_idx);
	}
	
	//공지사항 등록
	public int writeNotice(NoticeDTO dto) {
		return dao.writeNotice(dto);
	}
	
	//공지사항 수정
	public int updateNotice(NoticeDTO dto) {
		return dao.updateNotice(dto);
	}	
	
	//공지사항 삭제
	public int delNotice(int notice_idx) {
		return dao.delNotice(notice_idx);
	}
	
	/* 자주묻는질문 */
	//자주묻는질문 리스트
	public HashMap<String, Object> faqList(int page, int pagePerCnt) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//pagePerCnt 의 기준으로 몇페이지나 만들수 있는가?
		int allCnt = dao.allCountFaq();//전체 게시글 수
		//게시글 수 : 21개, 페이지당 보여줄 수 : 5 = 최대 생성 가능한 페이지 : 5
		int range = allCnt%pagePerCnt > 0? Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);
		//생성 가능한 페이지 보다 현재페이지가 클 경우... 현재페이지를 생성 가능한 페이지로 맞춰준다.
		page=page>range? range: page;
		//시작, 끝
		int end = page*pagePerCnt;
		int start = end - pagePerCnt+1;
		ArrayList<FrequentlyQuestionDTO> list = dao.faqList(start,end);	
		
		map.put("list", list);
		map.put("range", range);
		map.put("currPage", page);
		return map;
	}
	
	//자주묻는질문 상세보기
	public FrequentlyQuestionDTO detailFaq(int frequently_idx) {
		return dao.detailFaq(frequently_idx);
	}
	
	//자주묻는질문 등록
	public int writeFaq(FrequentlyQuestionDTO dto) {
		return dao.writeFaq(dto);
	}
	
	//자주묻는질문 수정
	public int updateFaq(FrequentlyQuestionDTO dto) {
		return dao.updateFaq(dto);
	}

	//자주묻는질문 삭제
	public int delFaq(int frequently_idx) {
		return dao.delFaq(frequently_idx);
	}
	
	/* 1:1문의하기 */
	//1:1문의하기 리스트
	public HashMap<String, Object> QList(int page, int pagePerCnt) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//pagePerCnt 의 기준으로 몇페이지나 만들수 있는가?
		int allCnt = dao.allCountQ();//전체 게시글 수
		//게시글 수 : 21개, 페이지당 보여줄 수 : 5 = 최대 생성 가능한 페이지 : 5
		int range = allCnt%pagePerCnt > 0? Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);
		//생성 가능한 페이지 보다 현재페이지가 클 경우... 현재페이지를 생성 가능한 페이지로 맞춰준다.
		page=page>range? range: page;
		//시작, 끝
		int end = page*pagePerCnt;
		int start = end - pagePerCnt+1;
		ArrayList<QuestionDTO> list = dao.QList(start,end);	

		map.put("list", list);
		map.put("range", range);
		map.put("currPage", page);
		return map;
	}
	
	//1:1문의하기 상세보기
	public QuestionDTO detailQ(int question_idx) {
		
		return dao.detailQ(question_idx);
	}
	
	//1:1문의하기 답변
	public int answerQ(QuestionDTO dto) {
		return dao.answerQ(dto);
	}



	public int helpwrite(QuestionDTO dto) {
		return dao.helpwrite(dto);
	}




	public int helpDelete(int question_idx, RedirectAttributes rttr) {
		
		return dao.helpDelete(question_idx);
	}












	
	
	
	
	
	
	
	
}
