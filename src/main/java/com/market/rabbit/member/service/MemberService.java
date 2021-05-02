package com.market.rabbit.member.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.rabbit.dto.MemberDTO;
import com.market.rabbit.member.dao.MemberDAO;


@Service
public class MemberService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberDAO dao;
	ModelAndView mav = new ModelAndView();
	String page = "";
	String msg = "";
	
	public int join(MemberDTO dto) {
		
		return dao.join(dto);
	}


	public HashMap<String, Object> overlay(String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int use = dao.overlay(id);
		map.put("use",use);
		return map;
	}

	public HashMap<String, Object> emoverlay(String email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int use2 = dao.emoverlay(email);
		map.put("use2",use2);
		return map;
	}

	public ModelAndView login(HashMap<String, Object> params, RedirectAttributes rAttr, HttpSession session) {
		logger.info("로그인 서비스 요청");
	
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("login_id", params.get("LoginId"));
		map.put("pw", params.get("LoginPw"));
		logger.info("map"+map);
		
		//일반인 모드로 오면 
		if(params.get("mode").equals("member")) {
			logger.info("일반인 모드");
			
			//id를 비교해서
			if(dao.login(map) > 0 ) {
				page="sale/mainPage";
				
				session.setAttribute("loginId", params.get("LoginId"));
				logger.info("로그인 성공");
			}else {
				page="redirect:/member/memberLogin";
				msg = "아이디와 패스워드를 확인해 주세요.";
			}
		}else {
			if(dao.admin(map) > 0) {
				logger.info("관리자 모드");
				page ="sale/mainPage";
				
				session.setAttribute("adminId", params.get("LoginId"));
			}else {
				page="redirect:/member/memberLogin";
				msg = "관리자 아이디와 패스워드를 다시 확인해주세요";
			}
		}
		
		rAttr.addFlashAttribute("login_msg", msg);		
		mav.setViewName(page);	
		return mav;
	}


	public ModelAndView findId(String name, String email) {
		// TODO Auto-generated method stub
		return null;
	}






	
}
