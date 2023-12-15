package com.fa.plus.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product/*")
public class productController {
	
	@Autowired
	// private MemberService service;
	
	@GetMapping("product2")
	public String product() {
		return ".product2.product3";
	}
	
	
	
	@GetMapping("product3")
	public String product_detail() {
		return ".product2.product_detail";
	}
	
	
	
}
