package com.fa.plus.admin.domain;

public class Support {
	
	// FAQ 카테고리
	private long faq_category_num;
	private String category_name;
	private String category_reg_id;
	private String category_reg_date;
	private String category_update_date;
	private long faq_category_order;
	private int category_visible;
	
	// FAQ 게시판
	private long faq_num;
	private String faq_question;
	private String faq_content;
	private String faq_reg_id;
	private String faq_reg_date;
	private String faq_update_id;
	private String faq_update_date;
	private int visible;
	
	// inquiry 카테고리
	private long inquiry_category_num;
	private String inquiry_category_name;
	private String inquiry_category_reg_id;
	private String inquiry_category_reg_date;
	private String inquiry_category_update_date;
	private int inquiry_category_order;
	private int inquiry_category_visible;
	
	// inquiry 게시판
	private long inquiry_board_num;
	private String inquiry_board_title;
	private String inquiry_board_content;
	private String  inquiry_board_reg_id;
	private String inquiry_board_reg_date;
	private String inquiry_board_update_date;
	private int inquiry_board_status;
	private int inquiry_board_hit_count;
	
	// inquiry 답변
	private long inquiry_answer_num;
	private String inquiry_answer_reg_id;
	private String inquiry_answer_title;
	private String inquiry_answer_content;
	private String inquiry_answer_reg_date;
	private String inquiry_answer_update_date;
		
	// inquiry 파일
	private long file_num;
	public long getInquiry_category_num() {
		return inquiry_category_num;
	}
	public void setInquiry_category_num(long inquiry_category_num) {
		this.inquiry_category_num = inquiry_category_num;
	}
	public String getInquiry_category_name() {
		return inquiry_category_name;
	}
	public void setInquiry_category_name(String inquiry_category_name) {
		this.inquiry_category_name = inquiry_category_name;
	}
	public String getInquiry_category_reg_id() {
		return inquiry_category_reg_id;
	}
	public void setInquiry_category_reg_id(String inquiry_category_reg_id) {
		this.inquiry_category_reg_id = inquiry_category_reg_id;
	}
	public String getInquiry_category_reg_date() {
		return inquiry_category_reg_date;
	}
	public void setInquiry_category_reg_date(String inquiry_category_reg_date) {
		this.inquiry_category_reg_date = inquiry_category_reg_date;
	}
	public String getInquiry_category_update_date() {
		return inquiry_category_update_date;
	}
	public void setInquiry_category_update_date(String inquiry_category_update_date) {
		this.inquiry_category_update_date = inquiry_category_update_date;
	}
	public int getInquiry_category_order() {
		return inquiry_category_order;
	}
	public void setInquiry_category_order(int inquiry_category_order) {
		this.inquiry_category_order = inquiry_category_order;
	}
	public int getInquiry_category_visible() {
		return inquiry_category_visible;
	}
	public void setInquiry_category_visible(int inquiry_category_visible) {
		this.inquiry_category_visible = inquiry_category_visible;
	}
	public long getInquiry_board_num() {
		return inquiry_board_num;
	}
	public void setInquiry_board_num(long inquiry_board_num) {
		this.inquiry_board_num = inquiry_board_num;
	}
	public String getInquiry_board_title() {
		return inquiry_board_title;
	}
	public void setInquiry_board_title(String inquiry_board_title) {
		this.inquiry_board_title = inquiry_board_title;
	}
	public String getInquiry_board_content() {
		return inquiry_board_content;
	}
	public void setInquiry_board_content(String inquiry_board_content) {
		this.inquiry_board_content = inquiry_board_content;
	}
	public String getInquiry_board_reg_id() {
		return inquiry_board_reg_id;
	}
	public void setInquiry_board_reg_id(String inquiry_board_reg_id) {
		this.inquiry_board_reg_id = inquiry_board_reg_id;
	}
	public String getInquiry_board_reg_date() {
		return inquiry_board_reg_date;
	}
	public void setInquiry_board_reg_date(String inquiry_board_reg_date) {
		this.inquiry_board_reg_date = inquiry_board_reg_date;
	}
	public String getInquiry_board_update_date() {
		return inquiry_board_update_date;
	}
	public void setInquiry_board_update_date(String inquiry_board_update_date) {
		this.inquiry_board_update_date = inquiry_board_update_date;
	}
	public int getInquiry_board_status() {
		return inquiry_board_status;
	}
	public void setInquiry_board_status(int inquiry_board_status) {
		this.inquiry_board_status = inquiry_board_status;
	}
	public int getInquiry_board_hit_count() {
		return inquiry_board_hit_count;
	}
	public void setInquiry_board_hit_count(int inquiry_board_hit_count) {
		this.inquiry_board_hit_count = inquiry_board_hit_count;
	}
	public long getInquiry_answer_num() {
		return inquiry_answer_num;
	}
	public void setInquiry_answer_num(long inquiry_answer_num) {
		this.inquiry_answer_num = inquiry_answer_num;
	}
	public String getInquiry_answer_reg_id() {
		return inquiry_answer_reg_id;
	}
	public void setInquiry_answer_reg_id(String inquiry_answer_reg_id) {
		this.inquiry_answer_reg_id = inquiry_answer_reg_id;
	}
	public String getInquiry_answer_title() {
		return inquiry_answer_title;
	}
	public void setInquiry_answer_title(String inquiry_answer_title) {
		this.inquiry_answer_title = inquiry_answer_title;
	}
	public String getInquiry_answer_content() {
		return inquiry_answer_content;
	}
	public void setInquiry_answer_content(String inquiry_answer_content) {
		this.inquiry_answer_content = inquiry_answer_content;
	}
	public String getInquiry_answer_reg_date() {
		return inquiry_answer_reg_date;
	}
	public void setInquiry_answer_reg_date(String inquiry_answer_reg_date) {
		this.inquiry_answer_reg_date = inquiry_answer_reg_date;
	}
	public String getInquiry_answer_update_date() {
		return inquiry_answer_update_date;
	}
	public void setInquiry_answer_update_date(String inquiry_answer_update_date) {
		this.inquiry_answer_update_date = inquiry_answer_update_date;
	}
	public long getFile_num() {
		return file_num;
	}
	public void setFile_num(long file_num) {
		this.file_num = file_num;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	private String file_name;
	
	
	
	public long getFaq_category_num() {
		return faq_category_num;
	}
	public void setFaq_category_num(long faq_category_num) {
		this.faq_category_num = faq_category_num;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getCategory_reg_id() {
		return category_reg_id;
	}
	public void setCategory_reg_id(String category_reg_id) {
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
	public long getFaq_category_order() {
		return faq_category_order;
	}
	public void setFaq_category_order(long Faq_category_order) {
		this.faq_category_order = Faq_category_order;
	}
	public int getCategory_visible() {
		return category_visible;
	}
	public void setCategory_visible(int category_visible) {
		this.category_visible = category_visible;
	}
	public long getFaq_num() {
		return faq_num;
	}
	public void setFaq_num(long faq_num) {
		this.faq_num = faq_num;
	}
	public String getFaq_question() {
		return faq_question;
	}
	public void setFaq_question(String faq_question) {
		this.faq_question = faq_question;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public String getFaq_reg_id() {
		return faq_reg_id;
	}
	public void setFaq_reg_id(String faq_reg_id) {
		this.faq_reg_id = faq_reg_id;
	}
	public String getFaq_reg_date() {
		return faq_reg_date;
	}
	public void setFaq_reg_date(String faq_reg_date) {
		this.faq_reg_date = faq_reg_date;
	}
	public String getFaq_update_id() {
		return faq_update_id;
	}
	public void setFaq_update_id(String faq_update_id) {
		this.faq_update_id = faq_update_id;
	}
	public String getFaq_update_date() {
		return faq_update_date;
	}
	public void setFaq_update_date(String faq_update_date) {
		this.faq_update_date = faq_update_date;
	}
	public int getVisible() {
		return visible;
	}
	public void setVisible(int visible) {
		this.visible = visible;
	}
	
	
	

	
	
}
