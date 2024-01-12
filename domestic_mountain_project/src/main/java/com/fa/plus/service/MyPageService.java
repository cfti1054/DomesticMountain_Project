package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.MemberManage;
import com.fa.plus.domain.Order;

public interface MyPageService {
	public void insertCart(Order dto) throws Exception;	// 카트 등록
	public List<Order> listCart(long useridx);			// 카트 리스트
	public void deleteCart(Map<String, Object> map) throws Exception; // 카트 삭제
	
	public List<MemberManage> listMember(long useridx);	// 회원 리스트
	public MemberManage findById(long useridx);

	public int countPayment(Map<String, Object> map);
	public List<Order> listPayment(Map<String, Object> map);
}
