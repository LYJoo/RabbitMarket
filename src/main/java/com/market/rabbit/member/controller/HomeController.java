package com.market.rabbit.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.rabbit.dto.MemberDTO;
import com.market.rabbit.member.dao.MemberDAO;
import com.market.rabbit.member.service.MemberService;


@Controller
public class HomeController {

	String plain ="";
	String hash ="";
	BCryptPasswordEncoder en = new BCryptPasswordEncoder();
	MemberDTO dto2 = new MemberDTO();
	
	@Autowired MemberService service;
	@Autowired MemberDAO dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(value = "/member/memberLogin",  method = RequestMethod.GET)
	public String memberLogin( Model model) {

		return "member/MemberLogin";
	}
	
	
	@RequestMapping(value = "/member/overlay",  method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> overlay( Model model, @RequestParam String id) {
		logger.info("고객이 입력한 아이디 : "+id);
		 return service.overlay(id);
	}
	
	
	@RequestMapping(value = "/member/emoverlay",  method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> emoverlay( Model model, @RequestParam String email) {
		logger.info("고객이 입력한 이메일 : "+email);
		return service.emoverlay(email);
	}
	
	@RequestMapping(value = "/member/join", method = RequestMethod.POST)
	public String join(Model model, @ModelAttribute MemberDTO dto
			,@RequestParam String pw) {
		logger.info("회원 정보 입력 값 = "+dto.getAddress());
		logger.info("회원가입 페이지");
	
		plain = pw;
		logger.info("평문"+plain);

		hash = en.encode(plain); //암호화`
		logger.info("암호문"+hash);
		dto.setPw(hash);
		logger.info("회원 정보 입력 값 = "+dto.getPw());
		

		String msg = "회원 가입에 실패했습니다. 잠시 후 다시 시도해주세요";
		String page = "redirect:/member/MemberLogin";
		if(service.join(dto) > 0) {
			msg = "회원 가입 성공";
			page = "member/MemberLogin";
			dao.insertDefaultProfile(dto.getMember_id());
		}
		
		model.addAttribute("regist_msg", msg);
		
		return page;
}
	
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public ModelAndView login(Model model,@RequestParam HashMap<String, String> params,
			 RedirectAttributes rAttr,HttpSession session) {
		logger.info("login : "+params);	
		
		return service.login(params, rAttr,session);
	}
	
	// 로그아웃 하는 부분
    @RequestMapping(value="/member/logout")
    public String logout(HttpSession session) {
    	session.invalidate(); //세션 전부 날림
        return "redirect:/sale/main"; // 로그아웃 후 로그인화면으로 이동
    }
    
    //아이디 찾기
    @RequestMapping(value = "/member/findId",  method = RequestMethod.POST)
	public ModelAndView findId(@RequestParam String email, String name, RedirectAttributes rAttr) {
		logger.info("고객이 입력한 이름과 이메일 :"+name+"/"+email);
		return service.findId(name,email,rAttr);
	}
    
    //비밀번호 찾기
    @RequestMapping(value = "/member/findPw",  method = RequestMethod.POST)
    public ModelAndView findPw(HttpSession session, @RequestParam HashMap<String, String> params, RedirectAttributes rAttr) {
    	logger.info("고객이 입력한 이름과 이메일 {}"+params);
    	return service.findPw(session, params,rAttr);
    }
    
    //비밀번호 재설
    @RequestMapping(value = "/member/resetPw",  method = RequestMethod.POST)
    public ModelAndView resetPw(@RequestParam HashMap<String, String> params, RedirectAttributes rAttr) {
    	logger.info("고객이 입력한 비밀번호 {}"+params);
    	return service.resetPw(params,rAttr);
    }
    
	@RequestMapping(value = "/member/memberRegist", method = RequestMethod.GET)
	public String MemberRegist( Model model) {
		
		return "member/memberSignUp";
	}
	
	@RequestMapping(value = "/member/memberId", method = RequestMethod.GET)
	public String MemberId( Model model) {
		
		return "member/memberId";
	}
	
	@RequestMapping(value = "/member/memberPw", method = RequestMethod.GET)
	public String MemberPw( Model model) {
		
		return "member/memberPw";
	}
	
	
}
