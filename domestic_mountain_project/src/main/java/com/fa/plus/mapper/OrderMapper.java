package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Order;


@Mapper
public interface OrderMapper {
	public String findByMaxOrderNumber();
	public Order findByMyInformation(long useridx);
	
	public void insertOrder(Order dto) throws SQLException;
	// public void insertPayDetail(Order dto) throws SQLException; // 결제 카드 정보 
	public void insertOrderDetail(Order dto) throws SQLException;
	public void insertOrderDelivery(Order dto) throws SQLException;
	
	public List<Order> listProduct(List<Map<String, Long>> list);	// 옵션이 두개
	public List<Order> listProduct2(List<Map<String, Long>> list); 	// 옵션이 하나
	public Order findById(long productNum);
	public List<Order> listOptionDetail(List<Long> detailNums);
	public Order findByDetailId(long detailNum);
}
