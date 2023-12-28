package com.fa.plus.admin.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ProductManage {
	private long product_num; 			// 상품코드(pk)
	private long category_num; 			// 카테고리 번호(pk)
	private String category_name; 		// 카테고리이름
	private long category_order; 		// 순서
	private long parent_num; 			// 부모번호
	
	private String product_reg_date; 	// 등록일 상품등록일
	private int product_status; 		// 이게 진열상태? 보이기 상품출력여부
	private int total_stock; 			// 재고
	private int product_price; 			// 금액 상품가격
	private String product_name; 		// 이름
	private String product_content;		// 상품상세설명
	
	private String product_summary; 	// 이미지 상품간단설명
	private String product_modify_date; // 수정일 상품최종수정시간
	private long product_hit; 			// 조회수 상품조회수
	
	private long product_insertIdx; 	// 상품등록회원번호? 
	private long product_updateIdx; 	// 상품수정회원번호??
	// 이 두개는 왜있지?? 어짜피 관리자밖에 없지 않나?
	// 아마 직원이 수정하거나 관리자가 더 있으면 누가 수정했는지 보려고? 뇌피셜임
	
	// stock 테이블
	private long stock_num; 			// 재고 번호(pk)
	private long detail_num; 			// 색상
	private long detail_num2; 			// 사이즈
	private List<Long> detail_nums;
	private List<String> option_values;
	private List<Long> detail_nums2;
	private List<String> option_values2;	
	
	// productOption 테이블
	private long option_num; 			// 옵션번호(pk)
	private String option_name; 		// 옵션 이름 [구분 / 색상 / 사이즈]
	private long parent;				// 상위옵션
	private long option_num2;
	private String option_name2;	
	
	// OptionDetail 테이블
	private String option_value; 		// [FREE, 색상종류, 사이즈종류 등]

	private long file_num; 				// 파일번호
	private String file_name; 			// 파일이름
	
	// * 파일 처리 * 
	private String thumbnail;			
	private MultipartFile thumbnailFile;
	
	private long fileNum;
	private String filename;
	private List<MultipartFile> addFiles;	
	
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

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public long getCategory_order() {
		return category_order;
	}

	public void setCategory_order(long category_order) {
		this.category_order = category_order;
	}

	public long getParent_num() {
		return parent_num;
	}

	public void setParent_num(long parent_num) {
		this.parent_num = parent_num;
	}

	public String getProduct_content() {
		return product_content;
	}

	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}

	public long getParent() {
		return parent;
	}

	public void setParent(long parent) {
		this.parent = parent;
	}

	public String getOption_value() {
		return option_value;
	}

	public void setOption_value(String option_value) {
		this.option_value = option_value;
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

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public MultipartFile getThumbnailFile() {
		return thumbnailFile;
	}

	public void setThumbnailFile(MultipartFile thumbnailFile) {
		this.thumbnailFile = thumbnailFile;
	}

	public long getFileNum() {
		return fileNum;
	}

	public void setFileNum(long fileNum) {
		this.fileNum = fileNum;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public List<MultipartFile> getAddFiles() {
		return addFiles;
	}

	public void setAddFiles(List<MultipartFile> addFiles) {
		this.addFiles = addFiles;
	}

	public List<Long> getDetail_nums() {
		return detail_nums;
	}

	public void setDetail_nums(List<Long> detail_nums) {
		this.detail_nums = detail_nums;
	}

	public List<String> getOption_values() {
		return option_values;
	}

	public void setOption_values(List<String> option_values) {
		this.option_values = option_values;
	}

	public List<Long> getDetail_nums2() {
		return detail_nums2;
	}

	public void setDetail_nums2(List<Long> detail_nums2) {
		this.detail_nums2 = detail_nums2;
	}

	public List<String> getOption_values2() {
		return option_values2;
	}

	public void setOption_values2(List<String> option_values2) {
		this.option_values2 = option_values2;
	}

	public long getOption_num2() {
		return option_num2;
	}

	public void setOption_num2(long option_num2) {
		this.option_num2 = option_num2;
	}

	public String getOption_name2() {
		return option_name2;
	}

	public void setOption_name2(String option_name2) {
		this.option_name2 = option_name2;
	}

	
}
