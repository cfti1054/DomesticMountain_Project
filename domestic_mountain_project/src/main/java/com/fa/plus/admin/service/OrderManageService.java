package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.OrderManage;

public interface OrderManageService {
	public List<OrderManage> list_order(Map<String, Object> map) throws Exception;
	public OrderManage find_by_order_num(String order_num) throws Exception;
	
	public List<OrderManage> find_order_detail_by_order_num(String order_num) throws Exception;
	public List<OrderManage> list_company() throws Exception;
}
