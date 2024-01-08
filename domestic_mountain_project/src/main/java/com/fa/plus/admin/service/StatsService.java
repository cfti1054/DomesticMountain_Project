package com.fa.plus.admin.service;

import java.util.List;

import com.fa.plus.admin.domain.Stats;

public interface StatsService {
	public List<Stats> sort_by_age() throws Exception;
	public List<Stats> sort_by_weekly_reg() throws Exception;
	public List<Stats> sort_by_monthly_reg() throws Exception;
	
	public List<Stats> sort_by_weekly_sales() throws Exception;
}
