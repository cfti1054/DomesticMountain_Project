package com.fa.plus.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fa.plus.admin.domain.Support;
import com.fa.plus.admin.service.SupportService;
import com.fa.plus.common.MyUtil;

@Controller
@RequestMapping("/admin/support/*")
public class SupportController {
	
	@Autowired
	private SupportService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@GetMapping("inquiry_list")
	public String inquiry_list() {
		// 1:1문의 리스트
		
		
		
		return ".admin.support.inquiry_list";
	}
	

	public String inquiry_answer() {
		// 1:1 문의 답변 폼
		
		return "";
	}
	
	@RequestMapping("faq")
	public String list_faq(HttpServletRequest req, Model model) throws Exception {
		List<Support> list = service.list_faq_category();
		
		model.addAttribute("list", list);
		
		
		return ".admin.support.faq_category";
	}
	
}
