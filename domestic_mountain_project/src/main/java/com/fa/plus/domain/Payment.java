package com.fa.plus.domain;

public class Payment {
	private long useridx;
	
	// 주문 테이블
	private long order_num;
	private String order_datetime;
	private int order_delete;			// 삭제 여부 : 디폴트 : 0
	private int order_total_money; 		// 총 주문 금액
	private int shipping; 				// 3000원 고정
	private int order_sale;				// 할인 금액
	private int total_amount;			// 총 결제 금액 = 총 주문 금액 + 3000 - 할인 금액
	
	// private int order_point;			// 0
	// private int order_earn;			// 0
	// private String transport_date; 	// 희망 배송일자
	
	
	// 주문 상세 테이블
	private long od_num;
	private int detail_num1;
	private int detail_num2;
	private int od_price;				// 제품 한개 가격
	private int od_count;				// 제품 수량
	private int od_total_amount;		// 제품 총 가격 = 제품 한개 가격 * 제품 수량
	private int change_num;				// 0 : 구매확정 대기
	private long product_num;			// 제품 번호
	private long order_status_update_useridx;	// 기본 : null (관리자 혹은 주문 취소시 사용자 idx가 박힘)
	private String order_status_update_date;	// 주문 변경일
	
	
	
	// 배송 테이블
	private int cp_num;
	private String tracking_no;			// 운송장 번호
	private String reception_datatime;	// 접수 시간
	private int tr_status;				// 1 : 배송준비
	private String completion_datetime;	// 배송완료시간 -> tr_status = 3 일때 업데이트
	private String transports_memo;		// 요청사항
	
	
	
	// 배송지 테이블
	private String address_num;			// 수령인 우편번호
	private String address1;			// 수령인 기본 주소
	private String address2; 			// 수령인 상세 주소
	private String recipient_name;		// 수령인 이름
	private String recipient_phone;		// 수령인 전화번호
	
	
	
	private String product_name;
	private String option_name;
	private String option_name2;
	private String option_value;
	private String option_value2;
	
	
	
	public long getUseridx() {
		return useridx;
	}
	public void setUseridx(long useridx) {
		this.useridx = useridx;
	}
	public long getOrder_num() {
		return order_num;
	}
	public void setOrder_num(long order_num) {
		this.order_num = order_num;
	}
	public String getOrder_datetime() {
		return order_datetime;
	}
	public void setOrder_datetime(String order_datetime) {
		this.order_datetime = order_datetime;
	}
	public int getOrder_delete() {
		return order_delete;
	}
	public void setOrder_delete(int order_delete) {
		this.order_delete = order_delete;
	}
	public int getOrder_total_money() {
		return order_total_money;
	}
	public void setOrder_total_money(int order_total_money) {
		this.order_total_money = order_total_money;
	}
	public int getShipping() {
		return shipping;
	}
	public void setShipping(int shipping) {
		this.shipping = shipping;
	}
	public int getOrder_sale() {
		return order_sale;
	}
	public void setOrder_sale(int order_sale) {
		this.order_sale = order_sale;
	}
	public int getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}
	public long getOd_num() {
		return od_num;
	}
	public void setOd_num(long od_num) {
		this.od_num = od_num;
	}
	public int getDetail_num1() {
		return detail_num1;
	}
	public void setDetail_num1(int detail_num1) {
		this.detail_num1 = detail_num1;
	}
	public int getDetail_num2() {
		return detail_num2;
	}
	public void setDetail_num2(int detail_num2) {
		this.detail_num2 = detail_num2;
	}
	public int getOd_price() {
		return od_price;
	}
	public void setOd_price(int od_price) {
		this.od_price = od_price;
	}
	public int getOd_count() {
		return od_count;
	}
	public void setOd_count(int od_count) {
		this.od_count = od_count;
	}
	public int getOd_total_amount() {
		return od_total_amount;
	}
	public void setOd_total_amount(int od_total_amount) {
		this.od_total_amount = od_total_amount;
	}
	public int getChange_num() {
		return change_num;
	}
	public void setChange_num(int change_num) {
		this.change_num = change_num;
	}
	public long getProduct_num() {
		return product_num;
	}
	public void setProduct_num(long product_num) {
		this.product_num = product_num;
	}
	public long getOrder_status_update_useridx() {
		return order_status_update_useridx;
	}
	public void setOrder_status_update_useridx(long order_status_update_useridx) {
		this.order_status_update_useridx = order_status_update_useridx;
	}
	public String getOrder_status_update_date() {
		return order_status_update_date;
	}
	public void setOrder_status_update_date(String order_status_update_date) {
		this.order_status_update_date = order_status_update_date;
	}
	public int getCp_num() {
		return cp_num;
	}
	public void setCp_num(int cp_num) {
		this.cp_num = cp_num;
	}
	public String getTracking_no() {
		return tracking_no;
	}
	public void setTracking_no(String tracking_no) {
		this.tracking_no = tracking_no;
	}
	public String getReception_datatime() {
		return reception_datatime;
	}
	public void setReception_datatime(String reception_datatime) {
		this.reception_datatime = reception_datatime;
	}
	public int getTr_status() {
		return tr_status;
	}
	public void setTr_status(int tr_status) {
		this.tr_status = tr_status;
	}
	public String getCompletion_datetime() {
		return completion_datetime;
	}
	public void setCompletion_datetime(String completion_datetime) {
		this.completion_datetime = completion_datetime;
	}
	public String getTransports_memo() {
		return transports_memo;
	}
	public void setTransports_memo(String transports_memo) {
		this.transports_memo = transports_memo;
	}
	public String getAddress_num() {
		return address_num;
	}
	public void setAddress_num(String address_num) {
		this.address_num = address_num;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getRecipient_name() {
		return recipient_name;
	}
	public void setRecipient_name(String recipient_name) {
		this.recipient_name = recipient_name;
	}
	public String getRecipient_phone() {
		return recipient_phone;
	}
	public void setRecipient_phone(String recipient_phone) {
		this.recipient_phone = recipient_phone;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getOption_name() {
		return option_name;
	}
	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}
	public String getOption_name2() {
		return option_name2;
	}
	public void setOption_name2(String option_name2) {
		this.option_name2 = option_name2;
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
