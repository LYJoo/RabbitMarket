package com.market.rabbit.sale.dao;

import java.util.ArrayList;

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

}
