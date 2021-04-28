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
	public ModelAndView callInfoUpdate(HashMap<String, Object> dto) {
		ModelAndView mav = new ModelAndView();
		String page = "myPage/profileUploadForm";
		MemberDTO member = new MemberDTO();
		ProfileFileDTO profile = new ProfileFileDTO();
		
		try {
			member.setMember_id((String) dto.get("member_id"));
			member.setName((String) dto.get("name"));
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			member.setBirth_date(transFormat.parse((String) dto.get("birth_date")));
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
		
		
		mav.setViewName(page);
		return mav;
	}
	

	
}
