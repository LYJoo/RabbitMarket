package com.market.rabbit.help.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.rabbit.dto.NoticeDTO;
import com.market.rabbit.help.dao.HelpDAO;

@Service
public class HelpService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired HelpDAO dao;
	
	/*공지사항 리스트*/
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

}
