package com.fa.plus.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.Stats;
import com.fa.plus.admin.mapper.StatsMapper;

@Service
public class StatsServiceImpl implements StatsService {

	@Autowired
	private StatsMapper mapper;
	
	@Override
	public List<Stats> sort_by_age() throws Exception {
		List<Stats> list = null;
		
		try {
			list = mapper.sort_by_age();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Stats> sort_by_weekly_reg() throws Exception {
		List<Stats> list = null;
		
		try {
			list = mapper.sort_by_weekly_reg();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Stats> sort_by_monthly_reg() throws Exception {
			List<Stats> list = null;
		
		try {
			list = mapper.sort_by_monthly_reg();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Stats> sort_by_weekly_sales() throws Exception {
		List<Stats> list = null;
		
		try {
			list = mapper.sort_by_weekly_sales();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Stats> sort_by_weekly_revenue() throws Exception {
		List<Stats> list = null;
		
		try {
			list = mapper.sort_by_weekly_revenue();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Stats> sort_by_weekly_sales_sum() throws Exception {
		List<Stats> list = null;
		
		try {
			list = mapper.sort_by_weekly_sales_sum();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Stats> sort_by_weekly_revenue_sum() throws Exception {
		List<Stats> list = null;
		
		try {
			list = mapper.sort_by_weekly_revenue_sum();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Stats> sort_by_monthly_sales() throws Exception {
		List<Stats> list = null;
		
		try {
			list = mapper.sort_by_monthly_sales();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Stats> sort_by_monthly_revenue() throws Exception {
		List<Stats> list = null;
		
		try {
			list = mapper.sort_by_monthly_revenue();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Stats> sort_by_monthly_sales_sum() throws Exception {
		List<Stats> list = null;
		
		try {
			list = mapper.sort_by_monthly_sales_sum();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Stats> sort_by_monthly_revenue_sum() throws Exception {
		List<Stats> list = null;
		
		try {
			list = mapper.sort_by_monthly_revenue_sum();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
