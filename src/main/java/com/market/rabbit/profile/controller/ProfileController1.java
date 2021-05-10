package com.market.rabbit.profile.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.rabbit.dto.MannerQuestionDTO;
import com.market.rabbit.dto.MemberDTO;
import com.market.rabbit.dto.SaleDTO;
import com.market.rabbit.profile.service.ProfileService1;


@Controller
public class ProfileController1 {
		
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ProfileService1 service;
	
	//위시리스트
	//1. 리스트 불러오기
	@RequestMapping(value = "myPage/wishlist", method = RequestMethod.GET)
	public String wishlist(Model model) {
		logger.info("위시리스트 요청");
		service.wishlist(model);
		
		return "myPage/wishlist";
	}
//	@RequestMapping(value = "myPage/wishlist", method = RequestMethod.GET)
//	public ModelAndView wishlist(Model model, HttpSession session) {
//		logger.info("위시리스트 요청 : "+session);
//		
//		
//		return service.wishlist(session);
//	}
	
	//2. 리스트 삭제
	@RequestMapping(value = "myPage/wishdelete", method = RequestMethod.GET)
	public ModelAndView wishdelete(Model model, @RequestParam String wish_idx) {
		logger.info("위시리스트 삭제요청"+wish_idx);
		
		return service.wishdelete(wish_idx);
	}
	
	//3. 페이징 처리
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index() {
		
		logger.info("리스트 페이지 이동");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPage/wishlist");
		
		return mav;
	}
	
	//list / 보여줄갯수 / 페이지
	@RequestMapping(value = "myPage/wishlist/{pagePerCnt}/{page}", method = RequestMethod.GET)
	public HashMap<String, Object> list(@PathVariable int pagePerCnt, @PathVariable int page) {
		//@PathVariable 은 요청의 특정 부분을 변수에 담는다.
		logger.info("pagePerCnt : {}, page : {}", pagePerCnt, page);
		
		return service.wishlist(page,pagePerCnt);
	}

	
	//프로필불러오기(프로필사진, id, 주소, 차단여부, 매너지수)
	@RequestMapping(value = "myPage/profile", method = RequestMethod.GET)
	public ModelAndView profile(@RequestParam String member_id, HttpSession session) {

		logger.info("{} 프로필 요청",member_id);
		
		return service.profile(session, member_id);
	}
	//사용자 차단하기
	@RequestMapping(value = "myPage/blockMember", method = RequestMethod.GET)
	public ModelAndView blockMember(@RequestParam String member_id, HttpSession session, RedirectAttributes rAttr) {
		logger.info("{} 멤버 차단 요청", member_id);
		
		return service.blockMember(member_id, session, rAttr);
	}
	
	//사용자 차단해제하기
		@RequestMapping(value = "myPage/unblockMember", method = RequestMethod.GET)
		public ModelAndView unblockMember(@RequestParam String member_id, HttpSession session, RedirectAttributes rAttr) {
			logger.info("{} 멤버 차단 해제 요청", member_id);
			
			return service.unblockMember(member_id, session, rAttr);
		}
	
	@RequestMapping(value = "myPage/profileList/{member_id}/{page}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> callProfileList(@PathVariable String member_id, @PathVariable int page, HttpSession session) {
		
		logger.info("프로필의 판매목록 {} 페이지 리스트 요청", page);
		return service.callProfileList(member_id, page, session);
	}

	
	//판매내역리스트
	@RequestMapping(value = "myPage/salelist", method = RequestMethod.GET)
	public String salelist() {
		logger.info("판매내역 페이지 요청");
		return "myPage/salelist";
	}
	
	//판매내역리스트 페이징
	@RequestMapping(value = "/myPage/mysalelist/{pagePerCnt}/{page}/{code_num_str}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> mySaleList(@PathVariable int pagePerCnt, @PathVariable int page, @PathVariable String code_num_str, HttpSession session) {
		logger.info("관리자 리스트 요청 pagePerCnt: {}, page: {}",pagePerCnt,page);
		String code_num = "";
		if(code_num_str.equals("전체")) {
			code_num = "";
		} else if(code_num_str.equals("판매중")) {
			code_num = "3001";
		} else if(code_num_str.equals("거래중")) {
			code_num = "3002";
		} else if(code_num_str.equals("거래완료")) {
			code_num = "3003";
		}
		String member_id = (String) session.getAttribute("loginId");
		return service.mySaleList(page,pagePerCnt, member_id, code_num);
	}
	
	
	//거래상세보기
	@RequestMapping(value = "myPage/salelistdetail/{product_idx}", method = RequestMethod.GET)
	public ModelAndView salelistdetail(@PathVariable int product_idx) {
		logger.info("거래상세보기 요청");
		return service.salelistdetail(product_idx);
	}
	
	@RequestMapping(value = "myPage/buylistdetail/{product_idx}", method = RequestMethod.GET)
	public ModelAndView buylistdetail(@PathVariable int product_idx) {
		logger.info("거래상세보기 요청");
		return service.buylistdetail(product_idx);
	}
	
	//운송장번호 입력
	@RequestMapping(value = "myPage/tracking_number", method = RequestMethod.POST)
	public ModelAndView tracking_number(HttpSession session) {
		logger.info("운송장번호 입력 요청");
		
		return service.tracking_number(session);
	}
	
	/*매너질문 페이지 요청*/
	//구매자 평가 - 직거래 : sale에 있음.
	//구매자 평가 - 택배
	@RequestMapping(value = "/percelBuyerEstimation", method = RequestMethod.GET)
	public String directBuyerEstimation(Model model, @RequestParam int product_idx, @RequestParam int trade_idx) {
		ArrayList<MannerQuestionDTO> dto = new ArrayList<MannerQuestionDTO>();
		String trade_type = "택배";
		String target = "구매자";
		dto = service.getMannerQuestion(trade_type, target);
		model.addAttribute("dto", dto);
		model.addAttribute("product_idx", product_idx);
		model.addAttribute("trade_idx", trade_idx);
		return "sale/parcelBuyerEstimation";
	}
	//판매자 평가 - 택배
	@RequestMapping(value = "/percelSellerEstimation", method = RequestMethod.GET)
	public String percelSellerEstimation(Model model, @RequestParam int product_idx, @RequestParam int trade_idx) {
		ArrayList<MannerQuestionDTO> dto = new ArrayList<MannerQuestionDTO>();
		String trade_type = "택배";
		String target = "판매자";
		dto = service.getMannerQuestion(trade_type, target);
		model.addAttribute("dto", dto);
		model.addAttribute("product_idx", product_idx);
		model.addAttribute("trade_idx", trade_idx);
		return "sale/parcelSellerEstimation";
	}
	//판매자 평가 - 직거래
	@RequestMapping(value = "/directSellerEstimation", method = RequestMethod.GET)
	public String directSellerEstimation(Model model, @RequestParam int product_idx, @RequestParam int trade_idx) {
		ArrayList<MannerQuestionDTO> dto = new ArrayList<MannerQuestionDTO>();
		String trade_type = "택배";
		String target = "판매자";
		dto = service.getMannerQuestion(trade_type, target);
		model.addAttribute("dto", dto);
		model.addAttribute("product_idx", product_idx);
		model.addAttribute("trade_idx", trade_idx);
		return "sale/directSellerEstimation";
	}
	//판매자 평가 저장
	@RequestMapping(value = "/saveSellerEstimation", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> saveDirectBuyerEstimation(@RequestParam int trade_idx, @RequestParam int point) {
		logger.info("받아온 파라메터 값"+ trade_idx + point);
		return service.saveSellerEstimation(trade_idx, point);
	}
	
	//거래 후기창 띄우기
	@RequestMapping(value = "/openReviewWriteForm", method = RequestMethod.GET)
	public  ModelAndView openReviewWriteForm(@RequestParam int trade_idx) {
		logger.info("받아온 파라메터 값"+ trade_idx);
		return service.openReviewWriteForm(trade_idx);
	}
	
	//운송장번호입력창 띄우기
	@RequestMapping(value = "/openTrackingNumber", method = RequestMethod.GET)
	public  ModelAndView openTrackingNumber(@RequestParam int trade_idx) {
		ModelAndView mav = new ModelAndView();
		logger.info("받아온 파라메터 값"+ trade_idx);
		mav.addObject("trade_idx", trade_idx);
		mav.setViewName("myPage/tracking_number");
		return mav;
	}
	
	//운송장번호입력
	@RequestMapping(value = "/myPage/registTrackingNum", method = RequestMethod.GET)
	public  @ResponseBody HashMap<String, Object> registTrackingNum(@RequestParam int trade_idx, @RequestParam String package_company, @RequestParam String tracking_number) {
		logger.info("받아온 파라메터 값"+ trade_idx+"/"+package_company+"/"+tracking_number);
		return service.registTrackingNum(trade_idx, package_company, tracking_number);
	}
	
	
}
