package com.market.rabbit.admin.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.rabbit.admin.dao.SaleCategoryMgtDAO;
import com.market.rabbit.dto.SaleCategoryDTO;

@Service
public class SaleCategoryMgtService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SaleCategoryMgtDAO dao;
	
	public ArrayList<SaleCategoryDTO> saleCategoryList() {
		return dao.saleCategoryList();
	}

	public int writeSaleCategory(SaleCategoryDTO dto) {
		return dao.writeSaleCategory(dto);
	}

	public int updateSaleCategory(SaleCategoryDTO dto) {
		return dao.updateSaleCategory(dto);
	}

	public int delSaleCategory(int s_category_idx) {
		return dao.delSaleCategory(s_category_idx);
	}
	
	

}
