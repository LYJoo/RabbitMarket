package com.market.rabbit.admin.dao;

import java.util.ArrayList;

import com.market.rabbit.dto.AdminDTO;
import com.market.rabbit.dto.NoticeDTO;

public interface AdminMgtDAO {

	int allCountAdmin();

	ArrayList<NoticeDTO> adminList(int start, int end);

	String findAdmin(String new_id);

	int joinAdmin(AdminDTO dto);

	AdminDTO detailAdmin(String admin_id);

	int updateAdmin(AdminDTO dto);

	int delAdmin(String admin_id);


}
