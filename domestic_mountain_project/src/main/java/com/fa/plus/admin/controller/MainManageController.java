package com.fa.plus.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fa.plus.admin.domain.Support;
import com.fa.plus.admin.service.SupportService;

@Controller
public class MainManageController {
	
	@Autowired
	private SupportService service;	
	 
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String method() {
		return ".adminLayout";
	}
	
	
	// 분석 통계
	@GetMapping("analysis")
	public String analysis(Model model) throws Exception {

		return ".adminLayout.analysis";
	}	
	
	
	// faq 리스트
	@RequestMapping("faq_board_list")
	public String faq_board_list(HttpServletRequest req, Model model) throws Exception {
		List<Support> list = service.list_faq_board();
		
		model.addAttribute("list", list);
		
		
		return ".admin.support.faq_board";
	}	
}
