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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@GetMapping("{product}")
	public String buyRequest(@PathVariable String product,
			Model model
			) throws Exception{
		
		try {
			long product_num = Long.parseLong(product);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("product_num", product_num);
			// 상품
			Product dto = service.findById(product_num);
			
			List<Product> list = service.listReview(map);
			
			// 옵션명
			List<Product> listOption = service.listProductOption(product_num);
			
			// 상위 옵션값
			List<Product> listOptionDetail = null;
			if(listOption.size() > 0) {
				listOptionDetail = service.listOptionDetail(listOption.get(0).getOption_num());
			}
			
			List<Product> listOptionDetail1 = null;
	        if (listOption.size() > 1) {
	            listOptionDetail1 = service.listOptionDetail(listOption.get(1).getOption_num());
	        }
			
	        model.addAttribute("list", list);
			model.addAttribute("dto", dto);
			model.addAttribute("listOption", listOption);
			model.addAttribute("listOptionDetail", listOptionDetail);
			model.addAttribute("listOptionDetail1", listOptionDetail1);
			
		} catch (Exception e) {
			return "redirect:/product/product";
		}
		 
		return ".product.order2";
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
		
		Product vo = service.categoryName(category_num);
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		model.addAttribute("category_num", category_num);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".product.product_detail";
	}
	
	
	@GetMapping("buy")
	public String buy() {
		
		return ".product.buy";
	}
	
	@GetMapping("listOptionDetail2")
	@ResponseBody
	public List<Product> listOptionDetail2(
			@RequestParam long option_num,
			@RequestParam long option_num2, 
			@RequestParam long detail_num
			) {
		
		List<Product> list = service.listOptionDetail(option_num2);
		return list;
	}
	
	
	
	
	
	
	
	
	
	
}
