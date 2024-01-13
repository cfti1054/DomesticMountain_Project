package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.OrderManage;
import com.fa.plus.admin.mapper.OrderManageMapper;

@Service
public class OrderManageServiceImpl implements OrderManageService {

	@Autowired
	private OrderManageMapper mapper;
	
	@Override
	public List<OrderManage> list_order(Map<String, Object> map) throws Exception {
		List<OrderManage> list = null;
		
		try {
			list = mapper.list_order(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<OrderManage> find_order_detail_by_order_num(String order_num) throws Exception {
		List<OrderManage> list = null;
		
		try {
			Long l = Long.parseLong(order_num);
			list = mapper.find_order_detail_by_order_num(l);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public OrderManage find_by_order_num(String order_num) throws Exception {
		OrderManage dto = null;
		
		try {
			Long l = Long.parseLong(order_num);
			dto = mapper.find_by_order_num(l);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<OrderManage> list_company() throws Exception {
		List<OrderManage> list = null;
		
		try {
			list = mapper.list_company();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
