package com.market.rabbit.admin.dao;

import java.util.ArrayList;

import com.market.rabbit.dto.CommentsDTO;
import com.market.rabbit.dto.ReportDTO;
import com.market.rabbit.dto.SaleDTO;
import com.market.rabbit.dto.SaleFileDTO;

public interface ReportMgtDAO {

	ArrayList<ReportDTO> callSaleReportList(int start, int end);

	int callCntSaleReport();

	void updateMemberReportCnt(String target);

	int updateReportState(int report_idx);

	ReportDTO callReport(int report_idx);

	SaleDTO callSaleProduct(int product_idx);

	SaleFileDTO callSaleProductFile(int product_idx);

	int updateSaleSetBlind(int product_idx);

	int updateSaleSetUnBlind(int product_idx);

	int callCntCommentReport();

	ArrayList<ReportDTO> callCommentReportList(int start, int end);

	CommentsDTO callComment(int comment_idx);

	int updateCommentSetBlind(int comment_idx);

	int updateCommentSetUnBlind(int comment_idx);

}
