package com.market.rabbit.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.rabbit.admin.dao.PopupDAO;
import com.market.rabbit.dto.NoticeDTO;
import com.market.rabbit.dto.PopupDTO;

@Service
public class PopupService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired PopupDAO dao;
	
	//리스트
	public HashMap<String, Object> popupList(int page, int pagePerCnt) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//pagePerCnt 의 기준으로 몇페이지나 만들수 있는가?
		int allCnt = dao.allCountPopup();//전체 게시글 수
		//게시글 수 : 21개, 페이지당 보여줄 수 : 5 = 최대 생성 가능한 페이지 : 5
		int range = allCnt%pagePerCnt > 0? Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);
		//생성 가능한 페이지 보다 현재페이지가 클 경우... 현재페이지를 생성 가능한 페이지로 맞춰준다.
		page=page>range? range: page;
		//시작, 끝
		int end = page*pagePerCnt;
		int start = end - pagePerCnt+1;
		ArrayList<NoticeDTO> list = dao.popupList(start,end);	

		map.put("list", list);
		map.put("range", range);
		map.put("currPage", page);
		return map;
	}
	
	// 상세보기
	public PopupDTO detailPopup(int popup_idx) {
		return dao.detailPopup(popup_idx);
	}
	
	// 등록
	public int writePopup(PopupDTO dto) {
		return dao.writePopup(dto);
	}
	
	// 수정
	public int updatePopup(PopupDTO dto) {
		return dao.updatePopup(dto);
	}	
	
	// 삭제
	public int delPopup(int popup_idx) {
		return dao.delPopup(popup_idx);
	}
	
	
	

}
