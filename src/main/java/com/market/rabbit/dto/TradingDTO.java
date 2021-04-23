package com.market.rabbit.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("trading")
public class TradingDTO {
	private int trade_idx;
	private int product_idx;
	private int tracking_number;
	private String package_company;
	private String seller_id;
	private String buyer_id;
	private String trade_type;
	private String trade_state;
	private String cancel_reason;
	private boolean seller_manner;
	private boolean buyer_manner;
	private Date trade_time;
	private Date trade_start_date;
	private Date trade_end_date;
	
	public int getTrade_idx() {
		return trade_idx;
	}
	public void setTrade_idx(int trade_idx) {
		this.trade_idx = trade_idx;
	}
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public int getTracking_number() {
		return tracking_number;
	}
	public void setTracking_number(int tracking_number) {
		this.tracking_number = tracking_number;
	}
	public String getPackage_company() {
		return package_company;
	}
	public void setPackage_company(String package_company) {
		this.package_company = package_company;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public String getTrade_type() {
		return trade_type;
	}
	public void setTrade_type(String trade_type) {
		this.trade_type = trade_type;
	}
	public String getTrade_state() {
		return trade_state;
	}
	public void setTrade_state(String trade_state) {
		this.trade_state = trade_state;
	}
	public String getCancel_reason() {
		return cancel_reason;
	}
	public void setCancel_reason(String cancel_reason) {
		this.cancel_reason = cancel_reason;
	}
	public boolean isSeller_manner() {
		return seller_manner;
	}
	public void setSeller_manner(boolean seller_manner) {
		this.seller_manner = seller_manner;
	}
	public boolean isBuyer_manner() {
		return buyer_manner;
	}
	public void setBuyer_manner(boolean buyer_manner) {
		this.buyer_manner = buyer_manner;
	}
	public Date getTrade_time() {
		return trade_time;
	}
	public void setTrade_time(Date trade_time) {
		this.trade_time = trade_time;
	}
	public Date getTrade_start_date() {
		return trade_start_date;
	}
	public void setTrade_start_date(Date trade_start_date) {
		this.trade_start_date = trade_start_date;
	}
	public Date getTrade_end_date() {
		return trade_end_date;
	}
	public void setTrade_end_date(Date trade_end_date) {
		this.trade_end_date = trade_end_date;
	}
}
