package com.market.rabbit.sale.dao;

import java.util.ArrayList;
import java.util.Date;

import com.market.rabbit.dto.CoCommentDTO;
import com.market.rabbit.dto.CommentsDTO;
import com.market.rabbit.dto.SaleCategoryDTO;
import com.market.rabbit.dto.SaleDTO;
import com.market.rabbit.dto.SaleFileDTO;

public interface SaleDAO {

	ArrayList<SaleCategoryDTO> getSaleCategory();

	int save(SaleDTO params);

	void saveFile(String newFileName, String oriFileName, int product_idx);

	void transction(int product_idx);

	ArrayList<String> selectKeywordAlarmMember(String keyword, String seller_id);

	void insertKeywordAlarm(String member_id, String msg);
	
	ArrayList<SaleDTO> callProductList_unmember(int start, int end);
	
	int getAge(String loginId);

	String getLocation(String loginId);

	ArrayList<SaleDTO> callProductListMinorMember(String loginId, int start, int end);
	
	ArrayList<SaleDTO> callProductListMember(String loginId, int start, int end);

	int getEndPage_ummember();

	int getEndPageMinorMember(String loginId);

	int getEndPageMember(String loginId);

	SaleDTO detail(int product_idx);

	ArrayList<SaleFileDTO> fileList(int product_idx);

	void upHit(int product_idx);

	ArrayList<CommentsDTO> commentList(int product_idx);

	ArrayList<CoCommentDTO> cocommentList(int comment_idx);

	int commentWrite(int product_idx, String comment_content, String loginId);

	int cocommentWrite(int comment_idx, String cocomment_content, String loginId);

	String getSubject(int product_idx);

	String getMember_id(int product_idx);

	void sendAlarm(String msg, String member_id, int i);

	int report(int idx, int codeNum, String target, String report_reason, String loginId);

	int chReport(int idx, int codeNum, String loginId);

	String getTarget(int idx, int codeNum);

	int pDel(int idx);

	int cDel(int idx);

	int ccDel(int idx);

	int chWish(String loginId, int product_idx);

	int chWishDel(String loginId, int product_idx);

	int wishPlus1(int idx, String loginId);

	int wishPlus2(int idx, String loginId);

	int wishMinus(int idx, String loginId);

	int existId(String id);

	int changeIng(int idx, String id, String trade_type, String loginId);

	void changeIng2(int idx);

	int getTardeIdx(int idx, String id);

	int setMeetDate(int trade_idx, Date date);

	String getBuyerId(int product_idx);

	int getTradeIdx(int product_idx);

	int setCancelReason(int trade_idx, String cancel_reason, Date date);

	int setCodeNum(int product_idx);

}
