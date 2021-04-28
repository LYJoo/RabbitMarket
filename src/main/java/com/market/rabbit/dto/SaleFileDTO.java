package com.market.rabbit.dto;

import org.apache.ibatis.type.Alias;

@Alias("saleFile")
public class SaleFileDTO {
	
	private int file_idx;//파일idx -pk
	private String oriFileName;//원본파일이름
	private String newFileName;//새파일이음
	private int product_idx;//판매글idx -fk
	public int getFile_idx() {
		return file_idx;
	}
	public void setFile_idx(int file_idx) {
		this.file_idx = file_idx;
	}
	public String getOriFileName() {
		return oriFileName;
	}
	public void setOriFileName(String oriFileName) {
		this.oriFileName = oriFileName;
	}
	public String getNewFileName() {
		return newFileName;
	}
	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	
	
	
}
