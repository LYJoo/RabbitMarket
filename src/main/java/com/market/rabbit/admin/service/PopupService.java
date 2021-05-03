package com.market.rabbit.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	@Transactional
	public int updatePopup(PopupDTO dto) {
		if(dto.getIslook().equals("1")) {//노출여부가 true라면
			int nowPopup_idx = dao.findNowPopup();//현재 노출되고 있는 팝업창
			int chage = dao.chageNowPopup(nowPopup_idx);//해당 팝업창의 노출을 false로
			logger.info("현재 노출 팝업 / 변경여부 : " + nowPopup_idx + "/" + chage);
		}		
		int success = dao.updatePopup(dto);
		return success;
	}	
	
	// 삭제
	public int delPopup(int popup_idx) {
		return dao.delPopup(popup_idx);
	}
	
	
	

}
