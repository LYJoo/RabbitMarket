package com.market.rabbit.sale.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.rabbit.dto.SaleCategoryDTO;
import com.market.rabbit.sale.dao.SaleDAO;

@Service
public class SaleService {

	@Autowired SaleDAO dao;
	
	public ArrayList<SaleCategoryDTO> getSaleCategory() {
		
		return dao.getSaleCategory();
	}

}
