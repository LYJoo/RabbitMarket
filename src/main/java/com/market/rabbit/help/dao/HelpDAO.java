package com.market.rabbit.help.dao;

import java.util.ArrayList;

import com.market.rabbit.dto.NoticeDTO;

public interface HelpDAO {

	int allCountNotice();

	ArrayList<NoticeDTO> noticeList(int start, int end);

	int writeNotice(NoticeDTO dto);

	NoticeDTO detailNotice(int notice_idx);

	int updateNotice(NoticeDTO dto);

	int delNotice(int notice_idx);

}
