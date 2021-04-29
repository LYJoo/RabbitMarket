package com.market.rabbit.sale.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.market.rabbit.dto.SaleCategoryDTO;
import com.market.rabbit.dto.SaleDTO;
import com.market.rabbit.sale.service.SaleService;


@Controller
public class SaleController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SaleService service;
	
	@RequestMapping(value = "/sale/main", method = RequestMethod.GET)
	public String main(Model model, HttpSession session) {
		ArrayList<SaleDTO> list = null;
		int memberAge = 0;
		String location = "";
		
		//해야할것!! 로그인한 사람인지 확인하기
		String loginId = (String) session.getAttribute("loginId");
		System.out.println(loginId);
		
		//로그인 안했을 경우
		if(loginId == null) {
			list = service.callProductList_unmember();
		}else {
			memberAge = service.getAge(loginId);
			location = service.getLocation(loginId);
			if(memberAge <20) {
				list = service.callProductListMinorMember(loginId);
			}else {
				list = service.callProductListMember(loginId);
			}
		}
		model.addAttribute("location",location);
		model.addAttribute("list",list);
		return "sale/mainPage";
	}
	
	@RequestMapping(value = "/sale/writeForm", method = RequestMethod.GET)
	public String writeForm(Model model, HttpSession session) {
		logger.info("게시글 작성폼 요청");
		//해야할것!! 로그인한 사람인지 확인하기
		session.setAttribute("loginId", "lalala");
		
		HashMap<String, String> fileList = new HashMap<String, String>();
		session.setAttribute("fileList", fileList);
		
		ArrayList<SaleCategoryDTO> saleCategory = service.getSaleCategory();
		
		model.addAttribute("saleCategory", saleCategory);
		return "sale/writeForm";
	}
	
	@RequestMapping(value = "/sale/fileUpload", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> upload(MultipartFile[] sale_file,HttpSession session) {
		logger.info("파일 갯수: " + sale_file.length);
		
		return service.fileUpload(sale_file,session);
	}
	
	@RequestMapping(value = "/sale/delFile", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> delFile(@RequestParam String delFileName, HttpSession session) {
		logger.info("삭제할 파일 " + delFileName);
		
		return service.delFile(delFileName, session);
	}
	
	@RequestMapping(value = "/sale/save", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> save(@ModelAttribute SaleDTO dto, HttpSession session) {
		logger.info(" 받아온 파라메터 값들" + dto);

		return service.save(dto, session);
	}
	
}
