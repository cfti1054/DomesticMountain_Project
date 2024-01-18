package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.MemberChart;
import com.fa.plus.admin.domain.Stats;
import com.fa.plus.admin.mapper.MemberManageMapper;
import com.fa.plus.admin.mapper.StatsMapper;
import com.fa.plus.admin.mapper.TotalManageMapper;

@Service
public class MainManageServiceImpl implements MainManageService {
	@Autowired
	private MemberManageMapper mapper;
	
	@Autowired
	private StatsMapper mapper2;	
	
	@Autowired
	private TotalManageMapper mapper3;	
	
	@Override
	public List<MemberChart> listAgeSection() {
		List<MemberChart> list = null;
		
		try {
			list = mapper.listAgeSection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Stats> sort_by_age() throws Exception {
		List<Stats> list = null;
		
		try {
			list = mapper2.sort_by_age();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Stats> sort_by_weekly_reg() throws Exception {
		List<Stats> list = null;
		
		try {
			list = mapper2.sort_by_weekly_reg();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Stats> sort_by_monthly_reg() throws Exception {
			List<Stats> list = null;
		
		try {
			list = mapper2.sort_by_monthly_reg();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Stats> sort_by_weekly_sales() throws Exception {
		List<Stats> list = null;
		
		try {
			list = mapper2.sort_by_weekly_sales();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Stats> sort_by_weekly_revenue() throws Exception {
		List<Stats> list = null;
		
		try {
			list = mapper2.sort_by_weekly_revenue();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Stats> sort_by_weekly_sales_sum() throws Exception {
		List<Stats> list = null;
		
		try {
			list = mapper2.sort_by_weekly_sales_sum();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Stats> sort_by_weekly_revenue_sum() throws Exception {
		List<Stats> list = null;
		
		try {
			list = mapper2.sort_by_weekly_revenue_sum();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Stats> sort_by_monthly_sales() throws Exception {
		List<Stats> list = null;
		
		try {
			list = mapper2.sort_by_monthly_sales();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Stats> sort_by_monthly_revenue() throws Exception {
		List<Stats> list = null;
		
		try {
			list = mapper2.sort_by_monthly_revenue();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Stats> sort_by_monthly_sales_sum() throws Exception {
		List<Stats> list = null;
		
		try {
			list = mapper2.sort_by_monthly_sales_sum();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Stats> sort_by_monthly_revenue_sum() throws Exception {
		List<Stats> list = null;
		
		try {
			list = mapper2.sort_by_monthly_revenue_sum();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Stats> sort_by_weekly_reg_sum() throws Exception {
		List<Stats> list = null;
		
		try {
			list = mapper2.sort_by_weekly_reg_sum();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Stats> sort_by_monthly_reg_sum() throws Exception {
		List<Stats> list = null;
		
		try {
			list = mapper2.sort_by_monthly_reg_sum();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	//
	@Override
	public Map<String, Object> todayProduct() {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = mapper3.todayProduct();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> thisMonthProduct() {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = mapper3.thisMonthProduct();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> previousMonthProduct() {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = mapper3.previousMonthProduct();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}
	
	@Override
	public List<Map<String, Object>> dayTotalMoney(String date) {
		List<Map<String, Object>> list = null;
		
		try {
			list = mapper3.dayTotalMoney(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Map<String, Object>> monthTotalMoney(String month) {
		List<Map<String, Object>> list = null;
		
		try {
			list = mapper3.monthTotalMoney(month);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Map<String, Object> dayOfWeekTotalCount(String month) {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = mapper3.dayOfWeekTotalCount(month);
			
			/*
			long total = ((BigDecimal) resultMap.get("TOTAL")).longValue();
			long sun = ((BigDecimal) resultMap.get("SUN")).longValue();
			long mon = ((BigDecimal) resultMap.get("MON")).longValue();
			long tuh = ((BigDecimal) resultMap.get("TUE")).longValue();
			long wed = ((BigDecimal) resultMap.get("WED")).longValue();
			long thu = ((BigDecimal) resultMap.get("THU")).longValue();
			long fri = ((BigDecimal) resultMap.get("FRI")).longValue();
			long sat = ((BigDecimal) resultMap.get("SAT")).longValue();
			*/
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}

}
