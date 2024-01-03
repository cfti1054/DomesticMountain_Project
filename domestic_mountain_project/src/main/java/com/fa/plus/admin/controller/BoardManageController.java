package com.fa.plus.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.admin.domain.BoardManage;
import com.fa.plus.admin.domain.Support;
import com.fa.plus.admin.service.BoardManageService;

@Controller
@RequestMapping("/admin/boardManage/*")
public class BoardManageController {

	@Autowired
	private BoardManageService service;
	
	// 공지사항 카테고리 리스트
	@GetMapping("notice_category_list")
	public String notice_category_list(HttpServletRequest req, Model model) {
		List<BoardManage> list = null;
		
		try {
			list = service.list_notice_category();
		} catch (Exception e) {
		}
		
		model.addAttribute("list", list);
		
		return ".admin.boardManage.notice_category";
	}
	
	// 공지사항 카테고리 추가 폼
	@GetMapping("notice_category_write")
	public String notice_category_write(@RequestParam String mode, @RequestParam String type, Model model) throws Exception {
		System.out.println(mode);
		System.out.println(type);
		model.addAttribute("mode", mode);
		model.addAttribute("type", type);

		return "admin/boardManage/notice_modal";
	}
	
	// 공지사항 카테고리 추가 확정
	@PostMapping("notice_category_write")
	public String notice_category_write_submit(BoardManage dto, HttpSession session) throws Exception {
		
		try {
			service.insert_notice_category(dto);
		} catch (Exception e) {
		} 
		
		
		return "redirect:/admin/boardManage/notice_category";
	}
	
	@GetMapping("update_inquiry_category")
	public String inquiry_category_update_form(@RequestParam List<String> category_dto, Model model) throws Exception {
		List<BoardManage> list = null;
		BoardManage dto = null;
		try {
			list = service.find_by_category_num(category_dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("list", list);
		model.addAttribute("mode", "update");
		model.addAttribute("type", "category");
		for(BoardManage s: list) {
			dto = s;
		}
		model.addAttribute("dto", dto);
		
		return "admin/boardManage/notice_modal";
	}
	
}
