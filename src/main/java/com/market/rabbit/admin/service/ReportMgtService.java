package com.market.rabbit.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.market.rabbit.admin.dao.ReportMgtDAO;
import com.market.rabbit.dto.ReportDTO;
import com.market.rabbit.dto.SaleDTO;
import com.market.rabbit.dto.SaleFileDTO;

@Service
public class ReportMgtService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ReportMgtDAO dao;
	int numPerPage = 10;

	public HashMap<String, Object> callSaleReportList(int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int end = page*numPerPage;
		int start = end-(numPerPage-1);
		int allCnt = dao.callCntSaleReport();
		
		int range = allCnt%numPerPage > 0 ? Math.round(allCnt/numPerPage)+1 : allCnt/numPerPage;
		
		ArrayList<ReportDTO> saleReportList = dao.callSaleReportList(start, end);
		
		map.put("range", range);
		map.put("currPage", page);
		map.put("saleReportList", saleReportList);
		return map;
	}

	@Transactional
	public HashMap<String, Object> updateSaleReportState(int report_idx, String target) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean success = false;
		
		//멤버의 신고 cnt + 1
		dao.updateMemberReportCnt(target);
		//신고 처리상태 바꾸기
		if(dao.updateSaleReportState(report_idx) > 0) {
			success = true;
		}
		
		map.put("success", success);
		return map;
	}

	public ModelAndView callSaleBlindManage(int product_idx, int report_idx) {
		ModelAndView mav = new ModelAndView();
		String page = "admin/saleBlindManageForm";
		//sale 상세보기 링크를 보내기 위해서 product_idx 필요
		SaleDTO product = dao.callSaleProduct(product_idx);
		SaleFileDTO product_file = dao.callSaleProductFile(product_idx);	//대표이미지 하나만
		//신고사유를 알기 위해서 report_idx 필요
		ReportDTO report = dao.callSaleReport(report_idx);
		
		mav.addObject("product", product);
		mav.addObject("report", report);
		mav.addObject("path", "/saleImg/"+product_file.getNewFileName());
		mav.setViewName(page);
		return mav;
	}

	public HashMap<String, Object> updateSetBlind(int product_idx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean success = false;
		if(dao.updateSetBlind(product_idx) > 0) {
			success = true;
		}
		map.put("success", success);
		return map;
	}

	public HashMap<String, Object> updateSetUnBlind(int product_idx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean success = false;
		if(dao.updateSetUnBlind(product_idx) > 0) {
			success = true;
		}
		map.put("success", success);
		return map;
	}

}
