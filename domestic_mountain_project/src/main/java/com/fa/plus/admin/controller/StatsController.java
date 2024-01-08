package com.fa.plus.admin.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.admin.domain.Stats;
import com.fa.plus.admin.service.StatsService;

@Controller
@RequestMapping("/admin/stats/*")
public class StatsController {
	@Autowired
	private StatsService service;
	
	public Integer ageCalc(String birth) {
		int age = 0;
		LocalDate now = LocalDate.now();
		LocalDate parsedBirthDate = LocalDate.parse(birth, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		
		age = now.minusYears(parsedBirthDate.getYear()).getYear();
		
		if(parsedBirthDate.plusYears(age).isAfter(now)) {
			age = age -1;
		}
		
		
		return age;
	}
	
	@RequestMapping("member_main")
	public String list_member(Model model) throws Exception {
		List<Stats> list = null;
		// 회원별 나이 대
		List<String> name_list = Arrays.asList("10대","20대","30대","40대","50대","60대","70대 이상");
		List<Integer> value_list = Arrays.asList(0, 0, 0, 0, 0, 0, 0);
		// 최근 7일간 가입자 수
		List<String> reg_date_list = Arrays.asList("","","","","","","");
		List<Integer> reg_num_list = Arrays.asList(0, 0, 0, 0, 0, 0, 0);
		
		
		try {
			list = service.sort_by_age();
			
			for(Stats dto : list) {
				String s = dto.getAge();
				int input_age = ageCalc(s);
				
				switch(input_age / 10) {
				case 0: value_list.set(0, value_list.get(0) + 1); break;
				case 1: value_list.set(0, value_list.get(0) + 1); break;
				case 2: value_list.set(1, value_list.get(1) + 1); break;
				case 3: value_list.set(2, value_list.get(2) + 1); break;
				case 4: value_list.set(3, value_list.get(3) + 1); break;
				case 5: value_list.set(4, value_list.get(4) + 1); break;
				case 6: value_list.set(5, value_list.get(5) + 1); break;
				case 7: value_list.set(6, value_list.get(6) + 1); break;
				}
			}
			list = null;
			list = service.sort_by_monthly_reg();
			int i = 0;
			for(Stats dto: list) {
				reg_date_list.set(i,dto.getReg_date());
				reg_num_list.set(i,dto.getReg_num());
				i+=1;
			}
			
			
			
		} catch (Exception e) {
		}
		
		
		model.addAttribute("name_list", name_list);
		model.addAttribute("value_list", value_list);
		model.addAttribute("reg_date_list", reg_date_list);
		model.addAttribute("reg_num_list", reg_num_list);
	
		return ".admin.stats.member_main";
	}
	
	
	@RequestMapping("sales_main")
	public String list_sales(Model model) throws Exception {
		List<Stats> list = null;
		List<String> sales_date_list = Arrays.asList("","","","","","","");
		List<Integer> sales_num_list = Arrays.asList(0, 0, 0, 0, 0, 0, 0);
		
		try {
			list = service.sort_by_weekly_sales();
			
			int i = 0;
			for(Stats dto : list) {
				sales_date_list.set(i, dto.getSales_date());
				sales_num_list.set(i, dto.getSales_num());
				i+=1;
			}
			
		} catch (Exception e) {
		}
		
		model.addAttribute("sales_date_list", sales_date_list);
		model.addAttribute("sales_num_list", sales_num_list);
		
		return ".admin.stats.sales_main";
	}
	
	
	

}
