package com.fa.plus.admin.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fa.plus.common.MyUtil;


@Controller
@RequestMapping("/admin/product/*")
public class ProductManageController {
//	@Autowired
//	private ProductManageService service;
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
	
	@RequestMapping("{category}/list")
	public String list() {
		
		return ".admin.product.product_list";
	}
	
	/*
	@GetMapping("{category}/write")
	public String writeForm() {
		
		return ".admin.product.write";
	}
	
	@PostMapping("{category}/write")
	public String writeSubmit() {
		
		return "redirect:/admin/product/all/product_list";
	}
	*/
	
}
