package com.market.rabbit.profile.dao;

import java.util.ArrayList;

import com.market.rabbit.dto.AlarmDTO;
import com.market.rabbit.dto.BlockDTO;
import com.market.rabbit.dto.KeywordDTO;
import com.market.rabbit.dto.MemberDTO;
import com.market.rabbit.dto.ProfileFileDTO;
import com.market.rabbit.dto.QuestionDTO;
import com.market.rabbit.dto.ReportDTO;

public interface ProfileDAO2 {

	MemberDTO callMemberInfo(String loginId);

	ProfileFileDTO callMemberProfile(String loginId);

	int updateProfile(ProfileFileDTO profile);

	int updateMember(MemberDTO member);

	String callOriFileName(String member_id);

	String confirmPw(String loginId, String currPw);

	void updatePw(String loginId, String afterPw);

	void delMemberWithdraw(String loginId);

	ArrayList<AlarmDTO> callAlarmList(String loginId, int start, int end);

	int delAlarm(int alarm_idx);

	ArrayList<BlockDTO> callBlockList(String loginId, int start, int end);

	int delBlock(int block_idx);

	ArrayList<ReportDTO> callSaleReportList(String loginId, int start, int end);

	ArrayList<ReportDTO> callCommentReportList(String loginId, int start, int end);

	ArrayList<ReportDTO> callCocommentReportList(String loginId, int start, int end);

	ArrayList<QuestionDTO> callQuestionList(String loginId, int start, int end);

	int countQuestionList(String loginId);

	ArrayList<KeywordDTO> callKeywords(String loginId);

	int delKeyword(String loginId, int keyword_idx);

	int writeKeyword(String loginId, String keyword);

	int countAlarmList(String loginId);

	int countBlockList(String loginId);

	int countSaleReportList(String loginId);

	int countCommentReportList(String loginId);

	int countCocommentReportList(String loginId);

}
