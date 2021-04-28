package com.market.rabbit.sale.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.market.rabbit.dto.SaleCategoryDTO;
import com.market.rabbit.dto.SaleDTO;
import com.market.rabbit.sale.dao.SaleDAO;

import net.bramp.ffmpeg.FFmpeg;
import net.bramp.ffmpeg.FFmpegExecutor;
import net.bramp.ffmpeg.FFprobe;
import net.bramp.ffmpeg.builder.FFmpegBuilder;

@Service
public class SaleService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SaleDAO dao;
	
	@Value("#{config['Globals.root']}") String root;
	
	public ArrayList<SaleCategoryDTO> getSaleCategory() {
		
		return dao.getSaleCategory();
	}

	@Transactional
	public HashMap<String, Object> fileUpload(MultipartFile[] sale_file, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, String> saleFileList = new HashMap<String, String>();
		HashMap<String, String> fileList = null;
		
		File dir = new File(root+"upload/");

		if(!dir.exists()) {
			logger.info("폴더 없음, 생성");
			dir.mkdir(); 
		}

		for (int i = 0; i < sale_file.length; i++) {
			MultipartFile file = sale_file[i];
			String oriFileName = file.getOriginalFilename();
			String fileExt = oriFileName.substring(oriFileName.lastIndexOf("."));
			String newFileName = System.currentTimeMillis()+""+i+fileExt;
			System.out.println(oriFileName + "=>" + newFileName);
			
			//5. 파일 저장
			try {
				byte[] bytes = file.getBytes();
				Path filePath = Paths.get(root+"upload/"+newFileName);
				Files.write(filePath, bytes);
				
				if(fileExt.equals(".mp4")) {
					newFileName = fileEncoding(newFileName,i);
				}
					
				saleFileList.put(newFileName, oriFileName);
				
				fileList = (HashMap<String, String>) session.getAttribute("fileList");
				fileList.put(newFileName, oriFileName);
				logger.info("현재 세션에 저장된 파일 수: " + fileList.size());
				
			}catch(Exception e) {
				e.printStackTrace();
				map.put("success",0);
				return map;
			}
		}
		session.setAttribute("fileList", fileList);
		map.put("saleFileList",saleFileList);
		map.put("success",1);
		return map;
	}

	public String fileEncoding(String encodingFileName, int i) {
		String encodingNewFileName = System.currentTimeMillis()+""+i+".mp4";
		try {
			FFmpeg ffmpeg = new FFmpeg("C:/Program Files/ffmpeg/bin/ffmpeg");
			FFprobe ffprobe = new FFprobe("C:/Program Files/ffmpeg/bin/ffprobe");

			FFmpegBuilder builder = new FFmpegBuilder()
			.setInput(root+"upload/"+encodingFileName)
	        .overrideOutputFiles(true)
	        .addOutput(root+"upload/"+encodingNewFileName) 
	        .setFormat("mp4") 
	        .setVideoCodec("h264") 
	        .setStrict(FFmpegBuilder.Strict.EXPERIMENTAL)
	        .done();

			FFmpegExecutor executor = new FFmpegExecutor(ffmpeg, ffprobe);
			executor.createJob(builder).run();
			
			File delFile = new File(root+"upload/"+encodingFileName);
			if(delFile.exists()) {
				delFile.delete();
			}else {
				logger.info("이미 삭제된 파일");
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return encodingNewFileName;
	}

	public HashMap<String, Object> delFile(String delFileName, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		File delFile = new File(root+"upload/"+delFileName);
		int success = 1;
		
		try {
			logger.info("delete file : "+ delFile);
			if(delFile.exists()) {
				delFile.delete();
			}else {
				logger.info("이미 삭제된 파일");
			}
			
			HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
			if(fileList.get(delFileName) !=null){ 
				fileList.remove(delFileName);
				logger.info("삭제후 남은 파일 수 : "+fileList.size());
			}
			session.setAttribute("fileList", fileList);
			
		}catch(Exception e){
			success = 0;
		}finally {
			map.put("success",success);
		}
		return map;
	}

	@Transactional
	public HashMap<String, Object> save(SaleDTO dto, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
		
		int success = 0;
		
		success = dao.save(dto);
		if(success>0) {
			success = 1;
			logger.info("idx : "+dto.getProduct_idx());
			
			try {
				for(String key : fileList.keySet()) {
					dao.saveFile(key,fileList.get(key),dto.getProduct_idx());
				}
			}catch(Exception e) {
				e.printStackTrace();
				success = 0;
				dao.transction(dto.getProduct_idx());
			}
			
		}else {
			for(String newFileName : fileList.keySet()) {
				File file = new File(root+"upload/"+ newFileName);
				file.delete();
			}
		}
		session.removeAttribute("fileList");
		map.put("success", success);
		
		if(success == 1) {
			String msg = dto.getKeyword()+"키워드의 판매글이"+dto.getSale_subject()+"의 제목으로 등록되었습니다.";
			ArrayList<String> list = selectKeywordAlarmMember(dto.getKeyword(), dto.getSeller_id());
			System.out.println(list);
			if( list != null) {
				for (int i = 0; i < list.size(); i++) {
					insertKeywordAlarm(list.get(i),msg);
				}
			}
		}
		
		return map;
	}
	
	public ArrayList<String> selectKeywordAlarmMember(String keyword, String seller_id) {
		
		return dao.selectKeywordAlarmMember(keyword, seller_id);
	}

	public void insertKeywordAlarm(String member_id, String msg) {
		dao.insertKeywordAlarm(member_id, msg);
	}

}
