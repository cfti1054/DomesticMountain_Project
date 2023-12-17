package com.fa.plus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community/*")
public class RecommendController {
	
	@GetMapping("recommend")
	public String recommendForm() {
		
		return ".community.recommend";
	}
}

