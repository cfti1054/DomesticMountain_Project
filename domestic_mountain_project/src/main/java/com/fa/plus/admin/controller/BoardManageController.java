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
	@RequestMapping(value="notice_category_list")
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
	
	@GetMapping("notice_category_update")
	public String notice_category_update(@RequestParam List<String> category_dto, Model model) throws Exception {
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
	
	@GetMapping("notice_category_update_ok")
	public String update_notice_category_ok(@RequestParam List<String> category_list, Model model) throws Exception {
		
		BoardManage dto = new BoardManage();
		try {
			
			for(String s: category_list) {
			}
			
			for(int i = 0; i < category_list.size(); i++) {
				
				if (i % 3 == 0 ) {
					dto.setNotice_category_num(Long.parseLong(category_list.get(i)));
				} else if (i % 3 == 1) {
					dto.setNotice_category_name(category_list.get(i));
				} else if ( i % 3 == 2) {
					dto.setNotice_category_visible(Integer.parseInt(category_list.get(i)));
					service.update_notice_category(dto);
					dto = new BoardManage();
				
				}

			}
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/boardManage/notice_category_list";
	}
	/*
	 						======================공지사항 게시판====================== 
	 */
	@RequestMapping("notice_board_list")
	public String notice_board_list(HttpServletRequest req, Model model) throws Exception {
		List<BoardManage> list = service.list_notice_board();
		
		model.addAttribute("list", list);
		
		
		return ".admin.boardManage.notice_board";
	}
	
	@GetMapping("notice_board_write")
	public String notice_board_write(Model model) throws Exception {
		List<BoardManage> list = service.list_notice_category();
		
		model.addAttribute("list", list);
		model.addAttribute("mode", "write");
		
		return ".admin.boardManage.notice_write";
	}
	
	@PostMapping("notice_board_write")
	public String notice_board_write_submit(BoardManage dto, HttpSession session) throws Exception{
		
		try {
			System.out.println(dto.getNotice_board_invisible_date());
			service.insert_notice_board(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/admin/boardManage/notice_board_list";
	}
	
}
