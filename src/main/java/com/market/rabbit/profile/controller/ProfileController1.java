package com.market.rabbit.profile.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.market.rabbit.profile.service.ProfileService1;


@Controller
public class ProfileController1 {
		
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ProfileService1 service;
	
	//위시리스트
	//1. 리스트 불러오기
	@RequestMapping(value = "myPage/wishlist", method = RequestMethod.GET)
	public String wishlist(Model model) {
		logger.info("위시리스트 요청");
		service.wishlist(model);
		
		return "myPage/wishlist";
	}
//	@RequestMapping(value = "myPage/wishlist", method = RequestMethod.GET)
//	public ModelAndView wishlist(Model model, HttpSession session) {
//		logger.info("위시리스트 요청 : "+session);
//		
//		
//		return service.wishlist(session);
//	}
	
	//2. 리스트 삭제
	@RequestMapping(value = "myPage/wishdelete", method = RequestMethod.GET)
	public ModelAndView wishdelete(Model model, @RequestParam String wish_idx) {
		logger.info("위시리스트 삭제요청"+wish_idx);
		
		return service.wishdelete(wish_idx);
	}
	
	//3. 페이징 처리
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index() {
		
		logger.info("리스트 페이지 이동");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPage/wishlist");
		
		return mav;
	}
	
	//list / 보여줄갯수 / 페이지
	@RequestMapping(value = "myPage/wishlist/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public HashMap<String, Object> list(@PathVariable int pagePerCnt, @PathVariable int page) {
		//@PathVariable 은 요청의 특정 부분을 변수에 담는다.
		logger.info("pagePerCnt : {}, page : {}", pagePerCnt, page);
		
		return service.wishlist(page,pagePerCnt);
	}

	
	//프로필불러오기(프로필사진, id, 주소, 차단여부, 매너지수)
	@RequestMapping(value = "myPage/profile", method = RequestMethod.GET)
	public ModelAndView profile(Model model, HttpSession session) {
//		String id = (String) session.getAttribute("loginId");
//		logger.info("로그인아이디"+loginId);
		logger.info("프로필 요청 : "+session);
		
		return service.profile(session);
	}
	
	//프로필 - 해당사용자가 판매중인 판매게시글 불러오기
	
	//프로필 - 해당 사용자에 대한 후기 불러오기
	@RequestMapping(value = "myPage/review", method = RequestMethod.GET)
	public String review(Model model) {
		logger.info("후기 요청");
		service.review(model);
		
		return "myPage/wishlist";
	}
	
}
