package com.market.rabbit.profile.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import com.market.rabbit.dto.AlarmDTO;
import com.market.rabbit.dto.BlockDTO;
import com.market.rabbit.dto.KeywordDTO;
import com.market.rabbit.dto.MemberDTO;
import com.market.rabbit.dto.ProfileFileDTO;
import com.market.rabbit.dto.QuestionDTO;
import com.market.rabbit.dto.ReportDTO;
import com.market.rabbit.dto.TradingDTO;

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


	int countMyBuyList(HashMap<String, String> params);

	ArrayList<TradingDTO> callMyBuyList(HashMap<String, Object> listParams);

	int setCancelReason(int trade_idx, String cancel_reason, Date date);

	int setCodeNum(int product_idx);

	int setTradeEnd(int product_idx, int trade_idx);

	int writeReview(String member_id, String write_id, String review_content);

}
