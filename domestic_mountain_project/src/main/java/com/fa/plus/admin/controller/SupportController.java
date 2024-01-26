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
	
	// 1:1 문의 카테고리 리스트
	@GetMapping("inquiry_category_list")
	public String inquiry_category_list(HttpServletRequest req, Model model) {
		List<Support> list = null;
		
		try {
			list = service.list_inquiry_category();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("list", list);
		
		
		
		return ".admin.support.inquiry_category";
	}
	
	// 1:1 문의 게시판 리스트
	@GetMapping("inquiry_board_list")
	public String inquiry_board_list(HttpServletRequest req, Model model) {
		List<Support> list = null;
		
		try {
			list = service.list_inquiry_board();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("list", list);
		
		return ".admin.support.inquiry_board";
	}
	
	// 카테고리 추가
		@GetMapping("inquiry_category_write")
		public String inquiry_category_write(Model model) throws Exception {

			model.addAttribute("mode","write");
			model.addAttribute("type", "category");

			return "admin/support/inquiry_modal";
		}
	
	// 1:1 문의 카테고리 추가
		@PostMapping("inquiry_category_write")
		public String inquiry_category_write_submit(Support dto, HttpSession session) throws Exception {
			String root = session.getServletContext().getRealPath("/");

			try { 

//				dto.setCategory_reg_id(info.getUserId());

				service.insert_inquiry_category(dto);
			} catch (Exception e) {
			}

			return "redirect:/admin/support/inquiry_category_list";
		}
	
		// 1:1문의 카테고리 업데이트
		@GetMapping("multi_inquiry_category")
		public String inquiry_category_update_form(@RequestParam List<String> category_dto, Model model) throws Exception {
			List<Support> list = null;
			Support dto = null;
			try {
				list = service.find_by_inquiry_category_num(category_dto);
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
			
			return "admin/support/inquiry_modal";
		}
		// 1:1 문의 카테고리 업데이트 완료
		@GetMapping("update_inquiry_category_ok")
		public String update_inquiry_category_ok(@RequestParam List<String> category_list, Model model) throws Exception {
			
			Support dto = new Support();
			try {
				
				for(String s: category_list) {
				}
				
				for(int i = 0; i < category_list.size(); i++) {
					
					if (i % 3 == 0 ) {
						dto.setInquiry_category_num(Long.parseLong(category_list.get(i)));
					} else if (i % 3 == 1) {
						dto.setInquiry_category_name(category_list.get(i));
					} else if ( i % 3 == 2) {
						dto.setInquiry_category_visible(Integer.parseInt(category_list.get(i)));
						service.update_inquiry_category(dto);
						dto = new Support();
					
					}

				}
		
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "redirect:/admin/support/inquiry_category_list";
		}
		
		@GetMapping("show_inquiry_content")
		public String show_inquiry_content(@RequestParam String inquiry_board_num, Model model) throws Exception {
			Support dto = null;
			try {
				
				dto = service.find_by_inquiry_board_num(inquiry_board_num);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			model.addAttribute("dto", dto);
			model.addAttribute("mode", "show");
			model.addAttribute("type", "board");
			
			return "admin/support/inquiry_modal";
		}
		
	@GetMapping("inquiry_answer")
	public String inquiry_answer(@RequestParam String inquiry_board_num, Model model) {
		// 1:1 문의 답변 폼
		Support dto = null;
		model.addAttribute("type", "answer");
		model.addAttribute("mode", "write");
		
		try {
			dto = service.find_by_inquiry_board_num(inquiry_board_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		model.addAttribute("dto", dto);
		
		return "admin/support/inquiry_modal";
	}
	
	@PostMapping("inquiry_answer")
	public String inquiry_answer_submit(Support dto, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");

		try {

//			dto.setCategory_reg_id(info.getUserId());

			service.insert_inquiry_answer(dto);

			
		} catch (Exception e) {
		}

		return "redirect:/admin/support/inquiry_board_list";
	}
	
	@GetMapping("inquiry_answer_update")
	public String inquiry_answer_update(@RequestParam String inquiry_board_num, Model model) {
		// 1:1 문의 답변 폼
		Support dto = null;
		model.addAttribute("type", "answer");
		model.addAttribute("mode", "update");
		
		try {
			dto = service.find_by_answer_num(inquiry_board_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		model.addAttribute("dto", dto);
		
		return "admin/support/inquiry_modal";
	}
	
	@PostMapping("inquiry_answer_update")
	public String inquiry_answer_update_submit(Support dto, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");

		try {

//			dto.setCategory_reg_id(info.getUserId());
			System.out.println("CONTROLLER");
			System.out.println(dto.getInquiry_answer_title());
			System.out.println(dto.getInquiry_answer_content());
			System.out.println(dto.getInquiry_board_num());
			service.update_inquiry_answer(dto);
			
		} catch (Exception e) {
		}

		return "redirect:/admin/support/inquiry_board_list";
	}
	

	// FAQ 카테고리 리스트
	@RequestMapping("faq_category_list")
	public String faq_category_list(HttpServletRequest req, Model model) throws Exception {
		List<Support> list = service.list_faq_category();
		
		model.addAttribute("list", list);
		
		return ".admin.support.faq_category";
	}
	
	// FAQ 카테고리 추가
	@GetMapping("faq_category_write")
	public String category_write(Model model) throws Exception {

		model.addAttribute("mode","write");
		model.addAttribute("type", "category");

		return "admin/support/write_modal";
	}

	
	// FAQ 카테고리 추가
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
			
			for(String s: category_list) {
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
	
	// 카테고리 업데이트
		@GetMapping("multi_board")
		public String board_update_form(@RequestParam List<String> dto_list, Model model) throws Exception {
			List<String> num_list = new ArrayList<String>();
			List<Support> list = null;
			try {
				
				
				for(int i = 0; i < dto_list.size(); i+=7) {
					num_list.add(dto_list.get(i));
					
					
				}
				
				list = service.find_by_board_num(num_list);
				
				model.addAttribute("list", list);
				model.addAttribute("mode", "update");
				model.addAttribute("type", "board");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
			return "admin/support/write_modal";
		}
		
		@GetMapping("update_board_ok")
		public String update_board_ok(@RequestParam List<String> board_list, Model model) throws Exception {
			
			Support dto = new Support();
			try {
				

				
				for(int i = 0; i < board_list.size(); i++) {
					if (i % 4 == 0 ) {
						dto.setFaq_num(Long.parseLong(board_list.get(i)));
					} else if (i % 4 == 1) {
						dto.setFaq_question(board_list.get(i));
					} else if ( i % 4 == 2) {
						dto.setFaq_content(board_list.get(i));
					} else if ( i % 4 == 3) {
						dto.setVisible(Integer.parseInt(board_list.get(i)));
						
						service.update_faq_board(dto);
						dto = new Support();
					}
				}
		
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "redirect:/admin/support/faq_board_list";
		}
		
		@GetMapping("show_content")
		public String show_content(@RequestParam String faq_num, Model model) throws Exception {
			Support dto = null;
			try {
				
				dto = service.show_content(faq_num);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			model.addAttribute("dto", dto);
			model.addAttribute("mode", "show");
			
			return "admin/support/write_modal";
		}
		
		
	
}
