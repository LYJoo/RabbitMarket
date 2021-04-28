package com.market.rabbit.profile.dao;

import com.market.rabbit.dto.MemberDTO;
import com.market.rabbit.dto.ProfileFileDTO;

public interface ProfileDAO2 {

	MemberDTO callMemberInfo(String loginId);

	ProfileFileDTO callMemberProfile(String loginId);

	int updateProfile(ProfileFileDTO profile);

	int updateMember(MemberDTO member);

	String callOriFileName(String member_id);

	String confirmPw(String loginId, String currPw);

	void updatePw(String loginId, String afterPw);

	void delMemberWithdraw(String loginId);

}
