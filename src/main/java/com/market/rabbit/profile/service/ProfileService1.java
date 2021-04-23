package com.market.rabbit.profile.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.market.rabbit.dto.WishDTO;
import com.market.rabbit.profile.dao.ProfileDAO1;

@Service
public class ProfileService1 {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ProfileDAO1 dao;

	public void wishlist(Model model) {
		logger.info("위시리스트 보이기 처리");
		ArrayList<WishDTO> wishlist = dao.wishlist();
		
		model.addAttribute("wishlist", wishlist);
	}


	
}
