package com.market.rabbit.sale.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.market.rabbit.dto.SaleCategoryDTO;
import com.market.rabbit.sale.service.SaleService;


@Controller
public class SaleController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SaleService service;
	
	@RequestMapping(value = "/sale/writeForm", method = RequestMethod.GET)
	public String writeForm(Model model) {
		//해야할것!! 로그인한 사람인지 확인하기
		
		logger.info("게시글 작성폼 요청");
		
		ArrayList<SaleCategoryDTO> saleCategory = service.getSaleCategory();
		
		model.addAttribute("saleCategory", saleCategory);
		return "sale/writeForm";
	}
	
}
