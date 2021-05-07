package com.market.rabbit.profile.dao;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.market.rabbit.dto.MemberDTO;
import com.market.rabbit.dto.ProfileFileDTO;
import com.market.rabbit.dto.ReviewDTO;
import com.market.rabbit.dto.SaleDTO;
import com.market.rabbit.dto.SaleFileDTO;
import com.market.rabbit.dto.TradingDTO;
import com.market.rabbit.dto.WishDTO;

public interface ProfileDAO1 {

	ArrayList<WishDTO> wishlist();

//	SaleDTO sale(String loginId);
//	
//	SaleFileDTO salefile(String loginId);

	int wishdelete(String wish_idx);

	int allCount();

	ArrayList<WishDTO> wishlist(int start, int end);

	MemberDTO profile(String loginId);

	ProfileFileDTO fileList(String loginId);

	ReviewDTO review(String loginId);

	SaleDTO sale(String loginId);

	SaleFileDTO salefile(String loginId);

	SaleDTO mysale(String loginId);

	SaleFileDTO salelistFile(String loginId);

	SaleDTO salelistlist(String loginId);

	SaleDTO saledetail(String loginId);

	TradingDTO tradedetail(String loginId);


}
