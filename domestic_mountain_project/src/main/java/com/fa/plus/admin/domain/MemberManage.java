package com.fa.plus.admin.domain;

public class MemberManage {
	private long useridx;		// 회원번호
	private long usership;		// 회원권한
	
	private String user_id; 	// 회원아이디
	private String user_name; 	// 회원이름
	private int enabled; 		// 로그인 가능 여부
	private String reg_date; 	// 가입일
	private String pwd_date; 	// 비밀번호 변경일
	
	private String birth;	// 생일
	private String email;	// 이메일
	private String addr1;	// 주소
	private String addr2;	// 상세주소
	private String zip;		// 우편번호
	private String tel;		// 전화번호
	
	private long state;				// 상태번호
	private int is_blocked;			// 차단여부
	private String blocked_reason;	// 차단사유
	private String blocked_date;	// 상태변경일
	private String unblocked_date;	// 차단해제일
	
	private long uph_num;			// 등급변경번호
	private long rank_num;			// 등급번호
	private String update_rank;		// 등급변동날짜
	
	private String rank1;			// 등급
	private long base_order_money;  // 기준 주문금액
	private long sale;				// 할인율
	
	
	public String getBlocked_date() {
		return blocked_date;
	}
	public void setBlocked_date(String blocked_date) {
		this.blocked_date = blocked_date;
	}
	public long getUseridx() {
		return useridx;
	}
	public void setUseridx(long useridx) {
		this.useridx = useridx;
	}
	public long getUsership() {
		return usership;
	}
	public void setUsership(long usership) {
		this.usership = usership;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getPwd_date() {
		return pwd_date;
	}
	public void setPwd_date(String pwd_date) {
		this.pwd_date = pwd_date;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public long getState() {
		return state;
	}
	public void setState(long state) {
		this.state = state;
	}
	public int getIs_blocked() {
		return is_blocked;
	}
	public void setIs_blocked(int is_blocked) {
		this.is_blocked = is_blocked;
	}
	public String getBlocked_reason() {
		return blocked_reason;
	}
	public void setBlocked_reason(String blocked_reason) {
		this.blocked_reason = blocked_reason;
	}
	public String getUnblocked_date() {
		return unblocked_date;
	}
	public void setUnblocked_date(String unblocked_date) {
		this.unblocked_date = unblocked_date;
	}
	public long getUph_num() {
		return uph_num;
	}
	public void setUph_num(long uph_num) {
		this.uph_num = uph_num;
	}
	public long getRank_num() {
		return rank_num;
	}
	public void setRank_num(long rank_num) {
		this.rank_num = rank_num;
	}
	public String getUpdate_rank() {
		return update_rank;
	}
	public void setUpdate_rank(String update_rank) {
		this.update_rank = update_rank;
	}
	public String getRank1() {
		return rank1;
	}
	public void setRank1(String rank1) {
		this.rank1 = rank1;
	}
	public long getBase_order_money() {
		return base_order_money;
	}
	public void setBase_order_money(long base_order_money) {
		this.base_order_money = base_order_money;
	}
	public long getSale() {
		return sale;
	}
	public void setSale(long sale) {
		this.sale = sale;
	}
		
}
