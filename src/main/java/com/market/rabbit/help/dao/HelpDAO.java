package com.market.rabbit.help.dao;

import java.util.ArrayList;

import com.market.rabbit.dto.FrequentlyQuestionDTO;
import com.market.rabbit.dto.NoticeDTO;

public interface HelpDAO {
	
	/*공지사항*/
	int allCountNotice();

	ArrayList<NoticeDTO> noticeList(int start, int end);

	int writeNotice(NoticeDTO dto);

	NoticeDTO detailNotice(int notice_idx);

	int updateNotice(NoticeDTO dto);

	int delNotice(int notice_idx);
	
	/*자주묻는질문*/
	int allCountFaq();

	ArrayList<FrequentlyQuestionDTO> faqList(int start, int end);

	FrequentlyQuestionDTO detailFaq(int frequently_idx);

	int writeFaq(FrequentlyQuestionDTO dto);

	int updateFaq(FrequentlyQuestionDTO dto);

	int delFaq(int frequently_idx);
	
	

}
