package com.fa.plus.domain;

import java.util.List;

public class Order {
	
	// 상품 주문 및 결제에 필요한건 여기에 다 때려넣어주세요.
	//
	
	// 장바구니
	private long useridx;					// 회원번호
	private Long detail_num1;				// 상세번호(색상, 구분)
	private Long detail_num2;				// 상세번호(사이즈)
	private long product_num;				// 상품번호
	private String cart_reg_date;			// 등록일자
	private String cart_update_date;		// 수정일자
	private int qty;						// 제품수량
	
	private String product_name;			// 상품이름
	private List<Long> product_nums;		// 상품번호(리스트용)
	private List<Long> detail_nums;			// 상세번호
	private List<Long> detail_nums2;		// 상세번호2
	private List<String> option_values;		// 옵션값
	private List<String> option_values2;	// 옵션값2
	private List<Integer> buyQtys;			// 구매수량
	private List<Integer> od_count;			// 제품수량
	private List<Integer> od_total_amount;	// 총 금액
	private int od_price;					// 제품단가
	private String option_value;			// 상세옵션값
	private String option_value2;			// 상세옵션값2
	
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
	public List<Integer> getOd_count() {
		return od_count;
	}
	public void setOd_count(List<Integer> od_count) {
		this.od_count = od_count;
	}
	public List<Integer> getOd_total_amount() {
		return od_total_amount;
	}
	public void setOd_total_amount(List<Integer> od_total_amount) {
		this.od_total_amount = od_total_amount;
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
	
	
}
