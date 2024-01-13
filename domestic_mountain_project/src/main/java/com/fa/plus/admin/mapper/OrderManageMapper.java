package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.OrderManage;

@Mapper
public interface OrderManageMapper {
	public List<OrderManage> list_order(Map<String, Object> map) throws SQLException;
	public OrderManage find_by_order_num(long order_num) throws SQLException;
	
	public List<OrderManage> find_order_detail_by_order_num(long order_num) throws SQLException;
	public List<OrderManage> list_company() throws SQLException;
}
