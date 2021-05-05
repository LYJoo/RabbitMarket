package com.market.rabbit.admin.dao;

import java.util.ArrayList;

import com.market.rabbit.dto.SaleCategoryDTO;

public interface SaleCategoryMgtDAO {

	ArrayList<SaleCategoryDTO> saleCategoryList();

	int writeSaleCategory(SaleCategoryDTO dto);

	int updateSaleCategory(SaleCategoryDTO dto);

	int delSaleCategory(int s_category_idx);

}
