package com.market.rabbit.admin.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.rabbit.admin.dao.MannerMgtDAO;
import com.market.rabbit.dto.MannerQuestionDTO;

@Service
public class MannerMgtService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MannerMgtDAO dao;
	
	//리스트
	public ArrayList<MannerQuestionDTO> mannerQList(MannerQuestionDTO dto) {
		return dao.mannerQList(dto);
	}
	
	//등록
	public int countMannerQ(MannerQuestionDTO dto) {
		return dao.countMannerQ(dto);
	}

	public int writeMannerQ(MannerQuestionDTO dto) {
		return dao.writeMannerQ(dto);
	}
	
	//수정
	public int updateMannerQ(MannerQuestionDTO dto) {
		return dao.updateMannerQ(dto);
	}
	
	//삭제
	public int delMannerQ(int manner_idx) {
		return dao.delMannerQ(manner_idx);
	}
	
	
	
	
	
	
	

}
