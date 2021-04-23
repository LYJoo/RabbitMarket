package com.market.rabbit.profile.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	//2. 리스트 업데이트(삭제)
	//3. 
	
	//1. 리스트 불러오기
	@RequestMapping(value = "/wishlist", method = RequestMethod.GET)
	public String wishlist(Model model) {
		logger.info("위시리스트 페이지");
		service.wishlist(model);
		
		return "wishlist";
	}
	
	//2. 리스트 업데이트(삭제)
	@RequestMapping(value = "/wishUpdate", method = RequestMethod.GET)
	public String wishUpdate(Model model) {

		
		return "myPage/wishlist";
	}
}
