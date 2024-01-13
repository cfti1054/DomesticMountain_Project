package com.fa.plus.admin.domain;

public class Stats {
	// 멤버 - 성별
	private int gender_male;
	private int gender_female;
	// 멤버 - 연령대
	private String age;
	// 멤버 - 거주지
	private String location;
	
	// 멤버 - 등록일자
	private String reg_date;
	private int reg_num;
	private int reg_sum;
	// 멤버 - 월별 등록일자
	
	private String reg_month;
	private int monthly_reg_num;
	private int monthly_reg_sum;
	
	// 총 매출
	private String sales_date;
	private int sales_num;
	private int revenue_num;
	// 누접 합계
	private int sales_sum;
	private int revenue_sum;
	
	// 월별 매출
	private String sales_month;
	private int monthly_sales_num;
	private int monthly_revenue_num;
	private int monthly_sales_sum;
	private int monthly_revenue_sum; 
	
	public String getSales_date() {
		return sales_date;
	}
	public void setSales_date(String sales_date) {
		this.sales_date = sales_date;
	}
	public int getSales_num() {
		return sales_num;
	}
	public void setSales_num(int sales_num) {
		this.sales_num = sales_num;
	}
	public int getRevenue_num() {
		return revenue_num;
	}
	public void setRevenue_num(int revenue_num) {
		this.revenue_num = revenue_num;
	}
	public int getSales_sum() {
		return sales_sum;
	}
	public void setSales_sum(int sales_sum) {
		this.sales_sum = sales_sum;
	}
	public int getRevenue_sum() {
		return revenue_sum;
	}
	public void setRevenue_sum(int revenue_sum) {
		this.revenue_sum = revenue_sum;
	}
	public String getSales_month() {
		return sales_month;
	}
	public void setSales_month(String sales_month) {
		this.sales_month = sales_month;
	}
	public int getMonthly_sales_num() {
		return monthly_sales_num;
	}
	public void setMonthly_sales_num(int monthly_sales_num) {
		this.monthly_sales_num = monthly_sales_num;
	}
	public int getMonthly_revenue_num() {
		return monthly_revenue_num;
	}
	public void setMonthly_revenue_num(int monthly_revenue_num) {
		this.monthly_revenue_num = monthly_revenue_num;
	}
	public int getMonthly_sales_sum() {
		return monthly_sales_sum;
	}
	public void setMonthly_sales_sum(int monthly_sales_sum) {
		this.monthly_sales_sum = monthly_sales_sum;
	}
	public int getMonthly_revenue_sum() {
		return monthly_revenue_sum;
	}
	public void setMonthly_revenue_sum(int monthly_revenue_sum) {
		this.monthly_revenue_sum = monthly_revenue_sum;
	}
	public int getGender_male() {
		return gender_male;
	}
	public void setGender_male(int gender_male) {
		this.gender_male = gender_male;
	}
	public int getGender_female() {
		return gender_female;
	}
	public void setGender_female(int gender_female) {
		this.gender_female = gender_female;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getReg_num() {
		return reg_num;
	}
	public void setReg_num(int reg_num) {
		this.reg_num = reg_num;
	}
	public int getReg_sum() {
		return reg_sum;
	}
	public void setReg_sum(int reg_sum) {
		this.reg_sum = reg_sum;
	}
	public String getReg_month() {
		return reg_month;
	}
	public void setReg_month(String reg_month) {
		this.reg_month = reg_month;
	}
	public int getMonthly_reg_num() {
		return monthly_reg_num;
	}
	public void setMonthly_reg_num(int monthly_reg_num) {
		this.monthly_reg_num = monthly_reg_num;
	}
	public int getMonthly_reg_sum() {
		return monthly_reg_sum;
	}
	public void setMonthly_reg_sum(int monthly_reg_sum) {
		this.monthly_reg_sum = monthly_reg_sum;
	}
	
	
	
}
