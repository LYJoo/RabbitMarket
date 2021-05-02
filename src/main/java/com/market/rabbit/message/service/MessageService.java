package com.market.rabbit.message.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.rabbit.dto.MessageDTO;
import com.market.rabbit.message.dao.MessageDAO;

@Service
public class MessageService {
	
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MessageDAO dao;
	int numPerPage = 10;

	public HashMap<String, Object> callMsgList(int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int end = numPerPage*page;
		int start = end-(numPerPage-1);
		String loginId = "hwi";
		
		//1. 받은쪽지목록
		ArrayList<MessageDTO> receiveMsgList = dao.callReceiveMsgList(start, end, loginId);
		map.put("receiveMsgList", receiveMsgList);
		
		//2. 보낸쪽지목록
		ArrayList<MessageDTO> sendMsgList = dao.callSendMsgList(start, end, loginId);
		map.put("sendMsgList", sendMsgList);
		
		//3. 차단쪽지목록
		ArrayList<MessageDTO> blockMsgList = dao.callBlockMsgList(start, end, loginId);
		map.put("blockMsgList", blockMsgList);

		
		return map;
	}

	public ModelAndView writeMsg(HttpSession session, String receiver, String msg_content, RedirectAttributes rAttr) {
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/message/writeForm";
		String msg = "쪽지 전송에 실패하였습니다.";
		//String loginId = (String) session.getAttribute("loginId");
		String loginId = "hwi";
		
		if(dao.writeMsg(loginId, receiver, msg_content) > 0) {
			page = "redirect:/message/mainPage";
			msg = "쪽지 전송에 성공하였습니다.";
		}
		
		rAttr.addFlashAttribute("msg", msg);
		mav.setViewName(page);
		return mav;
	}

}












