package com.market.rabbit.admin.dao;

import java.util.ArrayList;

import com.market.rabbit.dto.MannerQuestionDTO;

public interface MannerMgtDAO {

	ArrayList<MannerQuestionDTO> mannerQList(MannerQuestionDTO dto);

	int countMannerQ(MannerQuestionDTO dto);

	int writeMannerQ(MannerQuestionDTO dto);

	int updateMannerQ(MannerQuestionDTO dto);

	int delMannerQ(int manner_idx);

}
