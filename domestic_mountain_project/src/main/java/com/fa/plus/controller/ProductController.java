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
	
	@GetMapping("product")
	public String product() {
		return ".product.product";
	}
	
	@GetMapping("product_detail")
	public String product_detail() {
		return ".product.product_detail";
	}
	
	
	
	
}
