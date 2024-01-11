package com.fa.plus.domain;

import java.util.List;

public class Order {
	
	// 상품 주문 및 결제에 필요한건 여기에 다 때려넣어주세요.
	//
	
	// 수혁이가 쓰는중...(Controller)
	private int product_price;              // 상품-상품가격
	private int qty;						// 제품수량
	private Long detail_num1;				// 상세번호(색상, 구분)
	private Long detail_num2;				// 상세번호(사이즈)
	private int od_total_amount;			// 각 상품의 총 금액 (상품 가격 * 수량)
	private int sale;						// 할인율
	
	
	
	// 장바구니
	private long useridx;					// 회원번호
		// private Long detail_num1;				// 상세번호(색상, 구분)
		// private Long detail_num2;				// 상세번호(사이즈)
	private long product_num;				// 상품번호
	private String cart_reg_date;			// 등록일자
	private String cart_update_date;		// 수정일자
	//	private int qty;						// 제품수량
	
	// 상품들
	private List<Long> product_nums;		// 상품번호(리스트용)
	private List<Long> detail_nums;			// 상세번호
	private List<Long> detail_nums2;		// 상세번호2
	private List<String> option_values;		// 옵션값
	private List<String> option_values2;	// 옵션값2
	private List<Integer> buyQtys;			// 구매수량
	private List<Integer> od_counts;		// 총 수량
	private List<Integer> od_total_amounts;	// 총 금액
    private List<Integer> product_prices;   // 상품-상품가격
    
	// 상품
	private String product_name;			// 상품이름
	private int od_count;					// 제품 수량
		// private int product_price;              // 상품-상품가격
		// private int od_total_amount;			// 총 금액
	private int od_price;					// 제품단가 - 세일 적용된 가격
	private String option_value;			// 상세옵션값
	private String option_value2;			// 상세옵션값2
	private String product_summary;			// 제품 썸네일
	
	// 찜
	private String zzim_date;				// 찜등록날짜
	private String zzim_update_date;		// 찜수정날짜
	
	// 주문
	private String order_num;				// 주문번호
	private String order_datetime;			// 주문 일시
	private String transport_date;			// 회망배송일자
	private long order_delete;				// 삭제여부
	private int order_total_money;			// 총주문금액
	private int shipping;					// 배송비
	private int order_sale;					// 멤버쉽 총 할인금액
	private int order_point;				// 포인트사용금액
	private int order_earn;					// 총 적립금액
	private int total_amount;				// 총 결제 금액
	
	// 주문 상세
	private long od_num;					// 주문상세번호			
	private long change_num;				// 주문상태번호
	
	
	// 회원 배송지 정보 : user_delivery 테이블
	private long ud_num;					// 배송지 넘버
	private String ud_name;					// 배송지명
	private int ud_addressnum;				// 우편번호
	private String ud_address1;				// 기본주소
	private String ud_address2;				// 상세주소
	private String ud_recipient_name;		// 수령인 
	private String ud_recipient_phone;		// 수령인 전화번호
	private String ud_recipient_phone1;
	private String ud_recipient_phone2;
	private String ud_recipient_phone3;
	private String ud_memo;					// 메모(요청사항)
	private String basics_delivery;			// 기본배송지여부 : T, F
		// useridx : 회원번호
	
	// 배송지 테이블 : delivery 테이블
		// order_num : 배송테이블 기본키
	private int address_num;				// 우편번호
	private String address1;				// 기본주소
	private String address2;				// 상세주소
	private String recipient_name;			// 수령인 
	private String recipient_phone;			// 수령인 전화번호
	
	// 배송 테이블 
		// order_num : 주문번호
	private int cp_num; // 1 : 롯데택배		// 배송회사번호
	private String tracking_no;				// 운송장번호
	private String reception_datatime;		// 접수시간 
	private String tr_status;				// 배송상태
	private String completion_datetime;		// 완료시간
	private String transports_memo;			// 요청사항
	
	
	// 등급 및 세일
	private long rank_num;					// 등급 번호
	private String rank1;					// 등급
		// private int sale;						// 할인율
	
	// user1 user2 테이블
	private String addr1;					// 주소
	private String addr2;					// 상세주소
	private String zip;						// 우편번호
	private String tel;						// 전화번호
	private String tel1;
	private String tel2;
	private String tel3;
	
	
	
	
	
	private String option_name;
	private String option_name2;
	private List<String> option_names;
	private List<String> option_names2;
	
	
	public long getUseridx() {
		return useridx;
	}
	public void setUseridx(long useridx) {
		this.useridx = useridx;
	}
	public Long getDetail_num1() {
		return detail_num1;
	}
	public void setDetail_num1(Long detail_num1) {
		this.detail_num1 = detail_num1;
	}
	public Long getDetail_num2() {
		return detail_num2;
	}
	public void setDetail_num2(Long detail_num2) {
		this.detail_num2 = detail_num2;
	}
	public long getProduct_num() {
		return product_num;
	}
	public void setProduct_num(long product_num) {
		this.product_num = product_num;
	}
	public String getCart_reg_date() {
		return cart_reg_date;
	}
	public void setCart_reg_date(String cart_reg_date) {
		this.cart_reg_date = cart_reg_date;
	}
	public String getCart_update_date() {
		return cart_update_date;
	}
	public void setCart_update_date(String cart_update_date) {
		this.cart_update_date = cart_update_date;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getZzim_date() {
		return zzim_date;
	}
	public void setZzim_date(String zzim_date) {
		this.zzim_date = zzim_date;
	}
	public String getZzim_update_date() {
		return zzim_update_date;
	}
	public void setZzim_update_date(String zzim_update_date) {
		this.zzim_update_date = zzim_update_date;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public List<Long> getProduct_nums() {
		return product_nums;
	}
	public void setProduct_nums(List<Long> product_nums) {
		this.product_nums = product_nums;
	}
	public List<Long> getDetail_nums() {
		return detail_nums;
	}
	public void setDetail_nums(List<Long> detail_nums) {
		this.detail_nums = detail_nums;
	}
	public List<Long> getDetail_nums2() {
		return detail_nums2;
	}
	public void setDetail_nums2(List<Long> detail_nums2) {
		this.detail_nums2 = detail_nums2;
	}
	public List<String> getOption_values() {
		return option_values;
	}
	public void setOption_values(List<String> option_values) {
		this.option_values = option_values;
	}
	public List<String> getOption_values2() {
		return option_values2;
	}
	public void setOption_values2(List<String> option_values2) {
		this.option_values2 = option_values2;
	}
	public List<Integer> getBuyQtys() {
		return buyQtys;
	}
	public void setBuyQtys(List<Integer> buyQtys) {
		this.buyQtys = buyQtys;
	}
	public long getOd_num() {
		return od_num;
	}
	public void setOd_num(long od_num) {
		this.od_num = od_num;
	}
	public long getChange_num() {
		return change_num;
	}
	public void setChange_num(long change_num) {
		this.change_num = change_num;
	}
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public String getOrder_datetime() {
		return order_datetime;
	}
	public void setOrder_datetime(String order_datetime) {
		this.order_datetime = order_datetime;
	}
	public String getTransport_date() {
		return transport_date;
	}
	public void setTransport_date(String transport_date) {
		this.transport_date = transport_date;
	}
	public long getOrder_delete() {
		return order_delete;
	}
	public void setOrder_delete(long order_delete) {
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
	public int getOrder_point() {
		return order_point;
	}
	public void setOrder_point(int order_point) {
		this.order_point = order_point;
	}
	public int getOrder_earn() {
		return order_earn;
	}
	public void setOrder_earn(int order_earn) {
		this.order_earn = order_earn;
	}
	public int getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}
	public int getOd_price() {
		return od_price;
	}
	public void setOd_price(int od_price) {
		this.od_price = od_price;
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
	public long getUd_num() {
		return ud_num;
	}
	public void setUd_num(long ud_num) {
		this.ud_num = ud_num;
	}
	public String getUd_name() {
		return ud_name;
	}
	public void setUd_name(String ud_name) {
		this.ud_name = ud_name;
	}
	public int getUd_addressnum() {
		return ud_addressnum;
	}
	public void setUd_addressnum(int ud_addressnum) {
		this.ud_addressnum = ud_addressnum;
	}
	public String getUd_address1() {
		return ud_address1;
	}
	public void setUd_address1(String ud_address1) {
		this.ud_address1 = ud_address1;
	}
	public String getUd_address2() {
		return ud_address2;
	}
	public void setUd_address2(String ud_address2) {
		this.ud_address2 = ud_address2;
	}
	public String getUd_recipient_name() {
		return ud_recipient_name;
	}
	public void setUd_recipient_name(String ud_recipient_name) {
		this.ud_recipient_name = ud_recipient_name;
	}
	public String getUd_recipient_phone() {
		return ud_recipient_phone;
	}
	public void setUd_recipient_phone(String ud_recipient_phone) {
		this.ud_recipient_phone = ud_recipient_phone;
	}
	public String getUd_memo() {
		return ud_memo;
	}
	public void setUd_memo(String ud_memo) {
		this.ud_memo = ud_memo;
	}
	public String getBasics_delivery() {
		return basics_delivery;
	}
	public void setBasics_delivery(String basics_delivery) {
		this.basics_delivery = basics_delivery;
	}
	public int getAddress_num() {
		return address_num;
	}
	public void setAddress_num(int address_num) {
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
	public String getTr_status() {
		return tr_status;
	}
	public void setTr_status(String tr_status) {
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
	public List<Integer> getOd_counts() {
		return od_counts;
	}
	public void setOd_counts(List<Integer> od_counts) {
		this.od_counts = od_counts;
	}
	public List<Integer> getOd_total_amounts() {
		return od_total_amounts;
	}
	public void setOd_total_amounts(List<Integer> od_total_amounts) {
		this.od_total_amounts = od_total_amounts;
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
	public String getRank1() {
		return rank1;
	}
	public void setRank1(String rank1) {
		this.rank1 = rank1;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	public List<Integer> getProduct_prices() {
		return product_prices;
	}
	public void setProduct_prices(List<Integer> product_prices) {
		this.product_prices = product_prices;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_summary() {
		return product_summary;
	}
	public void setProduct_summary(String product_summary) {
		this.product_summary = product_summary;
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
	public List<String> getOption_names() {
		return option_names;
	}
	public void setOption_names(List<String> option_names) {
		this.option_names = option_names;
	}
	public List<String> getOption_names2() {
		return option_names2;
	}
	public void setOption_names2(List<String> option_names2) {
		this.option_names2 = option_names2;
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
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getUd_recipient_phone1() {
		return ud_recipient_phone1;
	}
	public void setUd_recipient_phone1(String ud_recipient_phone1) {
		this.ud_recipient_phone1 = ud_recipient_phone1;
	}
	public String getUd_recipient_phone2() {
		return ud_recipient_phone2;
	}
	public void setUd_recipient_phone2(String ud_recipient_phone2) {
		this.ud_recipient_phone2 = ud_recipient_phone2;
	}
	public String getUd_recipient_phone3() {
		return ud_recipient_phone3;
	}
	public void setUd_recipient_phone3(String ud_recipient_phone3) {
		this.ud_recipient_phone3 = ud_recipient_phone3;
	}
	public long getRank_num() {
		return rank_num;
	}
	public void setRank_num(long rank_num) {
		this.rank_num = rank_num;
	}
	
	
}
