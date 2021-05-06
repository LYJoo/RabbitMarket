package com.market.rabbit.message.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.rabbit.dto.MessageDTO;
import com.market.rabbit.message.dao.MessageDAO;

@Service
public class MessageService {
	
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MessageDAO dao;
	int numPerPage = 5;

	public HashMap<String, Object> callMsgList(int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int end = numPerPage*page;
		int start = end-(numPerPage-1);
		String loginId = "hwi";
		
		int allCntReceive = dao.countReceive(loginId);
		int allCntSend = dao.countSend(loginId);
		int allCntBlock = dao.countBlock(loginId);
		
		int rangeReceive = allCntReceive%numPerPage > 0 ? Math.round(allCntReceive/numPerPage)+1 : allCntReceive/numPerPage;
		int rangeSend = allCntSend%numPerPage > 0 ? Math.round(allCntSend/numPerPage)+1 : allCntSend/numPerPage;
		int rangeBlock = allCntBlock%numPerPage > 0 ? Math.round(allCntBlock/numPerPage)+1 : allCntBlock/numPerPage;
		
		//1. 받은쪽지목록
		ArrayList<MessageDTO> receiveMsgList = dao.callReceiveMsgList(start, end, loginId);
		map.put("rangeReceive", rangeReceive);
		map.put("receiveMsgList", receiveMsgList);
		
		//2. 보낸쪽지목록
		ArrayList<MessageDTO> sendMsgList = dao.callSendMsgList(start, end, loginId);
		map.put("rangeSend", rangeSend);
		map.put("sendMsgList", sendMsgList);
		
		//3. 차단쪽지목록
		ArrayList<MessageDTO> blockMsgList = dao.callBlockMsgList(start, end, loginId);
		map.put("rangeBlock", rangeBlock);
		map.put("blockMsgList", blockMsgList);

		map.put("currPage", page);
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

	public ModelAndView callDetailMsg(int msg_idx, int serviceType) {
		ModelAndView mav = new ModelAndView();
		String page = "myPage/mainPage";//view 초기화
		
		if(serviceType == 0) {			//받은메시지 상세
			page = "myPage/message_receiveMsgDetail";
		}else if(serviceType == 1) {	//보낸메시지 상세
			page = "myPage/message_sendMsgDetail";
		}else if(serviceType == 2) {	//차단메시지 상세
			page = "myPage/message_blockMsgDetail";
		}
		
		MessageDTO dto = dao.callDetailMsg(msg_idx);
		//받은메시지or차단메시지이고 처음 디테일 불러온다면(read_boolean == 0(false)) 1(true)로 바꾼다
		if(serviceType == 0 || serviceType == 2) {
			if(!dto.isRead_boolean()) {
				dao.updateRead(msg_idx);
				dto.setRead_boolean(true);
			}			
		}
		
		mav.addObject("dto", dto);
		mav.setViewName(page);
		return mav;
	}

	public ModelAndView delMsg(String msg_idx, int serviceType, RedirectAttributes rAttr) {
		ModelAndView mav = new ModelAndView();
		String msg = "쪽지 삭제에 실패하였습니다.";
		
		if(serviceType == 0) {
			if(dao.delReceiveMsg(msg_idx) > 0) {
				msg = "받은 쪽지 삭제에 성공하였습니다.";
			}
		}else if(serviceType == 1) {
			if(dao.delSendMsg(msg_idx) > 0) {
				msg = "보낸 쪽지 삭제에 성공하였습니다.";
			}
		}
		
		rAttr.addFlashAttribute("msg", msg);
		mav.setViewName("redirect:/message/mainPage");
		return mav;
	}




}












