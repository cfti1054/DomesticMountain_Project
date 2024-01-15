package com.fa.plus.domain;

import java.util.List;

public class Zzim {
	private long useridx;					// 회원번호
	private String user_name;				// 회원이름
	private long product_num;				// 상품번호
	private int product_price; 				// 상품가격
	private String product_name;			// 상품이름
	private String zzim_date;				// 상품등록일
	private String zzim_update_date;		// 상품수정일
	
	private String option_value;			// 상세옵션값
	private String option_value2;			// 상세옵션값2
	private String product_summary;			// 제품 썸네일	
	
	private List<Long> product_nums;
	
	public long getUseridx() {
		return useridx;
	}
	public void setUseridx(long useridx) {
		this.useridx = useridx;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public long getProduct_num() {
		return product_num;
	}
	public void setProduct_num(long product_num) {
		this.product_num = product_num;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getZzim_date() {
		return zzim_date;
	}
	public void setZzim_date(String zzim_date) {
		this.zzim_date = zzim_date;
	}
	public String getZzim_update_date() {
		return zzim_update_date;
	}
	public void setZzim_update_date(String zzim_update_date) {
		this.zzim_update_date = zzim_update_date;
	}
	public String getOption_value() {
		return option_value;
	}
	public void setOption_value(String option_value) {
		this.option_value = option_value;
	}
	public String getOption_value2() {
		return option_value2;
	}
	public void setOption_value2(String option_value2) {
		this.option_value2 = option_value2;
	}
	public String getProduct_summary() {
		return product_summary;
	}
	public void setProduct_summary(String product_summary) {
		this.product_summary = product_summary;
	}
	public List<Long> getProduct_nums() {
		return product_nums;
	}
	public void setProduct_nums(List<Long> product_nums) {
		this.product_nums = product_nums;
	}
	
	
	
}
