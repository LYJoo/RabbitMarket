package com.market.rabbit.profile.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.market.rabbit.dto.MemberDTO;
import com.market.rabbit.dto.NoticeDTO;
import com.market.rabbit.dto.ProfileFileDTO;
import com.market.rabbit.dto.ReviewDTO;
import com.market.rabbit.dto.SaleDTO;
import com.market.rabbit.dto.SaleFileDTO;
import com.market.rabbit.dto.TradingDTO;
import com.market.rabbit.dto.WishDTO;
import com.market.rabbit.profile.dao.ProfileDAO1;

@Service
public class ProfileService1 {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ProfileDAO1 dao;
	int numPerPage = 10;

	public void wishlist(Model model) {
		logger.info("위시리스트 보이기 처리");
		ArrayList<WishDTO> wishlist = dao.wishlist();
		
		model.addAttribute("wishlist", wishlist);
	}
//	@Transactional
//	public ModelAndView wishlist(HttpSession session) {
//		logger.info("위시리스트 요청");
//		ModelAndView mav = new ModelAndView();
//		String page = "myPage/wishlist";
//		String loginId="";
//		
//		SaleDTO sale = dao.sale(loginId);
//		SaleFileDTO salefile = dao.salefile(loginId);
//		
//		mav.addObject("sale", sale);
//		mav.addObject("salefile", salefile);
//		mav.setViewName(page);
//		return mav;
//	}

	public ModelAndView wishdelete(String wish_idx) {
		ModelAndView mav = new ModelAndView();
		logger.info("위시리스트 삭제 요청");
		int success = dao.wishdelete(wish_idx);
		String page="redirect:/";
		if(success>0) {
			page="redirect:/";
		}
		mav.setViewName(page);
		
		return mav;
	}
	
	public HashMap<String, Object> wishlist(int page, int pagePerCnt) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//pagePerCnt 의 기준이로 몇페이지나 만들수 있는가?
		//map.put("totalCnt", dao.allCount());
		int allCnt = dao.allCount();//전체 게시글
		//예를들어 게시글수 : 21개, 페이지당 보여줄 수 : 5개 = 최대 생성 가능한 페이지 : 5페이지
		//예 : 21/5 = 4.02 이면 소숫점을 버리고 1을 더해 5가 된다. 아니면 있는 그대로...
		int range = allCnt%pagePerCnt>0 ? Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);

		
		//생성 가능한 페이지보다 현재페이지가 클 경우
		page = page>range ? range : page;//페이지가 레인지보다크면 페이지가 레인지가되는거고 아니면 페이지 그대로 사용해라 
														 //(시작,끝 아래에 적용하면 페이지바뀌는것만되고 해당페이지 데이터가 안나옴)
		
		
		//시작, 끝
		int end = page * pagePerCnt;
		int start = end - pagePerCnt+1;
		map.put("list", dao.wishlist(start,end));
		
		
		map.put("range", range);
		map.put("currPage", page);
		
		return map;
	}

	@Transactional
	public ModelAndView profile(HttpSession session, String member_id) {
		logger.info("회원프로필 요청");
		ModelAndView mav = new ModelAndView();
		String page = "myPage/profile";
		
		MemberDTO member = dao.profile(member_id);
		ProfileFileDTO profile = dao.fileList(member_id);
		
		mav.addObject("member", member);
		//mav.addObject("profile", profile);
		mav.addObject("path", "/myProfile/"+profile.getNewFileName());
		mav.setViewName(page);
		return mav;
	}

	@Transactional
	public HashMap<String, Object> callProfileList(String member_id, int page, HttpSession session) {
		logger.info("프로필에 띄울 판매목록, 후기목록 불러오기");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int end = page*3;
		int start = end-(3-1);
		
		int allCntSale = dao.countAllSale(member_id);
		int allCntReview = dao.countAllReview(member_id);
		int rangeSale = allCntSale%3 > 0 ? Math.round(allCntSale/3)+1 : allCntSale/3;
		int rangeReview = allCntReview%3 > 0 ? Math.round(allCntReview/3)+1 : allCntReview/3;
		
		
		//판매리스트(+사진)
		ArrayList<SaleDTO> profileSaleList = dao.callProfileSaleList(member_id, start, end);
		map.put("profileSaleList", profileSaleList);
		map.put("rangeSale", rangeSale);
		//후기리스트
		ArrayList<ReviewDTO> profileReviewList = dao.callProfileReviewList(member_id, start, end);
		map.put("profileReviewList", profileReviewList);
		map.put("rangeReview", rangeReview);
		
		map.put("currPage", page);
		
		return map;
	}
	
	//판매내역 리스트
	@Transactional
	public HashMap<String, Object> mySaleList(int page, int pagePerCnt, String member_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//pagePerCnt 의 기준으로 몇페이지나 만들수 있는가?
		int allCnt = dao.allCountMySaleList(member_id);//전체 수
		//게시글 수 : 21개, 페이지당 보여줄 수 : 5 = 최대 생성 가능한 페이지 : 5
		int range = allCnt%pagePerCnt > 0? Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);
		//생성 가능한 페이지 보다 현재페이지가 클 경우... 현재페이지를 생성 가능한 페이지로 맞춰준다.
		page=page>range? range: page;
		//시작, 끝
		int end = page*pagePerCnt;
		int start = end - pagePerCnt+1;
		ArrayList<SaleDTO> list = dao.mySaleList(member_id, start,end);

		map.put("list", list);
		map.put("range", range);
		map.put("currPage", page);
		return map;
	}
	

	@Transactional
	public ModelAndView salelistdetail(int product_idx) {
		ModelAndView mav = new ModelAndView();
		String page = "myPage/salelistdetail";
		
		//판매글에 해당하는 가장 최근 거래 idx 가져오기
		int trade_idx = dao.findTradeIdxThisProduct(product_idx);
		SaleDTO saleInfo = dao.findSaleInfoThis(product_idx);//판매글정보
		SaleFileDTO saleFirstPhoto = dao.findSaleFileFirstThis(product_idx);//첫번째 파일
		TradingDTO tradeInfo = dao.findTradeInfoThis(trade_idx);//거래정보
		
		mav.addObject("saleInfo", saleInfo);
		mav.addObject("saleFile", saleFirstPhoto);
		mav.addObject("tradeInfo", tradeInfo);
		mav.setViewName(page);
		return mav;
	}

	public ModelAndView tracking_number(HttpSession session) {
		
		return null;
	}






}
