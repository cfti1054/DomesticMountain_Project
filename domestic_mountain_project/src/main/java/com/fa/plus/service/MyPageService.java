package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.MemberManage;
import com.fa.plus.domain.Order;

public interface MyPageService {
	public void insertCart(Order dto) throws Exception;
	public List<Order> listCart(long useridx);
	public void deleteCart(Map<String, Object> map) throws Exception;
	
	public List<MemberManage> listMember(long useridx);
	public MemberManage findById(long useridx); 
}
