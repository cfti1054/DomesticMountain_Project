package com.fa.plus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/service/*")
public class ServiceController {
	
	@GetMapping("service")
	public String serviceForm() {
		
		return ".service.service";
	}
}
