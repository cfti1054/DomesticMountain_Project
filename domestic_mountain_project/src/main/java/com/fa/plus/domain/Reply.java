package com.fa.plus.domain;

public class Reply {
	private long reply_num;
	private long post_num;
	private long reply_reg_id;
	private long useridx;
	private int reply_secret;
	private String reply_content;
	private String reply_reg_date;
	private String reply_update_date;
	private long reply_report_count;
	private int reply_visible;
	private int reply_answer;
	
	private int answerCount;
	private int likeCount;
	private int disLikeCount;
	
	private int usership;
	private String user_name;
	private String user_id;
	
	
	
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
	public int getReply_answer() {
		return reply_answer;
	}
	public void setReply_answer(int reply_answer) {
		this.reply_answer = reply_answer;
	}
	public long getReply_num() {
		return reply_num;
	}
	public void setReply_num(long reply_num) {
		this.reply_num = reply_num;
	}
	public long getPost_num() {
		return post_num;
	}
	public void setPost_num(long post_num) {
		this.post_num = post_num;
	}
	public long getReply_reg_id() {
		return reply_reg_id;
	}
	public void setReply_reg_id(long reply_reg_id) {
		this.reply_reg_id = reply_reg_id;
	}
	public long getUseridx() {
		return useridx;
	}
	public void setUseridx(long useridx) {
		this.useridx = useridx;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getReply_secret() {
		return reply_secret;
	}
	public void setReply_secret(int reply_secret) {
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
	public int getReply_visible() {
		return reply_visible;
	}
	public void setReply_visible(int reply_visible) {
		this.reply_visible = reply_visible;
	}
	public int getAnswerCount() {
		return answerCount;
	}
	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getDisLikeCount() {
		return disLikeCount;
	}
	public void setDisLikeCount(int disLikeCount) {
		this.disLikeCount = disLikeCount;
	}
	
	
}
