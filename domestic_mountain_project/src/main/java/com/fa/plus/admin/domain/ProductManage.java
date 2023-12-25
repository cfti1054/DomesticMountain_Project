package com.fa.plus.admin.domain;

public class ProductManage {
	private long product_num; // 상품코드(pk)
	private long category_num; // 카테고리 번호(pk)
	
	private String product_reg_date; // 등록일
	private int product_status; // 이게 진열상태?
	private int total_stock; // 재고
	private int product_price; // 금액
	private String product_name; // 이름
	
	
	private String product_summary; // 이미지
	private String product_modify_date; // 수정일
	private long product_hit; // 소회수
	
	private long product_insertIdx; // 상품등록회원번호?
	private long product_updateIdx; // 상품수정회원번호??
	// 이 두개는 왜있지?? 어짜피 관리자밖에 없지 않나?
	
	// stock 테이블
	private long stock_num; // 재고 번호(pk)
	private long detail_num; // 색상
	private long detail_num2; // 사이즈
	
	// productOption 테이블
	private long option_num; // 옵션번호(pk)
	private String option_name; // 옵션 이름 [구분 / 색상 / 사이즈]
	
	// OptionDetail 테이블
	private String optiong_value; // [FREE, 색상종류, 사이즈종류 등]

	
	
	public long getProduct_num() {
		return product_num;
	}

	public void setProduct_num(long product_num) {
		this.product_num = product_num;
	}

	public long getCategory_num() {
		return category_num;
	}

	public void setCategory_num(long category_num) {
		this.category_num = category_num;
	}

	public String getProduct_reg_date() {
		return product_reg_date;
	}

	public void setProduct_reg_date(String product_reg_date) {
		this.product_reg_date = product_reg_date;
	}

	public int getProduct_status() {
		return product_status;
	}

	public void setProduct_status(int product_status) {
		this.product_status = product_status;
	}

	public int getTotal_stock() {
		return total_stock;
	}

	public void setTotal_stock(int total_stock) {
		this.total_stock = total_stock;
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

	public String getProduct_summary() {
		return product_summary;
	}

	public void setProduct_summary(String product_summary) {
		this.product_summary = product_summary;
	}

	public String getProduct_modify_date() {
		return product_modify_date;
	}

	public void setProduct_modify_date(String product_modify_date) {
		this.product_modify_date = product_modify_date;
	}

	public long getProduct_hit() {
		return product_hit;
	}

	public void setProduct_hit(long product_hit) {
		this.product_hit = product_hit;
	}

	public long getProduct_insertIdx() {
		return product_insertIdx;
	}

	public void setProduct_insertIdx(long product_insertIdx) {
		this.product_insertIdx = product_insertIdx;
	}

	public long getProduct_updateIdx() {
		return product_updateIdx;
	}

	public void setProduct_updateIdx(long product_updateIdx) {
		this.product_updateIdx = product_updateIdx;
	}

	public long getStock_num() {
		return stock_num;
	}

	public void setStock_num(long stock_num) {
		this.stock_num = stock_num;
	}

	public long getDetail_num() {
		return detail_num;
	}

	public void setDetail_num(long detail_num) {
		this.detail_num = detail_num;
	}

	public long getDetail_num2() {
		return detail_num2;
	}

	public void setDetail_num2(long detail_num2) {
		this.detail_num2 = detail_num2;
	}

	public long getOption_num() {
		return option_num;
	}

	public void setOption_num(long option_num) {
		this.option_num = option_num;
	}

	public String getOption_name() {
		return option_name;
	}

	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}

	public String getOptiong_value() {
		return optiong_value;
	}

	public void setOptiong_value(String optiong_value) {
		this.optiong_value = optiong_value;
	}
	
	
	
	
}
