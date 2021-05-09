package com.market.rabbit.member.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.rabbit.dto.MemberDTO;
import com.market.rabbit.member.dao.MemberDAO;


@Service
public class MemberService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberDAO dao;
	ModelAndView mav = new ModelAndView();
	String page = "";
	String msg = "";
	BCryptPasswordEncoder en = new BCryptPasswordEncoder();
	MemberDTO dto = new MemberDTO();
	
	public int join(MemberDTO dto) {
		
		return dao.join(dto);
	}


	public HashMap<String, Object> overlay(String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int use = dao.overlay(id);
		map.put("use",use);
		return map;
	}

	public HashMap<String, Object> emoverlay(String email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int use2 = dao.emoverlay(email);
		map.put("use2",use2);
		return map;
	}

	public ModelAndView login(HashMap<String, String> params, RedirectAttributes rAttr, HttpSession session) {
		logger.info("로그인 서비스 요청");
		String mode = params.get("mode");
		String loginPw = params.get("LoginPw");
		String loginId = params.get("LoginId");
		logger.info(loginId+"/"+loginPw);
		
		//일반인 모드로 온다면
		
		if(params.get("mode").equals("member")) {
			logger.info("일반인 모드");
		
		String hash = dao.logpw(loginPw,loginId); //이게 member로 가고 있음
		boolean suc = en.matches(loginPw, hash);//비교
		
		logger.info("입력전 패스워드 :"+loginPw);	
		logger.info("db에 패스워드 :"+hash);	
		logger.info("입력후 패스워드 :"+suc);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("login_id", loginId);
		map.put("pw", hash);
		//suc이 참이면 map에 로그인 정보들을 넣고 아니면 말아라
		 if(suc && dao.login(map) > 0 ) {
		logger.info("map"+map);
		page="redirect:/sale/main";
		session.setAttribute("loginId", params.get("LoginId"));
		logger.info("로그인 성공");
		}else {
				page="redirect:/member/memberLogin";
				msg = "아이디와 패스워드를 확인해 주세요.";
			}
			
		 //그게 아니라 관리자 모드로 온다면
		}else {
				logger.info("관리자 모드 돌입");
				String hash2 = dao.logadminpw(loginPw,loginId); //이게 member로 가고 있음
				boolean suc2 = en.matches(loginPw, hash2);//비교
				
				logger.info("입력전 패스워드 :"+loginPw);	
				logger.info("db에 패스워드 :"+hash2);	
				logger.info("입력후 패스워드 :"+suc2);
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("login_id", loginId);
				map.put("pw", hash2);
				//비밀번호 비교 후 참이라면
				 if(suc2 && dao.admin(map) > 0) {
					logger.info("map"+map); //관리자 아이디와 비번을 map에 넣고
						 //mapper로 이동시켜 비교
					logger.info("관리자 모드");
					page ="redirect:/sale/main";
				
				session.setAttribute("adminId", params.get("LoginId"));
			}else {
				page="redirect:/member/memberLogin";
				msg = "관리자 아이디와 패스워드를 다시 확인해주세요";
			}
		
				 }		 
		rAttr.addFlashAttribute("login_msg", msg);		
		mav.setViewName(page);	
		return mav;
	}


	public ModelAndView findId(String name, String email, RedirectAttributes rAttr) {
		
		String findid = dao.findId(name,email);
		logger.info(findid);
		
		if(findid != null) {
			msg = "아이디는 "+findid+" 입니다";
		}else {
			msg = "일치하는 회원정보가 없습니다.";
		}
	
		rAttr.addFlashAttribute("findid2", msg);
		mav.setViewName("redirect:/member/memberId");
		return mav;
	}


	public ModelAndView findPw(HttpSession session,HashMap<String, String> params, RedirectAttributes rAttr) {
		
		int findpw = dao.findPw(params);
		
			msg ="일치하는 회원정보가 없습니다.";
			page="redirect:/member/memberPw";
		if(findpw > 0) {
			page = "member/memberPwReset";
			String msg2 ="비밀번호를 재설정해주세요";
			mav.addObject("findpw_checkt", msg2);
		}
		
		logger.info( params.get("member_id"));
		session.setAttribute("findid", params.get("member_id"));
		rAttr.addFlashAttribute("findpw_checkf", msg);
		mav.setViewName(page);
		return mav;
	}


	public ModelAndView resetPw(HashMap<String, String> params, RedirectAttributes rAttr) {
		
		String pw2 = params.get("pw2");
		String id = params.get("member_id");
		String pw = en.encode(pw2);
		logger.info(pw+"/"+id);
		dto.setPw(pw);
		int resetpw = dao.resetPw(pw,id);
		
		msg="비밀번호 재설정에 실패했습니다";
		page="redirect:/member/memberPwReset";
		if(resetpw > 0) {
			msg="비밀번호를 재설정 했습니다. 로그인 페이지로 이동합니다.";
			page = "member/MemberLogin";
		}
		rAttr.addFlashAttribute("resetpw_check", msg);
		mav.setViewName(page);
		return mav;
		
	}






	
}
