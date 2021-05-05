package com.market.rabbit.sale.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.market.rabbit.dto.CoCommentDTO;
import com.market.rabbit.dto.CommentsDTO;
import com.market.rabbit.dto.SaleCategoryDTO;
import com.market.rabbit.dto.SaleDTO;
import com.market.rabbit.dto.SaleFileDTO;
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
	
	static final int SEC = 60;
	static final int MIN = 60;
	static final int HOUR = 24;
	static final int DAY = 7;
	static final int MONTH = 12;
	
	public ArrayList<SaleDTO> callProductList_unmember(int start, int end) {
		ArrayList<SaleDTO> list = dao.callProductList_unmember(start, end);
		setReg_date(list);
		
		return list;
	}
	
	public int getAge(String loginId) {
		
		return dao.getAge(loginId);
	}

	public String getLocation(String loginId) {
		
		return dao.getLocation(loginId);
	}

	public ArrayList<SaleDTO> callProductListMinorMember(String loginId, int start, int end) {
		ArrayList<SaleDTO> list = dao.callProductListMinorMember(loginId,start, end);
		setReg_date(list);
		
		return list;
	}

	public ArrayList<SaleDTO> callProductListMember(String loginId, int start, int end) {
		ArrayList<SaleDTO> list = dao.callProductListMember(loginId,start, end);
		setReg_date(list);
		
		return list;
	}
	
	private void setReg_date(ArrayList<SaleDTO> list) {
		String reg_date;
		for (int i = 0; i < list.size(); i++) {
			try {
				reg_date = list.get(i).getReg_date();
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date date = transFormat.parse(reg_date);
	
				long curTime = System.currentTimeMillis();
				long regTime = date.getTime();
				long diffTime = (curTime - regTime) / 1000;
				
				String diff_msg = "";

				if (diffTime < SEC) {
					diff_msg = "방금 전";
				} else if ((diffTime /= SEC) < MIN) {
					diff_msg = diffTime + "분 전";
				} else if ((diffTime /= MIN) < HOUR) {
					diff_msg = (diffTime) + "시간 전";
				} else if ((diffTime /= HOUR) < DAY) {
					diff_msg = (diffTime) + "일 전";
				} else {
					diff_msg = reg_date.substring(0, 10);
				}
				list.get(i).setReg_date(diff_msg);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
	}
	
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

	public int getEndPage_ummember() {
		return dao.getEndPage_ummember();
	}

	public int getEndPageMinorMember(String loginId) {
		return dao.getEndPageMinorMember(loginId);
	}

	public int getEndPageMember(String loginId) {
		return dao.getEndPageMember(loginId);
	}
	
	@Transactional
	public void detail(int product_idx, Model model) {
		SaleDTO detail = new SaleDTO();
		ArrayList<SaleFileDTO> fileList = new ArrayList<SaleFileDTO>();
		ArrayList<CommentsDTO> commentList = new ArrayList<CommentsDTO>();
		
		dao.upHit(product_idx);
		detail = dao.detail(product_idx);
		setReg_date(detail);		
		fileList = dao.fileList(product_idx);
		commentList = dao.commentList(product_idx);
		setReg_date2(commentList);	
		
		model.addAttribute("detail", detail);
		model.addAttribute("fileList", fileList);
		model.addAttribute("commentList", commentList);

	}


	private void setReg_date2(ArrayList<CommentsDTO> commentList) {
		String reg_date;
		for (int i = 0; i < commentList.size(); i++) {
			try {
				reg_date = commentList.get(i).getReg_date();
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date date = transFormat.parse(reg_date);
	
				long curTime = System.currentTimeMillis();
				long regTime = date.getTime();
				long diffTime = (curTime - regTime) / 1000;
				
				String diff_msg = "";

				if (diffTime < SEC) {
					diff_msg = "방금 전";
				} else if ((diffTime /= SEC) < MIN) {
					diff_msg = diffTime + "분 전";
				} else if ((diffTime /= MIN) < HOUR) {
					diff_msg = (diffTime) + "시간 전";
				} else if ((diffTime /= HOUR) < DAY) {
					diff_msg = (diffTime) + "일 전";
				} else {
					diff_msg = reg_date.substring(0, 10);
				}
				commentList.get(i).setReg_date(diff_msg);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
	}

	private void setReg_date(SaleDTO detail) {
		String reg_date;
		try {
			reg_date = detail.getReg_date();
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = transFormat.parse(reg_date);

			long curTime = System.currentTimeMillis();
			long regTime = date.getTime();
			long diffTime = (curTime - regTime) / 1000;
			
			String diff_msg = "";

			if (diffTime < SEC) {
				diff_msg = "방금 전";
			} else if ((diffTime /= SEC) < MIN) {
				diff_msg = diffTime + "분 전";
			} else if ((diffTime /= MIN) < HOUR) {
				diff_msg = (diffTime) + "시간 전";
			} else if ((diffTime /= HOUR) < DAY) {
				diff_msg = (diffTime) + "일 전";
			} else {
				diff_msg = reg_date.substring(0, 10);
			}
			detail.setReg_date(diff_msg);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<CoCommentDTO> cocommentList(int comment_idx) {
		ArrayList<CoCommentDTO> list = new ArrayList<CoCommentDTO>();
		list = dao.cocommentList(comment_idx);
		setReg_date3(list);
		
		return list;
	}

	private void setReg_date3(ArrayList<CoCommentDTO> list) {
		String reg_date;
		for (int i = 0; i < list.size(); i++) {
			try {
				reg_date = list.get(i).getReg_date();
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date date = transFormat.parse(reg_date);
	
				long curTime = System.currentTimeMillis();
				long regTime = date.getTime();
				long diffTime = (curTime - regTime) / 1000;
				
				String diff_msg = "";

				if (diffTime < SEC) {
					diff_msg = "방금 전";
				} else if ((diffTime /= SEC) < MIN) {
					diff_msg = diffTime + "분 전";
				} else if ((diffTime /= MIN) < HOUR) {
					diff_msg = (diffTime) + "시간 전";
				} else if ((diffTime /= HOUR) < DAY) {
					diff_msg = (diffTime) + "일 전";
				} else {
					diff_msg = reg_date.substring(0, 10);
				}
				list.get(i).setReg_date(diff_msg);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
	}

	public HashMap<String, Object> commentWrite(int product_idx, String comment_content, String loginId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int success = dao.commentWrite(product_idx, comment_content, loginId);
		String member_id = dao.getMember_id(product_idx);
		if(loginId.equals(member_id)) {
		}else {
			String product_subject = dao.getSubject(product_idx);
			String msg = "["+loginId+"]님이 회원님의 게시글 ["+product_subject+"]에 댓글을 작성하셨습니다.";
			dao.sendAlarm(msg,member_id ,2001);
		}
		map.put("success", success);
		return map;
	}

	public HashMap<String, Object> cocommentWrite(int comment_idx, String cocomment_content, String loginId) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		int success = dao.cocommentWrite(comment_idx,cocomment_content,loginId);
		
		map.put("success", success);
		return map;
	}

	public HashMap<String, Object> report(int idx, int codeNum, String target, String report_reason, String loginId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int success = 0;
		success = dao.report(idx, codeNum, target, report_reason, loginId);
		
		map.put("success", success);
		return map;
	}

	public int chReport(int idx, int codeNum, String loginId) {
		
		return dao.chReport(idx, codeNum, loginId);
	}

	public String getTarget(int idx, int codeNum) {
		
		return dao.getTarget(idx, codeNum);
	}

	public int pDel(int idx) {
		return dao.pDel(idx);
	}

	public int cDel(int idx) {
		return dao.cDel(idx);
	}

	public int ccDel(int idx) {
		return dao.ccDel(idx);
	}


	public void chWish(String loginId, int product_idx, Model model) {
		int chWish = dao.chWish(loginId, product_idx);//위시리스트에 있느냐? 있으면 1 없으면 0
		int chWishDel = 0;
		if(chWish == 1) { //위시리스트에 있었으면 삭제되었는가?? 삭제되었으면 1 위시리스트에 존재하면 0 
			chWishDel = dao.chWishDel(loginId,product_idx);
		}
		model.addAttribute("chWishDel", chWishDel);
		model.addAttribute("chWish", chWish);
	}

	public int wishPlus1(int idx, String loginId) {
		
		return dao.wishPlus1(idx, loginId);
	}

	public int wishPlus2(int idx, String loginId) {
		
		return dao.wishPlus2(idx, loginId);
	}

	public int wishMinus(int idx, String loginId) {
		
		return dao.wishMinus(idx, loginId);
	}
	
	@Transactional
	public HashMap<String, Object> changeIng(int idx, String id, String trade_type, String loginId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int success = 0;
		int existId = 0;
		int trade_idx = 0;
		
		//아이디 있는지 확인
		existId = dao.existId(id);
		
		if(existId >0) { //존재하는 아이디면
			success = dao.changeIng(idx, id, trade_type, loginId);
			if(success > 0) {
				dao.changeIng2(idx);
				trade_idx = dao.getTardeIdx(idx, id);
			}
		}
		
		map.put("existId", existId);
		map.put("success", success);
		map.put("trade_idx", trade_idx);
		return map;
	}

	public HashMap<String, Object> setMeetDate(int trade_idx, String meetDate) {	
		HashMap<String, Object> map = new HashMap<String, Object>();
		int success = 0;
		try {
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date date = transFormat.parse(meetDate);
			success = dao.setMeetDate(trade_idx, date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		map.put("success", success);
		return map;
	}

	public HashMap<String, Object> getBuyerId(int product_idx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String buyer_id = dao.getBuyerId(product_idx);
		
		map.put("buyer_id", buyer_id);
		return map;
	}

	public int getTradeIdx(int product_idx) {
		return dao.getTradeIdx(product_idx);
	}

	public HashMap<String, Object> saveCancelReason(int product_idx, int trade_idx, String cancel_reason) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int success = 0;
		Date date = null;
		try {
			SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");		
			String format_time = format.format (System.currentTimeMillis());
			date = format.parse(format_time);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		int check1 = dao.setCancelReason(trade_idx, cancel_reason, date);
		int check2 = dao.setCodeNum(product_idx);
		
		if(check1==1 && check2==1) {
			success = 1;
		}
		map.put("success", success);
		return map;
	}

	public HashMap<String, Object> tradeEnd(int product_idx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String msg = "";
		int success = 0;
		int check1 = 0;
		int check2 = 0;
		int tracking_number = 0;
		
		int trade_idx = dao.getTradeIdx(product_idx);
		
		//택배인지 직거래인지 확인하고
		String trade_type = dao.getTradeType(trade_idx);
		
		//택배면 직거래의 경우에만 판매자가 완료가능
		//운송장 번호 입력했는지 확인
		//입력했으면 사용자측에서만 거래완료 가능
		if(trade_type.equals("택배")) {
			tracking_number = dao.getTracking_Number(trade_idx);
			if(tracking_number != 0) {
				msg = "택배거래는 구매자 측에서만 거래 완료를 누를 수 있습니다.";
			}else {
				msg = "운송장 번호를 입력하지 않았습니다. 마이페이지에서 입력해주세요.";
			}
		}else {
			Date date = null;
			try {
				SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");		
				String format_time = format.format (System.currentTimeMillis());
				date = format.parse(format_time);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			check1 = dao.setTradeEnd(trade_idx,date);
			check2 = dao.setTradeEnd2(product_idx);
		}
		
		if(check1 == 1 && check2 ==1) {
			success = 1;
		}
		map.put("success", success);
		map.put("msg", msg);
		return map;
	}

}
