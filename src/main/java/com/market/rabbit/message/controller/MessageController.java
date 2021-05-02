package com.market.rabbit.message.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.rabbit.message.service.MessageService;


@Controller
public class MessageController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MessageService service;
	
	@RequestMapping(value = "/message/mainPage", method = RequestMethod.GET)
	public String callMainPage(Model model) {
		logger.info("쪽지 메인페이지 요청");
		return "myPage/message_main";
	}
	
	@RequestMapping(value = "/message/list/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> callMsgList(@PathVariable int page) {
		
		logger.info("Message {} 페이지 리스트 요청", page);
		return service.callMsgList(page);
	}
	
	@RequestMapping(value = "/message/writeForm", method = RequestMethod.GET)
	public String callWriteForm(Model model) {
		logger.info("쪽지 작성폼 요청");
		return "myPage/message_writeForm";
	}
	
	@RequestMapping(value = "/message/writeMsg", method = RequestMethod.POST)
	public ModelAndView callWriteMsg(HttpSession session, @RequestParam String receiver, @RequestParam String msg_content, RedirectAttributes rAttr) {
		logger.info("쪽지 작성 요청");
		return service.writeMsg(session, receiver, msg_content, rAttr);
	}
	
}













