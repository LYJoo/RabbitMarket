package com.market.rabbit.dto;

import org.apache.ibatis.type.Alias;

@Alias("sale")
public class SaleDTO {
	private int product_idx;
	private String seller_id;
	private String sale_subject;
	private String sale_content;
	private int price;
	private String reg_date;
	private String pull_up_date;
	private boolean pull_up;
	private boolean minor;
	private boolean negotiation;
	private boolean isBlind;
	private boolean isDelete;
	private String sale_location;
	private int s_category_idx;
	private int code_num;
	private int bHit;
	private String keyword;
	private int wishCnt;
	private int fileCnt;
	private MemberDTO memberDto;
	private SaleFileDTO saleFileDto;
	private ProfileFileDTO profileFileDto;
	private SaleCategoryDTO saleCategoryDTO;
	
	
	
	public SaleCategoryDTO getSaleCategoryDTO() {
		return saleCategoryDTO;
	}
	public void setSaleCategoryDTO(SaleCategoryDTO saleCategoryDTO) {
		this.saleCategoryDTO = saleCategoryDTO;
	}
	public ProfileFileDTO getProfileFileDto() {
		return profileFileDto;
	}
	public void setProfileFileDto(ProfileFileDTO profileFileDto) {
		this.profileFileDto = profileFileDto;
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
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getPull_up_date() {
		return pull_up_date;
	}
	public void setPull_up_date(String pull_up_date) {
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
	public boolean isIsBlind() {
		return isBlind;
	}
	public void setIsBlind(boolean isBlind) {
		this.isBlind = isBlind;
	}
	public boolean isIsDelete() {
		return isDelete;
	}
	public void setIsDelete(boolean isDelete) {
		this.isDelete = isDelete;
	}
	public String getSale_location() {
		return sale_location;
	}
	public void setSale_location(String sale_location) {
		this.sale_location = sale_location;
	}
	public int getS_category_idx() {
		return s_category_idx;
	}
	public void setS_category_idx(int s_category_idx) {
		this.s_category_idx = s_category_idx;
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
	public int getWishCnt() {
		return wishCnt;
	}
	public void setWishCnt(int wishCnt) {
		this.wishCnt = wishCnt;
	}
	public int getFileCnt() {
		return fileCnt;
	}
	public void setFileCnt(int fileCnt) {
		this.fileCnt = fileCnt;
	}
	public MemberDTO getMemberDto() {
		return memberDto;
	}
	public void setMemberDto(MemberDTO memberDto) {
		this.memberDto = memberDto;
	}
	public SaleFileDTO getSaleFileDto() {
		return saleFileDto;
	}
	public void setSaleFileDto(SaleFileDTO saleFileDto) {
		this.saleFileDto = saleFileDto;
	}
	
}
