package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.Stats;

@Mapper
public interface StatsMapper {
	
	public List<Stats> sort_by_age() throws SQLException;
	public List<Stats> sort_by_weekly_reg() throws SQLException;
	public List<Stats> sort_by_monthly_reg() throws SQLException;
	
	public List<Stats> sort_by_weekly_sales() throws SQLException;
}
