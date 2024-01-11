package com.fa.plus.admin.domain;

public class OrderManage {
	public long order_num;
	public String order_date;
	public String transport_date;
	public int order_total_money;
	public int shipping;
	public int order_sale;
	public int order_point;
	public int order_earn;
	public int total_amount;
	public long useridx;
	public String user_name;
	
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
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
	
	
}
