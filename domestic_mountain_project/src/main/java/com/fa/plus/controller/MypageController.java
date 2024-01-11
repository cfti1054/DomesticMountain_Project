package com.fa.plus.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.admin.domain.MemberManage;
import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.Order;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.service.MyPageService;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	@Autowired
	private MyPageService service;
	
	@Autowired
	private MyUtil myUtil;	
	
	@GetMapping("main")
	public String recommendForm(HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("loginUser");
		
		List<MemberManage> list = service.listMember(info.getUseridx());
		
		model.addAttribute("list", list);
		
		return ".mypage.main";		
	}
	
	/*
	// 회원리스트 - 메인으로 가야해서 이동
	@GetMapping("list")
	public String listMember(HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("loginUser");
		
		List<MemberManage> list = service.listMember(info.getUseridx());
		
		model.addAttribute("list", list);
		
		return ".mypage.main";
	}
	*/
	
	// 상품 장바구니
	@GetMapping("cart")
	public String listCart(HttpSession session,
			Model model) throws Exception {
			
		SessionInfo info = (SessionInfo)session.getAttribute("loginUser");

		List<Order> list = service.listCart(info.getUseridx());
		
		model.addAttribute("list", list);
		
		return ".mypage.cart";
	}	
	
	@PostMapping("saveCart")
	public String saveCart(Order dto,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("loginUser");
		
		try {
			dto.setUseridx(info.getUseridx());
			
			service.insertCart(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/mypage/cart"; 
	}	
	
	
	
}
