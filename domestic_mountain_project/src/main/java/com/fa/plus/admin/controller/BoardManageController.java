package com.fa.plus.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fa.plus.admin.domain.BoardManage;
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
	
}
