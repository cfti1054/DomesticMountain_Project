package com.fa.plus.admin.domain;

public class Stats {
	// 멤버 - 성별
	public int gender_male;
	public int gender_female;
	// 멤버 - 연령대
	public String age;
	// 멤버 - 거주지
	public String location;
	
	// 멤버 - 등록일자
	public String reg_date;
	public int reg_num;
	
	
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
	
}
