package com.fa.plus.admin.domain;

public class ProductQNA {
	private long num;				// 문의번호
	private long productNum;		// 상품번호
	private String question;		// 질문내용
	private String question_date;	// 질문날짜
	private int secret;				// 비밀글
	private String answer;			// 답변
	private String answer_date;		// 답변날짜
	private long answeridx;			// 답변자_회원번호
	private long questionidx;		// 질문자_회원번호
	
	private String product_name;	// 상품이름	
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public long getProductNum() {
		return productNum;
	}
	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getQuestion_date() {
		return question_date;
	}
	public void setQuestion_date(String question_date) {
		this.question_date = question_date;
	}
	public int getSecret() {
		return secret;
	}
	public void setSecret(int secret) {
		this.secret = secret;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getAnswer_date() {
		return answer_date;
	}
	public void setAnswer_date(String answer_date) {
		this.answer_date = answer_date;
	}
	public long getAnsweridx() {
		return answeridx;
	}
	public void setAnsweridx(long answeridx) {
		this.answeridx = answeridx;
	}
	public long getQuestionidx() {
		return questionidx;
	}
	public void setQuestionidx(long questionidx) {
		this.questionidx = questionidx;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	
	
}
