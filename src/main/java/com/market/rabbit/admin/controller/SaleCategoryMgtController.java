package com.market.rabbit.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.rabbit.admin.service.SaleCategoryMgtService;
import com.market.rabbit.dto.MannerQuestionDTO;
import com.market.rabbit.dto.SaleCategoryDTO;


@Controller
public class SaleCategoryMgtController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SaleCategoryMgtService service;
	
	//리스트
	@RequestMapping(value = "/admin/callSaleCategory", method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		
		ArrayList<SaleCategoryDTO> list = service.saleCategoryList();
		mav.addObject("saleCategoryList", list);
		
		mav.setViewName("admin/saleCategoryList");
		return mav;
	}
	
	//등록
	@RequestMapping(value = "/admin/writeSaleCategory", method = RequestMethod.POST)
	public String writeSaleCategory(@ModelAttribute SaleCategoryDTO dto) {
		int success = service.writeSaleCategory(dto);
		logger.info("카테고리 등록여부: "+success);
		return "redirect:/admin/callSaleCategory";
	}
	
	//수정
	@RequestMapping(value = "/admin/updateSaleCategory", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> updateSaleCategory(@RequestBody SaleCategoryDTO dto) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("수정할 값 : "+dto.getS_category_idx()+"/"+dto.getS_category_name());
		int success = service.updateSaleCategory(dto);
		logger.info("수정성공 여부 : "+success);
		map.put("success", success);
		return map;
	}
	
	//삭제
	@RequestMapping(value = "/admin/delSaleCategory/{s_category_idx}", method = RequestMethod.GET)
	public String delSaleCategory(@PathVariable int s_category_idx) {
		int success = service.delSaleCategory(s_category_idx);
		return "redirect:/admin/callSaleCategory";
	}
	
	
	
}
