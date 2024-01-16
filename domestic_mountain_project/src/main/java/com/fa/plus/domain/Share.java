package com.fa.plus.domain;

import org.springframework.web.multipart.MultipartFile;

public class Share {

	// post 테이블
	private long post_num;
	private long community_category_num;
	private String post_title;
	private String post_content;
	private long post_reg_id;
	private String post_reg_date;
	private String post_update_date;
	private long post_hit_count;
	private long post_visible;
	private long post_gather;
	
	
	// post_file 테이블
	private long file_num;
	private String saveFilename;
	private String originalFilename;
	private MultipartFile selectFile; // <input type='file' name='selectFile' ..
	
	private String user_name;
	private long useridx;
	private int usership;
	private String user_id;
	
	private long reply_num;
	private long replyCount;
	
	private long post_fileCount;

	private int boardLikeCount;

	
	public int getBoardLikeCount() {
		return boardLikeCount;
	}

	public void setBoardLikeCount(int boardLikeCount) {
		this.boardLikeCount = boardLikeCount;
	}

	
	public long getPost_fileCount() {
		return post_fileCount;
	}

	public void setPost_fileCount(long post_fileCount) {
		this.post_fileCount = post_fileCount;
	}

	public long getReply_num() {
		return reply_num;
	}

	public void setReply_num(long reply_num) {
		this.reply_num = reply_num;
	}

	public long getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(long replyCount) {
		this.replyCount = replyCount;
	}

	public long getPost_num() {
		return post_num;
	}

	public void setPost_num(long post_num) {
		this.post_num = post_num;
	}

	public long getCommunity_category_num() {
		return community_category_num;
	}

	public void setCommunity_category_num(long community_category_num) {
		this.community_category_num = community_category_num;
	}

	public String getPost_title() {
		return post_title;
	}

	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public long getPost_reg_id() {
		return post_reg_id;
	}

	public void setPost_reg_id(long post_reg_id) {
		this.post_reg_id = post_reg_id;
	}

	public String getPost_reg_date() {
		return post_reg_date;
	}

	public void setPost_reg_date(String post_reg_date) {
		this.post_reg_date = post_reg_date;
	}

	public String getPost_update_date() {
		return post_update_date;
	}

	public void setPost_update_date(String post_update_date) {
		this.post_update_date = post_update_date;
	}

	public long getPost_hit_count() {
		return post_hit_count;
	}

	public void setPost_hit_count(long post_hit_count) {
		this.post_hit_count = post_hit_count;
	}

	public long getPost_visible() {
		return post_visible;
	}

	public void setPost_visible(long post_visible) {
		this.post_visible = post_visible;
	}

	public long getPost_gather() {
		return post_gather;
	}

	public void setPost_gather(long post_gather) {
		this.post_gather = post_gather;
	}

	public long getFile_num() {
		return file_num;
	}

	public void setFile_num(long file_num) {
		this.file_num = file_num;
	}

	public MultipartFile getSelectFile() {
		return selectFile;
	}

	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getSaveFilename() {
		return saveFilename;
	}

	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}

	public String getOriginalFilename() {
		return originalFilename;
	}

	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public long getUseridx() {
		return useridx;
	}

	public void setUseridx(long useridx) {
		this.useridx = useridx;
	}

	public int getUsership() {
		return usership;
	}

	public void setUsership(int usership) {
		this.usership = usership;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
}
