package com.fa.plus.admin.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.admin.domain.Stats;
import com.fa.plus.admin.service.MainManageService;
import com.fa.plus.admin.service.StatsService;
import com.fa.plus.admin.service.SupportService;

@Controller
public class MainManageController {
	@Autowired
	private MainManageService service3;	
	
	@Autowired
	private SupportService service;	
	
	 
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String method(Model model) {

		Map<String, Object> today = service3.todayProduct();
		Map<String, Object> thisMonth = service3.thisMonthProduct();
		Map<String, Object> previousMonth = service3.previousMonthProduct();
		
		model.addAttribute("today", today);
		model.addAttribute("thisMonth", thisMonth);
		model.addAttribute("previousMonth", previousMonth);
		
		return ".adminLayout";
	}
	
	
	// 분석 통계
	@GetMapping("analysis")
	public String analysis(Model model) throws Exception {

		return ".adminLayout.analysis";
	}	
	

	@GetMapping("/admin/chart")
	@ResponseBody
	public Map<String, Object> total() {
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		int d = cal.get(Calendar.DATE);
		
		String date = String.format("%04d-%02d-%02d", y, m, d);
		String month = String.format("%04d%02d", y, m);
		
		List<Map<String, Object>> days = service3.dayTotalMoney(date);
		List<Map<String, Object>> months = service3.monthTotalMoney(month);
		
		if(d < 20) {
			cal.add(Calendar.MONTH, -1);
			m = cal.get(Calendar.MONTH) + 1;
			month = String.format("%04d%02d", y, m);
		}
		Map<String, Object> dayOfWeek = service3.dayOfWeekTotalCount(month);
		dayOfWeek.put("month", month);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("days", days);
		model.put("months", months);
		model.put("dayOfWeek", dayOfWeek);
		
		return model;
	}
	
	
	
}
