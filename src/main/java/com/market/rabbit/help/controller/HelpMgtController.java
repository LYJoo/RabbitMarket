package com.market.rabbit.help.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.market.rabbit.help.service.HelpService;


@Controller
public class HelpMgtController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired HelpService service;
	
	@RequestMapping(value = "/admin/noticeListPage", method = RequestMethod.GET)
	public String noticeListPage(Model model) {
		logger.info("공지사항 관리 리스트 페이지 요청");
		return "admin/noticeList";
	}
	
	@RequestMapping(value = "/admin/noticeList/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> noticeList(@PathVariable int pagePerCnt, @PathVariable int page) {
		logger.info("공지사항 리스트 요청 pagePerCnt: {}, page: {}",pagePerCnt,page);
		return service.noticeList(page,pagePerCnt);
	}
	
	
}
