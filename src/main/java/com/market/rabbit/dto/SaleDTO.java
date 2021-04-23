package com.market.rabbit.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("sale")
public class SaleDTO {
	private int product_idx;//판매글idx
	private String seller_id;//회원id
	private String sale_subject;//제목
	private String sale_content;//내용
	private int price;//가격
	private Date reg_date;//등록일
	private Date pull_up_date;//끌어올리기날짜
	private boolean pull_up;//끌어올리기여부
	private boolean minor;//미성년자글보이기여부
	private boolean negotiation;//가격제안가능여부
	private boolean isblind;//블라인드여부
	private boolean isdelete;//삭제여부
	private String location;//판매위치
	//
	private int s_category_idx;//카테고리번호 -fk
	private String s_category_name;//카테고리명
	//
	private int code_num;//코드번호 : 판매상태 -fk
	private String code_content; //코드 내용
	//
	private int bHit;//조회수
	private String keyword;//키워드
	
	
	public int getS_category_idx() {
		return s_category_idx;
	}
	public void setS_category_idx(int s_category_idx) {
		this.s_category_idx = s_category_idx;
	}
	public String getS_category_name() {
		return s_category_name;
	}
	public void setS_category_name(String s_category_name) {
		this.s_category_name = s_category_name;
	}
	public String getCode_content() {
		return code_content;
	}
	public void setCode_content(String code_content) {
		this.code_content = code_content;
	}
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getSale_subject() {
		return sale_subject;
	}
	public void setSale_subject(String sale_subject) {
		this.sale_subject = sale_subject;
	}
	public String getSale_content() {
		return sale_content;
	}
	public void setSale_content(String sale_content) {
		this.sale_content = sale_content;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getPull_up_date() {
		return pull_up_date;
	}
	public void setPull_up_date(Date pull_up_date) {
		this.pull_up_date = pull_up_date;
	}
	public boolean isPull_up() {
		return pull_up;
	}
	public void setPull_up(boolean pull_up) {
		this.pull_up = pull_up;
	}
	public boolean isMinor() {
		return minor;
	}
	public void setMinor(boolean minor) {
		this.minor = minor;
	}
	public boolean isNegotiation() {
		return negotiation;
	}
	public void setNegotiation(boolean negotiation) {
		this.negotiation = negotiation;
	}
	public boolean isIsblind() {
		return isblind;
	}
	public void setIsblind(boolean isblind) {
		this.isblind = isblind;
	}
	public boolean isIsdelete() {
		return isdelete;
	}
	public void setIsdelete(boolean isdelete) {
		this.isdelete = isdelete;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getCode_num() {
		return code_num;
	}
	public void setCode_num(int code_num) {
		this.code_num = code_num;
	}
	public int getbHit() {
		return bHit;
	}
	public void setbHit(int bHit) {
		this.bHit = bHit;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	
	
}
