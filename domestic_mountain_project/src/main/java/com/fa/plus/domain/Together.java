package com.fa.plus.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Together {
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
	
	private List<MultipartFile> selectFile; // <input type='file' name='selectFile' ..

	// user1
	private String user_name;
	private long useridx;
	private String user_id;

	// userall
	private long usership;
	
	// gather
	private long gather_num;
			//private long post_num;
	private long gather_max;
	private String gather_expire_date;
	private String location_addr;
	private String start_date;
	private String end_date;
	
	// participant
		// participant_num(신청인) : useridx
		// gather_num : 모집 번호
	private long participantCount; // 신청한 인원수
	
	// reply 
	private long reply_secret;
	private String reply_content;
	private String reply_reg_date;
	private String reply_update_date;
	private long reply_report_count;
	private long reply_visible;
		// reply_num : 댓글 번호
		// post_num : 게시글 번호
		// reply_reg_id : 작성자
	
	
	// 댓글
	private long reply_num;
	private long replyCount;
	
	// 사진 개수
	private long post_fileCount;
	
	

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

	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}

	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public long getUseridx() {
		return useridx;
	}

	public void setUseridx(long useridx) {
		this.useridx = useridx;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public long getUsership() {
		return usership;
	}

	public void setUsership(long usership) {
		this.usership = usership;
	}

	public long getGather_num() {
		return gather_num;
	}

	public void setGather_num(long gather_num) {
		this.gather_num = gather_num;
	}

	public long getGather_max() {
		return gather_max;
	}

	public void setGather_max(long gather_max) {
		this.gather_max = gather_max;
	}

	public String getGather_expire_date() {
		return gather_expire_date;
	}

	public void setGather_expire_date(String gather_expire_date) {
		this.gather_expire_date = gather_expire_date;
	}

	public String getLocation_addr() {
		return location_addr;
	}

	public void setLocation_addr(String location_addr) {
		this.location_addr = location_addr;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public long getParticipantCount() {
		return participantCount;
	}

	public void setParticipantCount(long participantCount) {
		this.participantCount = participantCount;
	}

	public long getReply_secret() {
		return reply_secret;
	}

	public void setReply_secret(long reply_secret) {
		this.reply_secret = reply_secret;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public String getReply_reg_date() {
		return reply_reg_date;
	}

	public void setReply_reg_date(String reply_reg_date) {
		this.reply_reg_date = reply_reg_date;
	}

	public String getReply_update_date() {
		return reply_update_date;
	}

	public void setReply_update_date(String reply_update_date) {
		this.reply_update_date = reply_update_date;
	}

	public long getReply_report_count() {
		return reply_report_count;
	}

	public void setReply_report_count(long reply_report_count) {
		this.reply_report_count = reply_report_count;
	}

	public long getReply_visible() {
		return reply_visible;
	}

	public void setReply_visible(long reply_visible) {
		this.reply_visible = reply_visible;
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

	public long getPost_fileCount() {
		return post_fileCount;
	}

	public void setPost_fileCount(long post_fileCount) {
		this.post_fileCount = post_fileCount;
	}
	
	
	
	
}
