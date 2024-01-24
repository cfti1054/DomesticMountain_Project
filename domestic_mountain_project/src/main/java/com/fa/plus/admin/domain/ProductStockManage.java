package com.fa.plus.admin.domain;

import java.util.List;

public class ProductStockManage {
	private long product_num;		// 상품번호
	private String product_name;	// 상품이름
	
	private Long poption_num;		// 옵션번호_상
	private String poption_name;	// 옵션이름_상
	private Long soption_num;		// 옵션번호_하
	private String soption_name;	// 옵션이름_하
	
	private Long pdetail_num;		// 상세번호_상
	private Long sdetail_num;		// 상세번호_하
	private String poption_value;	// 상세값_상
	private String soption_value;	// 상세값_하
	
	private int total_stock;		// 총재고
	
	private Long detail_num;		// 상세번호
	private Long detail_num2;		// 상세번호2
	private Long stock_num;			// 재고번호
	private String option_value;	// 상세값
	private Long parent;			// 상위번호(부모값)
	
	private List<Long> stock_nums;
	private List<Long> detail_nums;
	private List<Long> detail_nums2;
	private List<Integer> total_stocks;	
	private String product_summary; 	// 썸네일
	
	
	
	public String getProduct_summary() {
		return product_summary;
	}
	public void setProduct_summary(String product_summary) {
		this.product_summary = product_summary;
	}
	public long getProduct_num() {
		return product_num;
	}
	public void setProduct_num(long product_num) {
		this.product_num = product_num;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public Long getPoption_num() {
		return poption_num;
	}
	public void setPoption_num(Long poption_num) {
		this.poption_num = poption_num;
	}
	public String getPoption_name() {
		return poption_name;
	}
	public void setPoption_name(String poption_name) {
		this.poption_name = poption_name;
	}
	public Long getSoption_num() {
		return soption_num;
	}
	public void setSoption_num(Long soption_num) {
		this.soption_num = soption_num;
	}
	public String getSoption_name() {
		return soption_name;
	}
	public void setSoption_name(String soption_name) {
		this.soption_name = soption_name;
	}
	public Long getPdetail_num() {
		return pdetail_num;
	}
	public void setPdetail_num(Long pdetail_num) {
		this.pdetail_num = pdetail_num;
	}
	public Long getSdetail_num() {
		return sdetail_num;
	}
	public void setSdetail_num(Long sdetail_num) {
		this.sdetail_num = sdetail_num;
	}
	public String getPoption_value() {
		return poption_value;
	}
	public void setPoption_value(String poption_value) {
		this.poption_value = poption_value;
	}
	public String getSoption_value() {
		return soption_value;
	}
	public void setSoption_value(String soption_value) {
		this.soption_value = soption_value;
	}
	public int getTotal_stock() {
		return total_stock;
	}
	public void setTotal_stock(int total_stock) {
		this.total_stock = total_stock;
	}
	public Long getDetail_num() {
		return detail_num;
	}
	public void setDetail_num(Long detail_num) {
		this.detail_num = detail_num;
	}
	public Long getDetail_num2() {
		return detail_num2;
	}
	public void setDetail_num2(Long detail_num2) {
		this.detail_num2 = detail_num2;
	}
	public Long getStock_num() {
		return stock_num;
	}
	public void setStock_num(Long stock_num) {
		this.stock_num = stock_num;
	}
	public String getOption_value() {
		return option_value;
	}
	public void setOption_value(String option_value) {
		this.option_value = option_value;
	}
	public Long getParent() {
		return parent;
	}
	public void setParent(Long parent) {
		this.parent = parent;
	}
	public List<Long> getStock_nums() {
		return stock_nums;
	}
	public void setStock_nums(List<Long> stock_nums) {
		this.stock_nums = stock_nums;
	}
	public List<Long> getDetail_nums() {
		return detail_nums;
	}
	public void setDetail_nums(List<Long> detail_nums) {
		this.detail_nums = detail_nums;
	}
	public List<Long> getDetail_nums2() {
		return detail_nums2;
	}
	public void setDetail_nums2(List<Long> detail_nums2) {
		this.detail_nums2 = detail_nums2;
	}
	public List<Integer> getTotal_stocks() {
		return total_stocks;
	}
	public void setTotal_stocks(List<Integer> total_stocks) {
		this.total_stocks = total_stocks;
	}
	
}
