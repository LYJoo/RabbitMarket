package com.market.rabbit.admin.dao;

import java.util.ArrayList;

import com.market.rabbit.dto.ReportDTO;
import com.market.rabbit.dto.SaleDTO;
import com.market.rabbit.dto.SaleFileDTO;

public interface ReportMgtDAO {

	ArrayList<ReportDTO> callSaleReportList(int start, int end);

	int callCntSaleReport();

	void updateMemberReportCnt(String target);

	int updateSaleReportState(int report_idx);

	ReportDTO callSaleReport(int report_idx);

	SaleDTO callSaleProduct(int product_idx);

	SaleFileDTO callSaleProductFile(int product_idx);

}
