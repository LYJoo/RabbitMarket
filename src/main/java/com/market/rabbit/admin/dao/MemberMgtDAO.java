package com.market.rabbit.admin.dao;

import java.util.ArrayList;

import com.market.rabbit.dto.AdminDTO;
import com.market.rabbit.dto.BlackListDTO;
import com.market.rabbit.dto.MemberDTO;

public interface MemberMgtDAO {

	int allCountMember();

	int allCountBlack();

	int allCountWithdraw();

	ArrayList<MemberDTO> memberList(int start, int end);

	ArrayList<BlackListDTO> blackList(int start, int end);

	ArrayList<MemberDTO> withdrawList(int start, int end);

	MemberDTO callMember(String member_id);

	AdminDTO callAdmin(String admin_id);

}
