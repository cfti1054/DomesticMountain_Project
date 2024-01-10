package com.fa.plus.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.OrderManage;
import com.fa.plus.admin.mapper.OrderManageMapper;

@Service
public class OrderManageServiceImpl implements OrderManageService {

	@Autowired
	private OrderManageMapper mapper;
	
	@Override
	public List<OrderManage> list_order() throws Exception {
		List<OrderManage> list = null;
		
		try {
			list = mapper.list_order();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
