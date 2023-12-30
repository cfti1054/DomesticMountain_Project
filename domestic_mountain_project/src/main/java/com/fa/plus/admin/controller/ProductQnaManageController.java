package com.fa.plus.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.admin.domain.ProductQNA;
import com.fa.plus.admin.domain.Review;
import com.fa.plus.common.MyUtil;


@Controller
@RequestMapping("/admin/productQna/*")
public class ProductQnaManageController {
	@Autowired
	private MyUtil myUtil;
	
	@GetMapping("review")
	public String reviewList(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "1") int mode,
			HttpServletRequest req,
			Model model) throws Exception {
		
		
		
		return ".admin.productQna.review";
	}
	
	
	@PostMapping("review/answer")
	public String reviewAnswer(Review dto, @RequestParam String page,
			@RequestParam int mode) throws Exception {
		
		
		return null;
	}
	
	
	@GetMapping("review/delete")
	public String reviewDelete(@RequestParam long od_num,
			@RequestParam String page,
			@RequestParam int mode,
			HttpSession session) throws Exception {
		
		
		return null;
	}
	
	@GetMapping("question")
	public String questionList(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "1") int mode,
			HttpServletRequest req,
			Model model) throws Exception {
		
		
		return ".admin.productQna.question";		
	}

	@PostMapping("question/answer")
	public String questionAnswer(ProductQNA dto, @RequestParam String page, 
			@RequestParam int mode,
			HttpSession session) throws Exception {
		
		
		return null;
	}
	
	@GetMapping("question/delete")
	public String questionDelete(@RequestParam long num,
			@RequestParam String page,
			@RequestParam int mode,
			HttpSession session) throws Exception {
		
		return null;
	}
}
