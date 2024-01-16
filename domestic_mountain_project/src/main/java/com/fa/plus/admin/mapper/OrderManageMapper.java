package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.OrderDetailManage;
import com.fa.plus.admin.domain.OrderManage;


@Mapper
public interface OrderManageMapper {
	public int orderCount(Map<String, Object> map);
	public List<OrderManage> listOrder(Map<String, Object> map);
	public OrderManage findById(String orderNum);
	public List<OrderDetailManage> findByOrderDetails(String orderNum);
	
	public int orderDetailCount(Map<String, Object> map);
	public List<OrderDetailManage> listOrderDetail(Map<String, Object> map);
	
	public void updateOrderState(Map<String, Object> map) throws SQLException;
	public void updateOrderState2(Map<String, Object> map) throws SQLException;
	public int findByTotalCancelAmount(String orderNum);
	public int totalOrderCount(String orderNum);

	public void updateCancelOrder1(Map<String, Object> map) throws SQLException;
	public void updateCancelOrder2(Map<String, Object> map) throws SQLException;
	public void updateCancelDetail1(Map<String, Object> map) throws SQLException;
	public void updateCancelDetail2(Map<String, Object> map) throws SQLException;
	public void updateCancelAmount1(Map<String, Object> map) throws SQLException;
	public void updateCancelAmount2(Map<String, Object> map) throws SQLException;
	public void updateOrderInvoiceNumber1(Map<String, Object> map) throws SQLException;
	public void updateOrderInvoiceNumber2(Map<String, Object> map) throws SQLException;
	public void updateOrderDetailState(Map<String, Object> map) throws SQLException;
	
	public List<Map<String, Object>> listDeliveryCompany();
	public void insertDetailStateInfo(Map<String, Object> map) throws SQLException;
	public List<Map<String, Object>> listDetailStateInfo(long orderDetailNum);
	
	public List<Long> listExpiredPeriodOrder();
	public void updateAutoPurchaseconfirmation(Map<String, Object> map) throws SQLException;
	public void updateAutoPurchaseconfirmation2() throws SQLException;
}
