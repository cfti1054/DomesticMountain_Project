package com.fa.plus.admin.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String list_member(Model model) {
		List<Stats> list = null;
		List<String> name_list = Arrays.asList("10대","20대","30대","40대","50대","60대","70대 이상");
		List<Integer> value_list = Arrays.asList(0, 0, 0, 0, 0, 0, 0);
		
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
			
			
		} catch (Exception e) {
		}
		
		
		model.addAttribute("name_list", name_list);
		model.addAttribute("value_list", value_list);
		
	
		return ".admin.stats.member_main";
	}
	
	@RequestMapping(value = "member_list")
	public String list(@RequestParam(defaultValue = "0") int categoryNum,
			HttpServletRequest req,
			Model model) throws Exception {
		
		List<Stats> list = null;
		try {
			list = service.sort_by_age();
		} catch (Exception e) {
		}
		
		model.addAttribute("list", list);
		
		return "admin/stats/member_list";
	}
	

}
