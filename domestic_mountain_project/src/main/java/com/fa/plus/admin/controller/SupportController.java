package com.fa.plus.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	

	// 카테고리 리스트
	@RequestMapping("faq_category_list")
	public String faq_category_list(HttpServletRequest req, Model model) throws Exception {
		List<Support> list = service.list_faq_category();
		
		model.addAttribute("list", list);
		
		return ".admin.support.faq_category";
	}
	
	// 카테고리 추가
	@GetMapping("faq_category_write")
	public String category_write(Model model) throws Exception {

		model.addAttribute("mode","write");
		model.addAttribute("type", "category");

		return "admin/support/write_modal";
	}

	
	// 카테고리 추가
	@PostMapping("faq_category_write")
	public String write_submit(Support dto, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");

		try {

//			dto.setCategory_reg_id(info.getUserId());
			System.out.println(dto.getCategory_name());
			service.insert_faq_category(dto);
		} catch (Exception e) {
		}

		return "redirect:/admin/support/faq_category_list";
	}
	
	// 카테고리 업데이트
	@GetMapping("multi_category")
	public String update_form(@RequestParam List<String> category_dto, Model model) throws Exception {
		List<Support> list = null;
		Support dto = null;
		try {
			list = service.find_by_category_num(category_dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("list", list);
		model.addAttribute("mode", "update");
		for(Support s: list) {
			dto = s;
		}
		model.addAttribute("dto", dto);
		
		return "admin/support/write_modal";
	}
	
	
	@RequestMapping(value="update_category_ok")
	@ResponseBody
	public String update_category_ok(@RequestParam String jsonData, Model model) throws Exception {
		

		return "redirect:/admin/support/faq_category_list";
	}
	/*
	 						===========	===========	FAQ 게시판======================	
	*/
	@RequestMapping("faq_board_list")
	public String faq_board_list(HttpServletRequest req, Model model) throws Exception {
		List<Support> list = service.list_faq_board();
		
		model.addAttribute("list", list);
		
		
		return ".admin.support.faq_board";
	}


	@GetMapping("faq_board_write")
	public String board_write(Model model) throws Exception {
		List<Support> list = service.list_faq_category();
		
		
		model.addAttribute("mode","write");
		model.addAttribute("type", "board");
		model.addAttribute("list", list);

		return ".admin.support.write_modal";
	}
	
	
}
