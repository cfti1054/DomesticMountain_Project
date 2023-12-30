package com.fa.plus.admin.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Review {
	private long od_num;					// 주문상세번호	
	private int review_star;				// 별점 
	private String review_content;			// 리뷰 내용
	private String review_reg_date;			// 등록날짜
	private String review_update_date;		// 수정날짜
	private String review_answer;			// 답변
	private String review_answer_date;		// 답변일자
	private int review_show;				// 표시 숨김 여부
	private long product_num;				// 상품번호
	private long useridx;					// 회원번호
	
	// 파일처리
	private long review_file_num;			// 리뷰이미지번호
	private String review_file_img;			// 리뷰이미지
	private List<MultipartFile> selectFile;	//

	private String[] listFilename;
	
	private String product_name;			// 상품이름
	private String option_value;			// 옵션값1
	private String option_value2;			// 옵션값1
	
	public long getOd_num() {
		return od_num;
	}
	public void setOd_num(long od_num) {
		this.od_num = od_num;
	}
	public int getReview_star() {
		return review_star;
	}
	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_reg_date() {
		return review_reg_date;
	}
	public void setReview_reg_date(String review_reg_date) {
		this.review_reg_date = review_reg_date;
	}
	public String getReview_update_date() {
		return review_update_date;
	}
	public void setReview_update_date(String review_update_date) {
		this.review_update_date = review_update_date;
	}
	public String getReview_answer() {
		return review_answer;
	}
	public void setReview_answer(String review_answer) {
		this.review_answer = review_answer;
	}
	public String getReview_answer_date() {
		return review_answer_date;
	}
	public void setReview_answer_date(String review_answer_date) {
		this.review_answer_date = review_answer_date;
	}
	public int getReview_show() {
		return review_show;
	}
	public void setReview_show(int review_show) {
		this.review_show = review_show;
	}
	public long getProduct_num() {
		return product_num;
	}
	public void setProduct_num(long product_num) {
		this.product_num = product_num;
	}
	public long getUseridx() {
		return useridx;
	}
	public void setUseridx(long useridx) {
		this.useridx = useridx;
	}
	public long getReview_file_num() {
		return review_file_num;
	}
	public void setReview_file_num(long review_file_num) {
		this.review_file_num = review_file_num;
	}
	public String getReview_file_img() {
		return review_file_img;
	}
	public void setReview_file_img(String review_file_img) {
		this.review_file_img = review_file_img;
	}
	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}
	public String[] getListFilename() {
		return listFilename;
	}
	public void setListFilename(String[] listFilename) {
		this.listFilename = listFilename;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
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
	
	
}
