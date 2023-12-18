package com.fa.plus.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.Product;
import com.fa.plus.service.ProductService;


@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@Autowired
	@Qualifier("myUtil")
	private MyUtil myUtil;
	
	@GetMapping("product")
	public String product() {
		return ".product.product";
	}
	
	@GetMapping("order")
	public String order() {
		return ".product.order";
	}
	
	@RequestMapping("product_detail")
	public String main(
			@RequestParam(defaultValue = "1") long category_num,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int size = 6;
		int total_page;
		int dataCount;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category_num", category_num);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Product> list = service.listProduct(map);
		
		String listUrl = cp + "/product/product_detail?category_num="+category_num;
		
		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("category_num", category_num);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".product.product_detail";
	}
	
	
	/*
	@GetMapping("product_detail")
	public String product_detail() {
		
		return ".product.product_detail";
	}
	*/
	
	
	
}
