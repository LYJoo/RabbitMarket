package com.market.rabbit.profile.service;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.market.rabbit.dto.MemberDTO;
import com.market.rabbit.dto.ProfileFileDTO;
import com.market.rabbit.profile.dao.ProfileDAO2;

@Service
public class ProfileService2 {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ProfileDAO2 dao;

	@Transactional
	public ModelAndView callMemberInfo(HttpSession session) {
		logger.info("회원정보 서비스 요청");
		ModelAndView mav = new ModelAndView();
		String page = "myPage/memberInfo";
		//String loginId = (String) session.getAttribute("loginId");
		String loginId = "hwi";
		
		MemberDTO dto = dao.callMemberInfo(loginId);
		ProfileFileDTO profileDto = dao.callMemberProfile(loginId);
		logger.info("profile : "+profileDto.getOrifilename());
		
		mav.addObject("dto", dto);
		mav.addObject("profileDto", profileDto);
		mav.setViewName(page);
		return mav;
	}
	
}
