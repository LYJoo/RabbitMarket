package com.market.rabbit.profile.controller;

import java.util.HashMap;

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
	
	@RequestMapping(value = "/profile1", method = RequestMethod.GET)
	public String home(Model model) {

		
		return "myPage/memberInfo";
	}
	
	//위시리스트
	//1. 리스트불러오기
	//2. 리스트 삭제
	//3. 페이징 처리
	
	//1. 리스트 불러오기
	@RequestMapping(value = "/wishlist", method = RequestMethod.GET)
	public String wishlist(Model model) {
		logger.info("위시리스트 요청");
		service.wishlist(model);
		
		return "wishlist";
	}
	
	//2. 리스트 삭제
	@RequestMapping(value = "/wishdelete", method = RequestMethod.GET)
	public ModelAndView wishdelete(Model model, @RequestParam String wish_idx) {
		logger.info("위시리스트 삭제요청"+wish_idx);
		
		return service.wishdelete(wish_idx);
	}
	
	//3. 페이징 처리
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index() {
		
		logger.info("리스트 페이지 이동");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("wishlist");
		
		return mav;
	}
	
	//list / 보여줄갯수 / 페이지
	@RequestMapping(value = "/list/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public HashMap<String, Object> list(@PathVariable int pagePerCnt, @PathVariable int page) {
		//@PathVariable 은 요청의 특정 부분을 변수에 담는다.
		logger.info("pagePerCnt : {}, page : {}", pagePerCnt, page);
		
		return service.wishlist(page,pagePerCnt);
	}
}
