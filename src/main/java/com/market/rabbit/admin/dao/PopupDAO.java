package com.market.rabbit.admin.dao;

import java.util.ArrayList;

import com.market.rabbit.dto.NoticeDTO;
import com.market.rabbit.dto.PopupDTO;

public interface PopupDAO {

	int allCountPopup();

	ArrayList<NoticeDTO> popupList(int start, int end);

	PopupDTO detailPopup(int popup_idx);

	int writePopup(PopupDTO dto);

	int updatePopup(PopupDTO dto);

	int findNowPopup();

	int chageNowPopup(int nowPopup);

	int delPopup(int popup_idx);



}
