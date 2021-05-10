package com.market.rabbit.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.market.rabbit.admin.dao.MemberMgtDAO;
import com.market.rabbit.dto.AdminDTO;
import com.market.rabbit.dto.BlackListDTO;
import com.market.rabbit.dto.MemberDTO;

@Service
public class MemberMgtService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired MemberMgtDAO dao;

	public HashMap<String, Object> memberList(int page, int pagePerCnt) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// pagePerCnt 의 기준으로 몇페이지나 만들수 있는가?
		int allCnt = dao.allCountMember();// 전체 관리자 수
		// 게시글 수 : 21개, 페이지당 보여줄 수 : 5 = 최대 생성 가능한 페이지 : 5
		int range = allCnt % pagePerCnt > 0 ? Math.round(allCnt / pagePerCnt) + 1 : Math.round(allCnt / pagePerCnt);
		// 생성 가능한 페이지 보다 현재페이지가 클 경우... 현재페이지를 생성 가능한 페이지로 맞춰준다.
		page = page > range ? range : page;
		// 시작, 끝
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;
		ArrayList<MemberDTO> list = dao.memberList(start, end);
		
		map.put("list", list);
		map.put("range", range);
		map.put("currPage", page);
		return map;
	}

	public HashMap<String, Object> blackList(int page, int pagePerCnt) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// pagePerCnt 의 기준으로 몇페이지나 만들수 있는가?
		int allCnt = dao.allCountBlack();// 전체 관리자 수
		// 게시글 수 : 21개, 페이지당 보여줄 수 : 5 = 최대 생성 가능한 페이지 : 5
		int range = allCnt % pagePerCnt > 0 ? Math.round(allCnt / pagePerCnt) + 1 : Math.round(allCnt / pagePerCnt);
		// 생성 가능한 페이지 보다 현재페이지가 클 경우... 현재페이지를 생성 가능한 페이지로 맞춰준다.
		page = page > range ? range : page;
		// 시작, 끝
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;
		ArrayList<BlackListDTO> list = dao.blackList(start, end);
		
		map.put("list", list);
		map.put("range", range);
		map.put("currPage", page);
		return map;
	}

	public HashMap<String, Object> withdrawList(int page, int pagePerCnt) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// pagePerCnt 의 기준으로 몇페이지나 만들수 있는가?
		int allCnt = dao.allCountWithdraw();// 전체 관리자 수
		// 게시글 수 : 21개, 페이지당 보여줄 수 : 5 = 최대 생성 가능한 페이지 : 5
		int range = allCnt % pagePerCnt > 0 ? Math.round(allCnt / pagePerCnt) + 1 : Math.round(allCnt / pagePerCnt);
		// 생성 가능한 페이지 보다 현재페이지가 클 경우... 현재페이지를 생성 가능한 페이지로 맞춰준다.
		page = page > range ? range : page;
		// 시작, 끝
		int end = page * pagePerCnt;
		int start = end - pagePerCnt + 1;
		ArrayList<MemberDTO> list = dao.withdrawList(start, end);

		map.put("list", list);
		map.put("range", range);
		map.put("currPage", page);
		return map;
	}

	public ModelAndView callBlackManage(String member_id, String admin_id) {
		ModelAndView mav = new ModelAndView();
		String page = "/admin/blackManageForm";
		MemberDTO member = dao.callMember(member_id);
		AdminDTO admin = dao.callAdmin(admin_id);
		mav.addObject("member", member);
		mav.addObject("admin", admin);
		mav.setViewName(page);
		return mav;
	}

	public ModelAndView callUnBlackManage(String member_id, String admin_id) {
		ModelAndView mav = new ModelAndView();
		String page = "/admin/unBlackManageForm";
		MemberDTO member = dao.callMember(member_id);
		AdminDTO admin = dao.callAdmin(admin_id);
		mav.addObject("member", member);
		mav.addObject("admin", admin);
		mav.setViewName(page);
		return mav;
	}

	public HashMap<String, Object> updateSetBlack(String member_id, String admin_id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public HashMap<String, Object> updateSetUnBlack(String member_id, String admin_id) {
		// TODO Auto-generated method stub
		return null;
	}

}
