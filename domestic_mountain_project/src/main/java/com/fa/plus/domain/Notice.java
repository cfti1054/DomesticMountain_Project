package com.fa.plus.domain;

public class Notice {
    private int notice_category_num;
    private String category_name;
    private int category_reg_id;	// idx로 번호로 넘겨져서 number
    private String category_reg_date;
    private String category_update_date;
    private int category_order;
    private int category_visible;
    
    private int notice_name;
    // private int notice_category_num;
    private String notice_title;
    private String notice_content;
    private int notice_hit_count;
    private String notice_reg_id;
    private String notice_reg_date;
    private String notice_update_id;
    private String notice_update_date;
    private int notice_visible;
    private String notice_invisible_date;
    
	public int getNotice_category_num() {
		return notice_category_num;
	}
	public void setNotice_category_num(int notice_category_num) {
		this.notice_category_num = notice_category_num;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public int getCategory_reg_id() {
		return category_reg_id;
	}
	public void setCategory_reg_id(int category_reg_id) {
		this.category_reg_id = category_reg_id;
	}
	public String getCategory_reg_date() {
		return category_reg_date;
	}
	public void setCategory_reg_date(String category_reg_date) {
		this.category_reg_date = category_reg_date;
	}
	public String getCategory_update_date() {
		return category_update_date;
	}
	public void setCategory_update_date(String category_update_date) {
		this.category_update_date = category_update_date;
	}
	public int getCategory_order() {
		return category_order;
	}
	public void setCategory_order(int category_order) {
		this.category_order = category_order;
	}
	public int getCategory_visible() {
		return category_visible;
	}
	public void setCategory_visible(int category_visible) {
		this.category_visible = category_visible;
	}
	public int getNotice_name() {
		return notice_name;
	}
	public void setNotice_name(int notice_name) {
		this.notice_name = notice_name;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public int getNotice_hit_count() {
		return notice_hit_count;
	}
	public void setNotice_hit_count(int notice_hit_count) {
		this.notice_hit_count = notice_hit_count;
	}
	public String getNotice_reg_id() {
		return notice_reg_id;
	}
	public void setNotice_reg_id(String notice_reg_id) {
		this.notice_reg_id = notice_reg_id;
	}
	public String getNotice_reg_date() {
		return notice_reg_date;
	}
	public void setNotice_reg_date(String notice_reg_date) {
		this.notice_reg_date = notice_reg_date;
	}
	public String getNotice_update_id() {
		return notice_update_id;
	}
	public void setNotice_update_id(String notice_update_id) {
		this.notice_update_id = notice_update_id;
	}
	public String getNotice_update_date() {
		return notice_update_date;
	}
	public void setNotice_update_date(String notice_update_date) {
		this.notice_update_date = notice_update_date;
	}
	public int getNotice_visible() {
		return notice_visible;
	}
	public void setNotice_visible(int notice_visible) {
		this.notice_visible = notice_visible;
	}
	public String getNotice_invisible_date() {
		return notice_invisible_date;
	}
	public void setNotice_invisible_date(String notice_invisible_date) {
		this.notice_invisible_date = notice_invisible_date;
	}
    
}