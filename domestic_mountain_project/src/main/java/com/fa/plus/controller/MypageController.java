package com.fa.plus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fa.plus.domain.EchartMap;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@GetMapping("main")
	public String recommendForm() {
		
		return ".mypage.main";
	}
	
}
