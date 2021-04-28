package com.market.rabbit.profile.dao;

import com.market.rabbit.dto.MemberDTO;
import com.market.rabbit.dto.ProfileFileDTO;

public interface ProfileDAO2 {

	MemberDTO callMemberInfo(String loginId);

	ProfileFileDTO callMemberProfile(String loginId);

}
