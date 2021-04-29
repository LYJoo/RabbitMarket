package com.market.rabbit.help.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HelpController {
	//고객센터 컨트롤러 : 일반회원 모두가 접근 가능.
	/* 본 컨트롤러 작성 시 안내 및 주의사항
	 	사용할 서비스 : HelpService
	 	관리자와 같이 사용 중인 기능 및 method명 :
	 		- 공지사항 : ~리스트 noticeList, ~상세보기 detailNotice 
	 		- 자주묻는질문 : ~리스트 faqList, ~상세보기 detailFaq
	 		- 1:1문의 : ~리스트 QList, ~상세보기 detailQ
	 		*리스트는 페이징처리가 된 값을 보내주게 처리 되어 있음.
	 		
	 	위 기능들은 서비스에서는 값만 보내 주게끔 되어 있으므로, 
	 	확인 후 고객센터에 맞는 !페이지! 분기 및 기타 작업들을 본 컨트롤러에서 해 줄 것.
	 */
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/help", method = RequestMethod.GET)
	public String home(Model model) {
		return "help";
	}
	
}
