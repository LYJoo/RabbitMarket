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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.rabbit.dto.CoCommentDTO;
import com.market.rabbit.dto.MannerQuestionDTO;
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
	
	@RequestMapping(value = "/sale/searchList", method = RequestMethod.GET)
	public ModelAndView searchListForm(@RequestParam String inputData) {
		ModelAndView mav = new ModelAndView();
		
		logger.info("입력받은 데이터 : {}", inputData);
		
		mav.addObject("inputData", inputData);
		mav.setViewName("/sale/searchListForm");
		return mav;
	}
	
	@RequestMapping(value = "/sale/searchList/{inputData}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> searchList(@PathVariable String inputData) {
		logger.info("검색어 : {}", inputData);
		return service.searchList(inputData);
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
	public String detail(Model model, @RequestParam int product_idx, HttpSession session) {
		logger.info("받아온 파라메터 값" + product_idx);
		String loginId = (String) session.getAttribute("loginId");
		
		service.detail(product_idx, model);
		
		if(loginId != null) {			
			service.chWish(loginId, product_idx,  model);
		}
		
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
	
	@RequestMapping(value = "/sale/commentWrite", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> commentWrite(@RequestParam int product_idx, @RequestParam String comment_content ,HttpSession session) {
		logger.info("받아온 파라메터 값"+ comment_content);
		String loginId = (String) session.getAttribute("loginId");

		return service.commentWrite(product_idx, comment_content, loginId);
	}
	
	@RequestMapping(value = "/sale/cocommentWrite", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> cocommentWrite(@RequestParam int comment_idx, @RequestParam String cocomment_content ,HttpSession session) {
		logger.info("받아온 파라메터 값"+ comment_idx + cocomment_content);
		String loginId = (String) session.getAttribute("loginId");

		return service.cocommentWrite(comment_idx, cocomment_content, loginId);
	}
	
	//댓글 수정
	@RequestMapping(value = "/sale/commentUpdate", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> commentUpdate(@RequestParam int comment_idx, @RequestParam String comment_content ,HttpSession session) {
		logger.info("받아온 수정 파라메터 값"+comment_idx+"/"+ comment_content);
		
		return service.commentUpdate(comment_idx, comment_content);
	}
	
	//대댓글 수정
	@RequestMapping(value = "/sale/cocommentUpdate", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> cocommentUpdate(@RequestParam int cocomment_idx, @RequestParam String cocomment_content ,HttpSession session) {
		logger.info("받아온 수정 파라메터 값"+cocomment_idx+"/"+ cocomment_content);
		
		return service.cocommentUpdate(cocomment_idx, cocomment_content);
	}
	
	
	@RequestMapping(value = "/sale/reportForm", method = RequestMethod.GET)
	public String reportForm(Model model,@RequestParam int idx, @RequestParam int codeNum, @RequestParam String target,HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		int chReport  = 0;
		int reporter = service.chReport(idx,codeNum,loginId);
		if(reporter == 1) {
			chReport = 1;
		}
		System.out.println(chReport);
		if(chReport == 0) {
			model.addAttribute("chReport", chReport);
			model.addAttribute("idx", idx);
			model.addAttribute("codeNum", codeNum);
			model.addAttribute("target", target);
		}else {
			model.addAttribute("chReport", chReport);
		}

		return "/sale/reportForm";
	}
	
	@RequestMapping(value = "/sale/cocoReportForm", method = RequestMethod.GET)
	public String cocoReportForm(Model model,@RequestParam int idx, @RequestParam int codeNum,HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		
		System.out.println(idx + " ./ "+codeNum);
		
		String target = service.getTarget(idx, codeNum);
		System.out.println("타켓: "+target);
		int chReport  = 0;
		int reporter = service.chReport(idx,codeNum,loginId);
		if(reporter == 1) {
			chReport = 1;
		}
		System.out.println(chReport);
		if(chReport == 0) {
			model.addAttribute("chReport", chReport);
			model.addAttribute("idx", idx);
			model.addAttribute("codeNum", codeNum);
			model.addAttribute("target", target);
		}else {
			model.addAttribute("chReport", chReport);
		}
		return "/sale/reportForm";
	}
	
	@RequestMapping(value = "/sale/report", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> report(@RequestParam int idx, @RequestParam int codeNum, @RequestParam String target, @RequestParam String report_reason ,HttpSession session) {
		logger.info("받아온 파라메터 값"+ idx + codeNum + target + report_reason);
		String loginId = (String) session.getAttribute("loginId");

		return service.report(idx, codeNum, target, report_reason, loginId);
	}
	
	@RequestMapping(value = "/sale/pDel", method = RequestMethod.GET)
	public String pDel(RedirectAttributes rAttr, @RequestParam int idx) {
		System.out.println(idx);
		String msg = "";
		int success = service.pDel(idx);
		System.out.println("삭제 성공? "+success);
		
		if(success > 0 ) {
			msg = "상품을 삭제했습니다.";
			rAttr.addFlashAttribute("msg", msg);
			return "redirect:/sale/main";
		}else {
			msg = "상품 삭제에 실패했습니다. 잠시 후 다시 시도해주세요.";
			rAttr.addFlashAttribute("msg", msg);
			return "redirect:/sale/detail?product_idx="+idx;
		}
	}
	
	@RequestMapping(value = "/sale/cDel", method = RequestMethod.GET)
	public String cDel( RedirectAttributes rAttr, @RequestParam int idx, @RequestParam int product_idx) {
		System.out.println(idx + "/"+product_idx);
		String msg = "";
		int success = service.cDel(idx);
		System.out.println("삭제 성공? "+success);
		
		if(success > 0 ) {
			msg = "댓글을 삭제했습니다.";
		}else {
			msg = "댓글 삭제에 실패했습니다. 잠시 후 다시 시도해주세요.";
		}
		rAttr.addFlashAttribute("msg", msg);
		return "redirect:/sale/detail?product_idx="+product_idx;
	}
	
	@RequestMapping(value = "/sale/ccDel", method = RequestMethod.GET)
	public String ccDel( RedirectAttributes rAttr, @RequestParam int idx, @RequestParam int product_idx) {
		System.out.println(idx + "/"+product_idx);
		String msg = "";
		int success = service.ccDel(idx);
		
		System.out.println("삭제 성공? "+success);
		
		if(success > 0 ) {
			msg = "대댓글을 삭제했습니다.";
		}else {
			msg = "대댓글 삭제에 실패했습니다. 잠시 후 다시 시도해주세요.";
		}
		rAttr.addFlashAttribute("msg", msg);
		return "redirect:/sale/detail?product_idx="+product_idx;
	}
	
	@RequestMapping(value = "/sale/wishPlus1", method = RequestMethod.GET)
	public String wishPlus1(@RequestParam int idx,HttpSession session) {//insert
		String loginId = (String) session.getAttribute("loginId");
		int success = service.wishPlus1(idx, loginId);
		
		System.out.println("성공? "+success);

		return "redirect:/sale/detail?product_idx="+idx;
	}	
	
	@RequestMapping(value = "/sale/wishPlus2", method = RequestMethod.GET)
	public String wishPlus2(@RequestParam int idx,HttpSession session) {//update isDelete = 0;
		String loginId = (String) session.getAttribute("loginId");
		int success = service.wishPlus2(idx,loginId);
		
		System.out.println("성공? "+success);
		
		return "redirect:/sale/detail?product_idx="+idx;
	}	
	
	@RequestMapping(value = "/sale/wishMinus", method = RequestMethod.GET)
	public String wishMinus(@RequestParam int idx,HttpSession session) {//update isDelete = 1;
		String loginId = (String) session.getAttribute("loginId");
		int success = service.wishMinus(idx,loginId);
		
		System.out.println("성공? "+success);
		
		return "redirect:/sale/detail?product_idx="+idx;
	}
	
	@RequestMapping(value = "/sale/chTradeStateForm", method = RequestMethod.GET)
	public String chTradeStateForm(Model model, @RequestParam int idx,HttpSession session) {
		model.addAttribute("idx", idx);
		return "/sale/chTradeStateForm";
	}
	
	@RequestMapping(value = "/sale/changeIng", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> changeIng(@RequestParam int idx,@RequestParam String id,@RequestParam String trade_type, HttpSession session) {
		logger.info("받아온 파라메터 값"+ idx + id + trade_type);
		String loginId = (String) session.getAttribute("loginId");
		
		return service.changeIng(idx, id, trade_type, loginId);
	}
	
	@RequestMapping(value = "/sale/enterMeetDate", method = RequestMethod.GET)
	public String enterMeetDate(@RequestParam int trade_idx, Model model) {
		logger.info("받아온 파라메터 값"+ trade_idx);
		model.addAttribute("trade_idx", trade_idx);
		return "/sale/enterMeetDate";
	}
	
	@RequestMapping(value = "/sale/packageAlarm", method = RequestMethod.GET)
	public String packageAlarm() {
		
		return "/sale/packageAlarm";
	}
	
	@RequestMapping(value = "/sale/setMeetDate", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> setMeetDate(@RequestParam int trade_idx, @RequestParam String meetDate) {
		logger.info("받아온 파라메터 값"+ trade_idx + meetDate);
		
		return service.setMeetDate(trade_idx, meetDate);
	}
	
	@RequestMapping(value = "/sale/tradeCancel", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> tradeCancel(@RequestParam int product_idx) {
		logger.info("받아온 파라메터 값"+ product_idx);
		
		return service.getBuyerId(product_idx);
	}
	
	@RequestMapping(value = "/sale/tradeCancelReason", method = RequestMethod.GET)
	public String tradeCancelReason(Model model, @RequestParam int product_idx) {
		int trade_idx = service.getTradeIdx(product_idx);
		
		model.addAttribute("product_idx", product_idx);
		model.addAttribute("trade_idx", trade_idx);
		return "/sale/tradeCancelReason";
	}
	
	@RequestMapping(value = "/sale/saveCancelReason", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> saveCancelReason(@RequestParam int product_idx, @RequestParam int trade_idx, @RequestParam String cancel_reason) {
		logger.info("받아온 파라메터 값"+ product_idx + trade_idx + cancel_reason);
		
		return service.saveCancelReason(product_idx, trade_idx, cancel_reason);
	}
	
	//거래완료로 변경 요청
	@RequestMapping(value = "/sale/tradeEnd", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> tradeEnd(@RequestParam int product_idx) {
		logger.info("받아온 파라메터 값"+ product_idx);
		
		return service.tradeEnd(product_idx);
	}
	
	@RequestMapping(value = "/sale/directBuyerEstimation", method = RequestMethod.GET)
	public String directBuyerEstimation(Model model, @RequestParam int product_idx, @RequestParam int trade_idx) {
		ArrayList<MannerQuestionDTO> dto = new ArrayList<MannerQuestionDTO>();
		
		dto = service.getMannerQuestion();
		model.addAttribute("dto", dto);
		model.addAttribute("product_idx", product_idx);
		model.addAttribute("trade_idx", trade_idx);
		return "/sale/directBuyerEstimation";
	}
	
	@RequestMapping(value = "/sale/saveDirectBuyerEstimation", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> saveDirectBuyerEstimation(@RequestParam int trade_idx, @RequestParam int point) {
		logger.info("받아온 파라메터 값"+ trade_idx + point);
		
		return service.saveDirectBuyerEstimation(trade_idx, point);
	}
}
