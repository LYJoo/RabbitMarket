package com.market.rabbit.profile.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.rabbit.dto.AlarmDTO;
import com.market.rabbit.dto.BlockDTO;
import com.market.rabbit.dto.KeywordDTO;
import com.market.rabbit.dto.MemberDTO;
import com.market.rabbit.dto.ProfileFileDTO;
import com.market.rabbit.dto.QuestionDTO;
import com.market.rabbit.dto.ReportDTO;
import com.market.rabbit.dto.TradingDTO;
import com.market.rabbit.profile.dao.ProfileDAO2;

@Service
public class ProfileService2 {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ProfileDAO2 dao;
	@Value("#{config['Globals.root']}") String root;
	int numPerPage = 10;

	@Transactional
	public ModelAndView callMemberInfo(HttpSession session) {
		logger.info("회원정보 서비스 요청");
		ModelAndView mav = new ModelAndView();
		String page = "myPage/memberInfo";
		String loginId = (String) session.getAttribute("loginId");
		
		MemberDTO dto = dao.callMemberInfo(loginId);
		ProfileFileDTO profileDto = dao.callMemberProfile(loginId);
		
		mav.addObject("dto", dto);
		//mav.addObject("profileDto", profileDto);
		try {
			mav.addObject("path", "/myProfile/"+profileDto.getNewFileName());
		} catch (NullPointerException e) {
			mav.addObject("path", "/myProfile/default_profile.png");
		}
		mav.setViewName(page);
		return mav;
	}

	@Transactional
	public ModelAndView callInfoUpdateForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, String> profileName = new HashMap<String, String>();
		
		String page = "myPage/memberInfo_updateForm";
		//String loginId = (String) session.getAttribute("loginId");
		String loginId = (String) session.getAttribute("loginId");
		
		MemberDTO dto = dao.callMemberInfo(loginId);
		ProfileFileDTO profileDto = dao.callMemberProfile(loginId);
		profileName.put("oriFileName", profileDto.getOriFileName());
		profileName.put("newFileName", profileDto.getNewFileName());
		
		mav.addObject("dto", dto);
		mav.addObject("path", "/myProfile/" + profileDto.getNewFileName());
		mav.addObject("profileName1", profileName);
		mav.setViewName(page);

		return mav;
	}

	public ModelAndView profileUpload(MultipartFile profilefile) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, String> profileName = new HashMap<String, String>();
		//파일 업로드
		//1. 경로설정
		File dir = new File(root+"upload/");
		//2. 경로가 없으면 생성
		if(!dir.exists()) {
			logger.info("폴더 없음. 폴더 생성.");
			dir.mkdir();
		}
		//3. 파일명 추출
		String fileName = profilefile.getOriginalFilename();
		//4. 새파일명 생성(현재 시간을 밀리세컨드로 환산한 이름)
		String newFileName = System.currentTimeMillis()+fileName.substring(fileName.lastIndexOf("."));	//새 이름에 확장자 붙이기
		logger.info(fileName+"=>"+newFileName);
		profileName.put("oriFilename", fileName);
		profileName.put("newFileName", newFileName);
		//5. 파일 저장
		try {
			//java.nio 활용(java 7 부터 적용 가능)
			byte[] bytes = profilefile.getBytes();
			Path filePath = Paths.get(root+"upload/"+newFileName);
			Files.write(filePath, bytes);
			
			mav.addObject("path", "/myProfile/"+newFileName);
			mav.addObject("profileName2", profileName);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		mav.setViewName("myPage/profileUploadForm");
		return mav;
	}

	@Transactional
	public ModelAndView updateMemberInfo(HashMap<String, Object> dto) {
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/myPage/memberInfo";
		MemberDTO member = new MemberDTO();
		ProfileFileDTO profile = new ProfileFileDTO();
		String beforeUpdateOriFileName = dao.callOriFileName((String)dto.get("member_id"));
		
		try {
			member.setMember_id((String) dto.get("member_id"));
			member.setName((String) dto.get("name"));
			member.setBirth_date((String)dto.get("birth_date"));
			member.setPhone((String) dto.get("phone"));
			member.setEmail((String) dto.get("email"));
			member.setAddress((String) dto.get("address"));
			member.setLocation((String) dto.get("location"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		profile.setMember_id((String) dto.get("member_id"));
		profile.setOriFileName((String) dto.get("oriFileName"));
		profile.setNewFileName((String) dto.get("newFileName"));
		
		if(dao.updateProfile(profile) > 0) {
			logger.info("프로필 수정 성공");
		}
		if(dao.updateMember(member) > 0) {
			logger.info("회원정보 수정 성공");
		}
		
		//upload에서 원래 프로필 사진 삭제하기
		File delFile = new File(root+"upload/"+beforeUpdateOriFileName);
		try {
			logger.info("delete file : "+delFile);
			if(delFile.exists()) {
				delFile.delete();
			}else {
				logger.info("이미 삭제된 파일");
			}			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		mav.setViewName(page);
		return mav;
	}

	@Transactional
	public ModelAndView updateMemberPw(String currPw, String afterPw, RedirectAttributes rAttr, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/myPage/memberPwUpdateForm";
		String msg = "비밀번호 변경에 실패하였습니다.";
		String loginId = (String) session.getAttribute("loginId");
		if(dao.confirmPw(loginId, currPw) != null) {
			logger.info("비밀번호가 일치합니다. 비밀번호를 변경합니다.");
			dao.updatePw(loginId, afterPw);
			msg = "비밀번호 변경에 성공하였습니다.";
		}
		
		rAttr.addFlashAttribute("msg", msg);
		mav.setViewName(page);
		return mav;
	}

	public ModelAndView delMemberWithdraw(HttpSession session, String currPw, RedirectAttributes rAttr) {
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/myPage/memberInfo";
		String msg = "회원탈퇴에 실패하였습니다.";
		String loginId = (String) session.getAttribute("loginId");
		if(dao.confirmPw(loginId, currPw) != null) {
			logger.info("비밀번호가 일치합니다. 회원탈퇴합니다.");
			dao.delMemberWithdraw(loginId);
			page="redirect:/sale/main";
			msg = "회원탈퇴에 성공하였습니다.";
		}
		rAttr.addFlashAttribute("msg", msg);
		mav.setViewName(page);
		return mav;
	}

	public HashMap<String, Object> callAlarmList(int page, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int end = page*numPerPage;
		int start = end-(numPerPage-1);
		String loginId = (String) session.getAttribute("loginId");
		
		int allCnt = dao.countAlarmList(loginId);
		int range = allCnt%numPerPage > 0 ? Math.round(allCnt/numPerPage)+1 : allCnt/numPerPage;
		
		ArrayList<AlarmDTO> alarmList = dao.callAlarmList(loginId, start, end);
		
		map.put("range", range);
		map.put("currPage", page);
		map.put("alarmList", alarmList);
		return map;
	}

	public HashMap<String, Object> delAlarm(int alarm_idx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Boolean success = false;
		if(dao.delAlarm(alarm_idx) > 0) {
			logger.info("삭제완료");
			success = true;
		}
		
		map.put("success", success);
		return map;
	}

	public HashMap<String, Object> callBlockList(int page, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String loginId = (String) session.getAttribute("loginId");
		int end = page*numPerPage;
		int start = end-(numPerPage-1);
		
		int allCnt = dao.countBlockList(loginId);
		int range = allCnt%numPerPage > 0 ? Math.round(allCnt/numPerPage)+1 : allCnt/numPerPage;
		
		ArrayList<BlockDTO> blockList = dao.callBlockList(loginId, start, end);
		map.put("path", "/myProfile/");
		map.put("range", range);
		map.put("currPage", page);
		map.put("blockList", blockList);
		return map;
	}

	public HashMap<String, Object> delBlock(int block_idx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Boolean success = false;
		if(dao.delBlock(block_idx) > 0) {
			logger.info("삭제완료");
			success = true;
		}
		
		map.put("success", success);
		return map;
	}

	public HashMap<String, Object> callSaleReportList(int page, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int end = page*numPerPage;
		int start = end-(numPerPage-1);
		String loginId = (String) session.getAttribute("loginId");
		
		int allCnt = dao.countSaleReportList(loginId);
		int range = allCnt%numPerPage > 0 ? Math.round(allCnt/numPerPage)+1 : allCnt/numPerPage;
		
		ArrayList<ReportDTO> saleReportList = dao.callSaleReportList(loginId, start, end);
		
		map.put("range", range);
		map.put("currPage", page);
		map.put("saleReportList", saleReportList);
		return map;
	}

	public HashMap<String, Object> callCommentReportList(int page, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int end = page*numPerPage;
		int start = end-(numPerPage-1);
		String loginId = (String) session.getAttribute("loginId");
		
		int allCnt = dao.countCommentReportList(loginId);
		int range = allCnt%numPerPage > 0 ? Math.round(allCnt/numPerPage)+1 : allCnt/numPerPage;
		
		ArrayList<ReportDTO> commentReportList = dao.callCommentReportList(loginId, start, end);
		
		map.put("range", range);
		map.put("currPage", page);
		map.put("commentReportList", commentReportList);
		return map;
	}

	public HashMap<String, Object> callCocommentReportList(int page, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int end = page*numPerPage;
		int start = end-(numPerPage-1);
		String loginId = (String) session.getAttribute("loginId");
		
		int allCnt = dao.countCocommentReportList(loginId);
		int range = allCnt%numPerPage > 0 ? Math.round(allCnt/numPerPage)+1 : allCnt/numPerPage;
		
		ArrayList<ReportDTO> cocommentReportList = dao.callCocommentReportList(loginId, start, end);
		
		map.put("range", range);
		map.put("currPage", page);
		map.put("cocommentReportList", cocommentReportList);
		return map;
	}

	public HashMap<String, Object> callQuestionList(int page, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int end = page*numPerPage;
		int start = end-(numPerPage-1);
		String loginId = (String) session.getAttribute("loginId");
		
		int allCnt = dao.countQuestionList(loginId);	//전체 개수
		int range = allCnt%numPerPage > 0 ? Math.round(allCnt/numPerPage)+1 : allCnt/numPerPage;
		
		ArrayList<QuestionDTO> questionList = dao.callQuestionList(loginId, start, end);
		
		map.put("range", range);
		map.put("currPage", page);
		map.put("questionList", questionList);
		return map;
	}

	public HashMap<String, Object> callKeywords(HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String loginId = (String) session.getAttribute("loginId");
		
		ArrayList<KeywordDTO> keywords = dao.callKeywords(loginId);
		
		map.put("keywords", keywords);
		return map;
	}

	public HashMap<String, Object> delKeyword(int keyword_idx, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String loginId = (String) session.getAttribute("loginId");
		boolean success = false;
		
		if(dao.delKeyword(loginId, keyword_idx) > 0) {
			success = true;
		}
		
		map.put("success", success);
		return map;
	}

	public HashMap<String, Object> writeKeyword(String keyword, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String loginId = (String) session.getAttribute("loginId");
		boolean success = false;
		
		if(dao.writeKeyword(loginId, keyword) > 0) {
			success = true;
		}
		
		map.put("success", success);
		
		return map;
	}

	public HashMap<String, Object> callMyBuyList(String selectedState, int page, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int end = page*numPerPage;
		int start = end-(numPerPage-1);
		String loginId = (String) session.getAttribute("loginId");
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("loginId", loginId);
		params.put("selectedState", selectedState);
		int allCnt = dao.countMyBuyList(params);	//전체 개수
		System.out.println(selectedState+" 의 전체 개수 : "+allCnt);
		int range = (int) (allCnt%numPerPage > 0 ? Math.floor(allCnt/numPerPage)+1 : allCnt/numPerPage);
		
		HashMap<String, Object> listParams = new HashMap<String, Object>();
		listParams.put("loginId", loginId);
		listParams.put("selectedState", selectedState);
		listParams.put("start", start);
		listParams.put("end", end);
		ArrayList<TradingDTO> myBuyList = dao.callMyBuyList(listParams);
		
		map.put("range", range);
		map.put("currPage", page);
		map.put("myBuyList", myBuyList);
		return map;
	}
	

	
}












