package com.market.rabbit.message.dao;

import java.util.ArrayList;

import com.market.rabbit.dto.MessageDTO;

public interface MessageDAO {

	ArrayList<MessageDTO> callReceiveMsgList(int start, int end, String loginId);

	ArrayList<MessageDTO> callSendMsgList(int start, int end, String loginId);

	ArrayList<MessageDTO> callBlockMsgList(int start, int end, String loginId);


}
