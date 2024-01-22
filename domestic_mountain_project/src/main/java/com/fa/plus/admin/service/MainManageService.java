package com.fa.plus.admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.MemberChart;
import com.fa.plus.admin.domain.Stats;

public interface MainManageService {
	public List<MemberChart> listAgeSection();
	
	//
	public Map<String, Object> todayProduct();
	public Map<String, Object> thisMonthProduct();
	public Map<String, Object> previousMonthProduct();
	
	public List<Map<String, Object>> dayTotalMoney(String date);
	public List<Map<String, Object>> monthTotalMoney(String month);
	public Map<String, Object> dayOfWeekTotalCount(String month);	
	
	
	
	// 통계
	public List<Stats> sort_by_age() throws Exception;
	public List<Stats> sort_by_weekly_reg() throws Exception;
	public List<Stats> sort_by_monthly_reg() throws Exception;
	
	public List<Stats> sort_by_weekly_reg_sum() throws Exception;
	public List<Stats> sort_by_monthly_reg_sum() throws Exception;
	
	public List<Stats> sort_by_weekly_sales() throws Exception;
	public List<Stats> sort_by_weekly_revenue() throws Exception;
	
	public List<Stats> sort_by_weekly_sales_sum() throws Exception;
	public List<Stats> sort_by_weekly_revenue_sum() throws Exception;
	
	public List<Stats> sort_by_monthly_sales() throws Exception;
	public List<Stats> sort_by_monthly_revenue() throws Exception;
	
	public List<Stats> sort_by_monthly_sales_sum() throws Exception;
	public List<Stats> sort_by_monthly_revenue_sum() throws Exception;	
	
	public Map<String, Object> thisMonthMember();
	public Map<String, Object> lastMonthMember();
	
}
