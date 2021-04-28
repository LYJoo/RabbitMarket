package com.market.rabbit.profile.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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

import com.market.rabbit.dto.MemberDTO;
import com.market.rabbit.dto.ProfileFileDTO;
import com.market.rabbit.profile.dao.ProfileDAO2;

@Service
public class ProfileService2 {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ProfileDAO2 dao;
	@Value("#{config['Globals.root']}") String root;

	@Transactional
	public ModelAndView callMemberInfo(HttpSession session) {
		logger.info("회원정보 서비스 요청");
		ModelAndView mav = new ModelAndView();
		String page = "myPage/memberInfo";
		//String loginId = (String) session.getAttribute("loginId");
		String loginId = "hwi";
		
		MemberDTO dto = dao.callMemberInfo(loginId);
		ProfileFileDTO profileDto = dao.callMemberProfile(loginId);
		logger.info("profile : "+profileDto.getOriFileName());
		
		mav.addObject("dto", dto);
		//mav.addObject("profileDto", profileDto);
		mav.addObject("path", "/myProfile/"+profileDto.getNewFileName());
		mav.setViewName(page);
		return mav;
	}

	@Transactional
	public ModelAndView callInfoUpdateForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, String> profileName = new HashMap<String, String>();
		
		String page = "myPage/memberInfo_updateForm";
		//String loginId = (String) session.getAttribute("loginId");
		String loginId = "hwi";
		
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
	public ModelAndView updateMemberPw(String currPw, String afterPw, RedirectAttributes rAttr) {
		ModelAndView mav = new ModelAndView();
		String page = "redirect:/myPage/memberPwUpdateForm";
		String msg = "비밀번호 변경에 실패하였습니다.";
		String loginId = "hwi";
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
		String loginId = "hwi";
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
	

	
}
