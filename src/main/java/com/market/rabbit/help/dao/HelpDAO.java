package com.market.rabbit.help.dao;

import java.util.ArrayList;

import com.market.rabbit.dto.NoticeDTO;

public interface HelpDAO {

	int allCountNotice();

	ArrayList<NoticeDTO> noticeList(int start, int end);

}
