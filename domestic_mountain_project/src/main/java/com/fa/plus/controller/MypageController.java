package com.fa.plus.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String recommendForm() {
		
		return ".mypage.main";
	}
	
	
	// 상품 장바구니
	@GetMapping("cart")
	public String listCart(HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("loginUser");
		
		List<Order> list = service.listCart(info.getUseridx());
		
		model.addAttribute("list", list);
		
		return ".mypage.cart";
	}	
	
	
	
}
