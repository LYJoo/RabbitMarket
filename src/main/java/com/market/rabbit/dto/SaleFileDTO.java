package com.market.rabbit.dto;

import org.apache.ibatis.type.Alias;

@Alias("saleFile")
public class SaleFileDTO {
	
	private int file_idx;//파일idx -pk
	private String orifilename;//원본파일이름
	private String newfilename;//새파일이음
	private int product_idx;//판매글idx -fk
	
	public int getFile_idx() {
		return file_idx;
	}
	public void setFile_idx(int file_idx) {
		this.file_idx = file_idx;
	}
	public String getOrifilename() {
		return orifilename;
	}
	public void setOrifilename(String orifilename) {
		this.orifilename = orifilename;
	}
	public String getNewfilename() {
		return newfilename;
	}
	public void setNewfilename(String newfilename) {
		this.newfilename = newfilename;
	}
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	
}
