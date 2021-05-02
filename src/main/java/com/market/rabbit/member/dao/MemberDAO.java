package com.market.rabbit.member.dao;

import java.util.HashMap;

import com.market.rabbit.dto.MemberDTO;

public interface MemberDAO {

	int join(MemberDTO dto);

	int overlay(String id);

	int emoverlay(String email);

	int admin(HashMap<String, Object> map);

	int login(HashMap<String, Object> map);

	


}
