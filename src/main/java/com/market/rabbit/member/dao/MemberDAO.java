package com.market.rabbit.member.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.market.rabbit.dto.MemberDTO;

public interface MemberDAO {

	int join(MemberDTO dto);

	int overlay(String id);

	int emoverlay(String email);

	int admin(HashMap<String, Object> map);

	int login(HashMap<String, Object> map);

	String findId(@Param("name")String name,  @Param("email")String email);

	int findPw(HashMap<String, String> params);

	int resetPw(@Param("pw")String pw2, @Param("member_id")String id);


	String logpw(@Param("pw")String loginPw, @Param("id")String loginId);

	String logadminpw(@Param("pw")String loginPw,  @Param("admin_id")String loginId);

	String withd(HashMap<String, String> params);

	void insertDefaultProfile(String member_id);

	

	
	
	

	


}
