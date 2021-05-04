package com.market.rabbit.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.rabbit.admin.service.MannerMgtService;
import com.market.rabbit.dto.MannerQuestionDTO;


@Controller
public class MannerMgtController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MannerMgtService service;
	
	//리스트
	@RequestMapping(value = "/admin/callMannerQ", method = RequestMethod.GET)
	public ModelAndView callMannerQ(Model model) {
		ModelAndView mav = new ModelAndView();
		
		MannerQuestionDTO dto = new MannerQuestionDTO();
		dto.setTrade_type("직거래");
		dto.setTarget("구매자");
		ArrayList<MannerQuestionDTO> directBuyerList = service.mannerQList(dto);
		mav.addObject("directBuyerList", directBuyerList);
		
		dto.setTrade_type("직거래");
		dto.setTarget("판매자");
		ArrayList<MannerQuestionDTO> directSellerList = service.mannerQList(dto);
		mav.addObject("directSellerList", directSellerList);
		
		dto.setTrade_type("택배");
		dto.setTarget("구매자");
		ArrayList<MannerQuestionDTO> deliveryBuyerList = service.mannerQList(dto);
		mav.addObject("deliveryBuyerList", deliveryBuyerList);
		
		dto.setTrade_type("택배");
		dto.setTarget("판매자");
		ArrayList<MannerQuestionDTO> deliverySellerList = service.mannerQList(dto);
		mav.addObject("deliverySellerList", deliverySellerList);
		
		mav.setViewName("admin/mannerQ");
		return mav;
	}
	
	//등록
	@RequestMapping(value = "/admin/writeMannerQ", method = RequestMethod.POST)
	public String writeMannerQ(@ModelAttribute MannerQuestionDTO dto, RedirectAttributes rttr) {

		String msg = "";		
		int count = service.countMannerQ(dto);//등록된 수 체크
		logger.info("등록 수 체크 : "+ count);
		if(count<5) {
			int success = service.writeMannerQ(dto);//등록
			logger.info("등록 여부 : "+success);
		} else {
			msg = "5 개 까지 등록가능합니다!";
			rttr.addFlashAttribute("msg", msg);
		}
		
		return "redirect:/admin/callMannerQ";
	}
	
	//수정
	@RequestMapping(value = "/admin/updateMannerQ", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> updateMannerQ(@RequestBody MannerQuestionDTO dto) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("수정할 값 : "+dto.getManner_idx()+"/"+dto.getTrade_type()+"/"+dto.getTarget()+"/"+dto.getManner_content()+"/"+dto.getLook_order());
		int success = service.updateMannerQ(dto);
		logger.info("수정성공 여부 : "+success);
		map.put("success", success);
		return map;
	}
	
	//삭제
	@RequestMapping(value = "/admin/delMannerQ/{manner_idx}", method = RequestMethod.GET)
	public String delMannerQ(@PathVariable int manner_idx) {
		int success = service.delMannerQ(manner_idx);
		return "redirect:/admin/callMannerQ";
	}
	
	
	
}
