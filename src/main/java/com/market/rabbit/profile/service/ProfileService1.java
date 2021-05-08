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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.rabbit.dto.MannerQuestionDTO;
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
		String loginId = (String) session.getAttribute("loginId");
		
		Boolean isBlocking = false;	//디폴트는 차단 안함 
		if(!loginId.equals(member_id)) {	//내 프로필이 아니라면
			//내가 이 member_id를 차단했는지의 여부를 판단
			if(dao.confirmMyBlocking(loginId, member_id) > 0) {	//내 차단함에 해당 사용자가 있으면
				isBlocking = true;
			}
		}
		
		MemberDTO member = dao.profile(member_id);
		ProfileFileDTO profile = dao.fileList(member_id);
		
		mav.addObject("isBlocking", isBlocking);
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
	public HashMap<String, Object> mySaleList(int page, int pagePerCnt, String member_id, String code_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//pagePerCnt 의 기준으로 몇페이지나 만들수 있는가?
		int allCnt = dao.allCountMySaleList(member_id, code_num);//전체 수
		//게시글 수 : 21개, 페이지당 보여줄 수 : 5 = 최대 생성 가능한 페이지 : 5
		int range = allCnt%pagePerCnt > 0? Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);
		//생성 가능한 페이지 보다 현재페이지가 클 경우... 현재페이지를 생성 가능한 페이지로 맞춰준다.
		page=page>range? range: page;
		//시작, 끝
		int end = page*pagePerCnt;
		int start = end - pagePerCnt+1;
		if(allCnt ==0) {
			end=0;
			start=0;
		}
		ArrayList<SaleDTO> list = dao.mySaleList(member_id, code_num, start,end);

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
		logger.info("운송장번호 여부: "+tradeInfo.getTracking_number());
		
		mav.addObject("saleInfo", saleInfo);
		mav.addObject("saleFile", saleFirstPhoto);
		mav.addObject("tradeInfo", tradeInfo);
		mav.setViewName(page);
		return mav;
	}
	
	@Transactional
	public ModelAndView buylistdetail(int product_idx) {
		ModelAndView mav = new ModelAndView();
		String page = "myPage/buyListDetail";
		
		//판매글에 해당하는 가장 최근 거래 idx 가져오기
		int trade_idx = dao.findTradeIdxThisProduct(product_idx);
		SaleDTO saleInfo = dao.findSaleInfoThis(product_idx);//판매글정보
		SaleFileDTO saleFirstPhoto = dao.findSaleFileFirstThis(product_idx);//첫번째 파일
		TradingDTO tradeInfo = dao.findTradeInfoThis(trade_idx);//거래정보
		logger.info("운송장번호 여부: "+tradeInfo.getTracking_number());
		
		mav.addObject("saleInfo", saleInfo);
		mav.addObject("saleFile", saleFirstPhoto);
		mav.addObject("tradeInfo", tradeInfo);
		mav.setViewName(page);
		return mav;
	}
	
	

	public ModelAndView tracking_number(HttpSession session) {
		
		return null;
	}

	public ModelAndView blockMember(String member_id, HttpSession session, RedirectAttributes rAttr) {
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/myPage/profile?member_id="+member_id;
		String msg = "해당 멤버 차단에 실패하였습니다.";
		String loginId = (String) session.getAttribute("loginId");
		
		if(dao.blockMember(loginId, member_id) > 0) {
			msg = "해당 멤버 차단에 성공하였습니다.";
		}
		rAttr.addFlashAttribute("msg", msg);
		mav.setViewName(page);
		return mav;
	}

	public ModelAndView unblockMember(String member_id, HttpSession session, RedirectAttributes rAttr) {
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/myPage/profile?member_id="+member_id;
		String msg = "해당 멤버 차단해제에 실패하였습니다.";
		String loginId = (String) session.getAttribute("loginId");
		
		if(dao.unblockMember(loginId, member_id) > 0) {
			msg = "해당 멤버 차단해제에 성공하였습니다.";
		}
		rAttr.addFlashAttribute("msg", msg);
		mav.setViewName(page);
		return mav;
	}

	public ArrayList<MannerQuestionDTO> getMannerQuestion(String target, String trade_type) {
		return dao.getMannerQuestion(target, trade_type);
	}

	public HashMap<String, Object> saveSellerEstimation(int trade_idx, int point) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int check1 = 0;
		int check2 = 0;
		int success = 0;
		//거래 테이블 셋팅
		check1 = dao.setTrading(trade_idx);
		
		//해당 거래한 판매자 멤버테이블 셋팅
		String seller_id = dao.getMannerSellerId(trade_idx);
		check2 = dao.setMemberManner(seller_id, point);
		
		//5회 이상의 거래면 매너 퍼센트 셋팅해놓기
		int manner_cnt = dao.setMemberMannerCnt(seller_id);
		if(manner_cnt>=5) {
			int mannerScore = dao.getmannerScore(seller_id);
			System.out.println("매너 점수"+mannerScore);
			System.out.println("매너 횟수 "+manner_cnt);
			double mannerPercent = ((double)mannerScore/((double)manner_cnt*5))*100;//5->count
			System.out.println("매너 퍼센트 "+mannerPercent);
			dao.setMannerPercent(seller_id, mannerPercent);
		}
		
		if(check1 == 1 && check2 == 1) {
			success = 1;
		}
		map.put("success", success);
		return map;
	}
	
	//후기창띄우기
	public ModelAndView openReviewWriteForm(int trade_idx) {
		ModelAndView mav = new ModelAndView();
		String seller_id = dao.getMannerSellerId(trade_idx);
		String buyer_id = dao.getMannerBuyerId(trade_idx);
		
		mav.addObject("seller_id", seller_id);
		mav.addObject("buyer_id", buyer_id);
		mav.setViewName("sale/reviewWriteForm");
		return mav;
	}






}
