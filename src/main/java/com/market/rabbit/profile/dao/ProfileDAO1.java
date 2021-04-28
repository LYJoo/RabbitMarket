package com.market.rabbit.profile.dao;

import java.util.ArrayList;

import com.market.rabbit.dto.MemberDTO;
import com.market.rabbit.dto.ProfileFileDTO;
import com.market.rabbit.dto.WishDTO;

public interface ProfileDAO1 {

	ArrayList<WishDTO> wishlist();

	int wishdelete(String wish_idx);

	int allCount();

	ArrayList<WishDTO> wishlist(int start, int end);

	MemberDTO profile(String member_id);

	ArrayList<ProfileFileDTO> fileList(String member_id);

}
