package com.fa.plus.admin.domain;

public class Stats {
	// 멤버 - 성별
	public int gender_male;
	public int gender_female;
	// 멤버 - 연령대
	public String age;
	// 멤버 - 거주지
	public String location;
	
	
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
