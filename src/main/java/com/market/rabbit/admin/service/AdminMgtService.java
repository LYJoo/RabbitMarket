package com.market.rabbit.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.market.rabbit.admin.dao.AdminMgtDAO;
import com.market.rabbit.dto.AdminDTO;
import com.market.rabbit.dto.NoticeDTO;

@Service
public class AdminMgtService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminMgtDAO dao;
	
	//리스트
	public HashMap<String, Object> adminList(int page, int pagePerCnt) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//pagePerCnt 의 기준으로 몇페이지나 만들수 있는가?
		int allCnt = dao.allCountAdmin();//전체 관리자 수
		//게시글 수 : 21개, 페이지당 보여줄 수 : 5 = 최대 생성 가능한 페이지 : 5
		int range = allCnt%pagePerCnt > 0? Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);
		//생성 가능한 페이지 보다 현재페이지가 클 경우... 현재페이지를 생성 가능한 페이지로 맞춰준다.
		page=page>range? range: page;
		//시작, 끝
		int end = page*pagePerCnt;
		int start = end - pagePerCnt+1;
		ArrayList<NoticeDTO> list = dao.adminList(start,end);	

		map.put("list", list);
		map.put("range", range);
		map.put("currPage", page);
		return map;
	}

	//등록
	public String joinAdmin(AdminDTO dto) {
		String msg = "";
		
		/*아이디 중복 검사*/
		String new_id = dto.getAdmin_id();//받은 id
		String find_id="";
		find_id = dao.findAdmin(new_id);//있는지?
		logger.info(find_id);
		if(find_id != null) {//존재한다면
			msg = find_id+" 는 이미 존재하는 아이디 입니다.";
		} else {
			/*비밀번호 암호화*/
			String pw_plain = dto.getAdmin_pw();//받은 pw
			logger.info("pw plain :" +pw_plain);
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String pw_hash = encoder.encode(pw_plain);//암호화
			logger.info("pw hash :" +pw_hash);
			dto.setAdmin_pw(pw_hash);//암호키로 대체
			
			int success = dao.joinAdmin(dto);
			logger.info("등록 성공 : "+ success);
		}		
		
		return msg;
	}
	
	//상세
	public AdminDTO detailAdmin(String admin_id) {
		return dao.detailAdmin(admin_id);
	}

	//수정
	public int updateAdmin(AdminDTO dto) {
		/*비밀번호 암호화*/
		String pw_plain = dto.getAdmin_pw();//받은 pw
		logger.info("pw plain :" +pw_plain);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String pw_hash = encoder.encode(pw_plain);//암호화
		logger.info("pw hash :" +pw_hash);
		dto.setAdmin_pw(pw_hash);//암호키로 대체
		
		return dao.updateAdmin(dto);
	}
	
	//삭제
	public int delAdmin(String admin_id) {
		return dao.delAdmin(admin_id);
	}
	
	
	

}
