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
	
	//그냥 바로 쪽지 보낼때
	@RequestMapping(value = "/message/writeForm", method = RequestMethod.GET)
	public String callWriteForm() {
		logger.info("쪽지 작성폼 요청");
		return "myPage/message_writeForm";
	}
	
	//답장할때
	@RequestMapping(value = "/message/replyForm", method = RequestMethod.GET)
	public ModelAndView callReplyForm(@RequestParam String receiver) {
		logger.info("쪽지 답장폼 요청");
		ModelAndView mav = new ModelAndView();
		mav.addObject("receiver", receiver);
		mav.setViewName("myPage/message_writeForm");
		return mav;
	}
	
	@RequestMapping(value = "/message/writeMsg", method = RequestMethod.POST)
	public ModelAndView callWriteMsg(HttpSession session, @RequestParam String receiver, @RequestParam String msg_content, RedirectAttributes rAttr) {
		logger.info("쪽지 작성 요청");
		return service.writeMsg(session, receiver, msg_content, rAttr);
	}
	
	@RequestMapping(value = "/message/detailMsg", method = RequestMethod.GET)
	public ModelAndView callDetailMsg(int msg_idx, String msgType) {
		
		int serviceType = 0;	//기본 읽기는 받은메시지
		
		//메시지 타입 분기
		if(msgType.equals("receiveMsg")) {
			logger.info(msg_idx+"번 받은 쪽지 상세보기 요청");
			serviceType = 0;	//0은 받은메시지 상세
		}else if(msgType.equals("sendMsg")) {
			logger.info(msg_idx+"번 보낸 쪽지 상세보기 요청");
			serviceType = 1;	//1은 보낸메시지 상세
		}else if(msgType.equals("blockMsg")) {
			logger.info(msg_idx+"번 차단 쪽지 상세보기 요청");
			serviceType = 2;	//2는 차단메시지 상세
		}
		
		return service.callDetailMsg(msg_idx, serviceType);
		
	}
	
}













