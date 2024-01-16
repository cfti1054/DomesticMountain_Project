package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.Order;

public interface OrderService {
	public String productOrderNumber();
	public void insertOrder(Order dto) throws Exception;
	public Order findByMyInformation(long useridx);
	
	public Order findById(long productNum);
	public List<Order> listProduct(List<Map<String, Long>> list);	// 옵션이 두개
	public List<Order> listProduct2(List<Map<String, Long>> list);	// 옵션이 한개
	public Order findByDetailId(long detailNum);
	public List<Order> listOptionDetail(List<Long> detailNums);

	public void deleteCart(Map<String, Object> map) throws Exception;
}
