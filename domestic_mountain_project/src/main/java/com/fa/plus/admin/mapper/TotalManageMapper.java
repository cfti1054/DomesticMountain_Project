package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TotalManageMapper {
	public Map<String, Object> todayProduct() throws SQLException;
	public Map<String, Object> thisMonthProduct() throws SQLException;
	public Map<String, Object> previousMonthProduct() throws SQLException;
	
	public List<Map<String, Object>> dayTotalMoney(String date) throws SQLException;
	public List<Map<String, Object>> dayTotalMoney2(String date) throws SQLException;
	public List<Map<String, Object>> monthTotalMoney(String month) throws SQLException;
	public List<Map<String, Object>> monthTotalMoney2(String month) throws SQLException;
	public Map<String, Object> dayOfWeekTotalCount(String month) throws SQLException;
	
	public Map<String, Object> thisMonthMember() throws SQLException;
	public Map<String, Object> lastMonthMember() throws SQLException;
}
