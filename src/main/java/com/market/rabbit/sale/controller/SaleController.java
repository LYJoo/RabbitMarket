package com.market.rabbit.sale.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.market.rabbit.dto.CoCommentDTO;
import com.market.rabbit.dto.SaleCategoryDTO;
import com.market.rabbit.dto.SaleDTO;
import com.market.rabbit.sale.service.SaleService;


@Controller
public class SaleController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SaleService service;
	
	@RequestMapping(value = "/sale/main", method = RequestMethod.GET)
	public String main(Model model, HttpSession session) {
		
		return "/sale/mainPage";
	}
	
	@RequestMapping(value = "/sale/main/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> mainPaging(HttpSession session,  @PathVariable int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<SaleDTO> list = null;
		int memberAge = 0;
		String location = "";
		
		int end = page * 20;
		int start = end -19;
		int range = 0;
		
		//해야할것!! 로그인한 사람인지 확인하기
		String loginId = (String) session.getAttribute("loginId");
		System.out.println(loginId);
		
		//로그인 안했을 경우
		if(loginId == null) {
			list = service.callProductList_unmember(start, end);
			long allCnt = service.getEndPage_ummember();
			range = (int) (allCnt%20 > 0 ?  Math.floor(allCnt/20)+1 : Math.floor(allCnt/20));
			System.out.println(range);
		}else {
			memberAge = service.getAge(loginId);
			location = service.getLocation(loginId);
			
			if(memberAge <20) {
				list = service.callProductListMinorMember(loginId, start, end);
				long allCnt = service.getEndPageMinorMember(loginId);
				range = (int) (allCnt%20 > 0 ?  Math.floor(allCnt/20)+1 : Math.floor(allCnt/20));
			}else {
				list = service.callProductListMember(loginId, start, end);
				long allCnt = service.getEndPageMember(loginId);
				range = (int) (allCnt%20 > 0 ?  Math.floor(allCnt/20)+1 : Math.floor(allCnt/20));
			}
		}
		map.put("page", page);
		map.put("range", range);
		map.put("location",location);
		map.put("list",list);
		return map;
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
	
	@RequestMapping(value = "/sale/detail", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam int product_idx) {
		logger.info("받아온 파라메터 값" + product_idx);
		
		service.detail(product_idx, model);
		
		return "/sale/productDetail";
	}
	
	@RequestMapping(value = "/sale/cocommentList", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> cocommentList(@RequestParam int comment_idx) {
		logger.info("받아온 파라메터 값"+ comment_idx);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<CoCommentDTO> list = null;
		int success = 0;
		
		list = service.cocommentList(comment_idx);
		if(list != null) {
			success = 1;
		}
		map.put("success", success);
		map.put("list", list);
		return map;
	}
	
}
