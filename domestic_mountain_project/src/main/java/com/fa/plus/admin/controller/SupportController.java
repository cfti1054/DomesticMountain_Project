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
		model.addAttribute("type", "category");
		for(Support s: list) {
			dto = s;
		}
		model.addAttribute("dto", dto);
		
		return "admin/support/write_modal";
	}
	
	
	@GetMapping("update_category_ok")
	public String update_category_ok(@RequestParam List<String> category_list, Model model) throws Exception {
		
		Support dto = new Support();
		try {
			System.out.println("category_list = ");
			for(String s: category_list) {
				System.out.println(s);
			}
			
			for(int i = 0; i < category_list.size(); i++) {
				
				if (i % 3 == 0 ) {
					dto.setFaq_category_num(Long.parseLong(category_list.get(i)));
				} else if (i % 3 == 1) {
					dto.setCategory_name(category_list.get(i));
				} else if ( i % 3 == 2) {
					dto.setCategory_visible(Integer.parseInt(category_list.get(i)));
					service.update_faq_category(dto);
					dto = new Support();
				
				}
				
				
			}
			
		
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		

			
			
		
		
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

		return "admin/support/write_modal";
	}
	
	@PostMapping("faq_board_write")
	public String board_write_submit(@RequestParam String faq_category_num,Support dto, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");

		try {


			service.insert_faq_board(dto);
		} catch (Exception e) {
		}

		return "redirect:/admin/support/faq_board_list";
	}
	
}
