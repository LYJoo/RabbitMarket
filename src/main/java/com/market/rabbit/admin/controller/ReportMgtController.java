package com.market.rabbit.admin.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.market.rabbit.admin.service.ReportMgtService;


@Controller
public class ReportMgtController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ReportMgtService service;
	
	@RequestMapping(value = "/admin/saleReportList", method = RequestMethod.GET)
	public String callSaleReportListForm() {
		logger.info("관리자 / 글 신고 목록 페이지 불러오기");
		return "admin/saleReportList";
	}
	
	@RequestMapping(value = "/admin/saleReportList/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> callSaleReportList(@PathVariable int page) {
		logger.info("관리자 / {} 페이지 글 신고 목록 불러오기", page);
		return service.callSaleReportList(page);
	}
	
	@RequestMapping(value = "/admin/updateSaleReportState", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> updateSaleReportState(@RequestParam int report_idx, @RequestParam String target) {
		logger.info("관리자 / 페이지 글 신고 상태 수정하기");
		logger.info("타갯 : {}, 신고번호 : {}", target, report_idx);
		return service.updateSaleReportState(report_idx, target);
	}
	
	@RequestMapping(value = "/admin/saleBlindManage/{product_idx}/{report_idx}", method = RequestMethod.GET)
	public ModelAndView callSaleBlindManage(@PathVariable int product_idx, @PathVariable int report_idx) {
		logger.info("관리자 / {}번 글 {}번 신고 블라인드 관리 페이지 불러오기", product_idx, report_idx);
		return service.callSaleBlindManage(product_idx, report_idx);
	}
	
	@RequestMapping(value = "/admin/updateSetBlind/{product_idx}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> updateSetBlind(@RequestParam int report_idx) {
		logger.info("관리자 / {}번 판매글 블라인드 처리", report_idx);
		//return service.updateSetBlind(report_idx);
		return null;
	}
}
