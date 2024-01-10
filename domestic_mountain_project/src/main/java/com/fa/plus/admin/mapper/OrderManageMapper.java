package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.OrderManage;

@Mapper
public interface OrderManageMapper {

	public List<OrderManage> list_order() throws SQLException;
}
