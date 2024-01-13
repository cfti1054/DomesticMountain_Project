package com.fa.plus.admin.domain;

public class OrderManage {
	// 주문
	private long order_num;
	private String order_date;
	private String transport_date;
	private int order_total_money;
	private int shipping;
	private int order_sale;
	private int order_point;
	private int order_earn;
	private int total_amount;
	private long useridx;
	private String user_name;
	//임시
	
	
	// 주문 상세 
	private long order_detail_num;
	private long detail_num1;
	private long detail_num2;
	private int order_detail_price;
	private int order_detail_count;
	private int order_detail_total_amount;
	private int total_order_count;
	private int total_qty;
	private int detail_cancel_count;
	private int change_num;
	private long product_num;
	private String order_status;
	
	// 택배회사
	private long company_num;
	private String company_name;
	private String company_tel;
	private String company_email;

	// 배송정보
	private String invoiceNumber;
	
	
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public int getTotal_order_count() {
		return total_order_count;
	}
	public void setTotal_order_count(int total_order_count) {
		this.total_order_count = total_order_count;
	}
	public int getTotal_qty() {
		return total_qty;
	}
	public void setTotal_qty(int total_qty) {
		this.total_qty = total_qty;
	}
	public int getDetail_cancel_count() {
		return detail_cancel_count;
	}
	public void setDetail_cancel_count(int detail_cancel_count) {
		this.detail_cancel_count = detail_cancel_count;
	}
	public long getOrder_num() {
		return order_num;
	}
	public void setOrder_num(long order_num) {
		this.order_num = order_num;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getTransport_date() {
		return transport_date;
	}
	public void setTransport_date(String transport_date) {
		this.transport_date = transport_date;
	}
	public int getOrder_total_money() {
		return order_total_money;
	}
	public void setOrder_total_money(int order_total_money) {
		this.order_total_money = order_total_money;
	}
	public int getShipping() {
		return shipping;
	}
	public void setShipping(int shipping) {
		this.shipping = shipping;
	}
	public int getOrder_sale() {
		return order_sale;
	}
	public void setOrder_sale(int order_sale) {
		this.order_sale = order_sale;
	}
	public int getOrder_point() {
		return order_point;
	}
	public void setOrder_point(int order_point) {
		this.order_point = order_point;
	}
	public int getOrder_earn() {
		return order_earn;
	}
	public void setOrder_earn(int order_earn) {
		this.order_earn = order_earn;
	}
	public int getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}
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
	public long getOrder_detail_num() {
		return order_detail_num;
	}
	public void setOrder_detail_num(long order_detail_num) {
		this.order_detail_num = order_detail_num;
	}
	public long getDetail_num1() {
		return detail_num1;
	}
	public void setDetail_num1(long detail_num1) {
		this.detail_num1 = detail_num1;
	}
	public long getDetail_num2() {
		return detail_num2;
	}
	public void setDetail_num2(long detail_num2) {
		this.detail_num2 = detail_num2;
	}
	public int getOrder_detail_price() {
		return order_detail_price;
	}
	public void setOrder_detail_price(int order_detail_price) {
		this.order_detail_price = order_detail_price;
	}
	public int getOrder_detail_count() {
		return order_detail_count;
	}
	public void setOrder_detail_count(int order_detail_count) {
		this.order_detail_count = order_detail_count;
	}
	public int getOrder_detail_total_amount() {
		return order_detail_total_amount;
	}
	public void setOrder_detail_total_amount(int order_detail_total_amount) {
		this.order_detail_total_amount = order_detail_total_amount;
	}
	public int getChange_num() {
		return change_num;
	}
	public void setChange_num(int change_num) {
		this.change_num = change_num;
	}
	public long getProduct_num() {
		return product_num;
	}
	public void setProduct_num(long product_num) {
		this.product_num = product_num;
	}
	public long getCompany_num() {
		return company_num;
	}
	public void setCompany_num(long company_num) {
		this.company_num = company_num;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getCompany_tel() {
		return company_tel;
	}
	public void setCompany_tel(String company_tel) {
		this.company_tel = company_tel;
	}
	public String getCompany_email() {
		return company_email;
	}
	public void setCompany_email(String company_email) {
		this.company_email = company_email;
	}
	
	
	
	
	
	
}
