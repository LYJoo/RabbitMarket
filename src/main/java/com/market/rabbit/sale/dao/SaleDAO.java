package com.market.rabbit.sale.dao;

import java.util.ArrayList;

import com.market.rabbit.dto.SaleCategoryDTO;
import com.market.rabbit.dto.SaleDTO;

public interface SaleDAO {

	ArrayList<SaleCategoryDTO> getSaleCategory();

	int save(SaleDTO params);

	void saveFile(String newFileName, String oriFileName, int product_idx);

	void transction(int product_idx);

	ArrayList<String> selectKeywordAlarmMember(String keyword, String seller_id);

	void insertKeywordAlarm(String member_id, String msg);
	
	ArrayList<SaleDTO> callProductList_unmember();
	
	ArrayList<SaleDTO> callProductList_member();

}
