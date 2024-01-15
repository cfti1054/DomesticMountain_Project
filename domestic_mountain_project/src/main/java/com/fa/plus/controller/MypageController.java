package com.fa.plus.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.fa.plus.domain.Zzim;
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
	
	// 장바구니 상품 리스트
	@GetMapping("cart")
	public String listCart(HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("loginUser");
		
		List<Order> list = service.listCart(info.getUseridx());
		
		model.addAttribute("list", list);
		
		return ".mypage.cart";
	}	
	
	// 장바구니 등록
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
	
	// 장바구니 등록된 상품 삭제
	@GetMapping("deleteCart")
	public String deleteCart(
			@RequestParam long detail_num2,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("loginUser");
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("gubun", "item");
			map.put("useridx", info.getUseridx());
			map.put("detail_num2", detail_num2);
			
			service.deleteCart(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return "redirect:/mypage/cart"; 
	}	
	
	// 장바구니 선택한 상품 삭제
	@PostMapping("deleteListCart")
	public String deleteListCart(
			@RequestParam List<Long> nums,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("loginUser");
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("gubun", "list");
			map.put("useridx", info.getUseridx());
			map.put("list", nums);
			
			service.deleteCart(map);
			
		} catch (Exception e) {
		}
		
		return "redirect:/mypage/cart"; 
	}	
	
	// 장바구니 상품 모두 삭제
	@GetMapping("deleteCartAll")
	public String deleteCartAll(
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("loginUser");
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("gubun", "all");
			map.put("useridx", info.getUseridx());
			
			service.deleteCart(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/mypage/cart";
	}	
	
	
	//////////////////////////////////////////////////////////
	// 찜목록
	// 장바구니 상품 리스트
	@GetMapping("zzim")
	public String listZzim(HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("loginUser");
		
		List<Zzim> list = service.listZzim(info.getUseridx());
		
		model.addAttribute("list", list);
		
		return ".mypage.zzim";
	}	
	
	// 찜목록 등록
	@PostMapping("saveZzim")
	public String saveZzim(Zzim dto,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("loginUser");
		
		try {
			dto.setUseridx(info.getUseridx());
			
			service.insertZzim(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/mypage/zzim"; 
	}		
	
	// 찜 등록된 상품 삭제
	@GetMapping("deleteZzim")
	public String deleteZzim(
			@RequestParam long product_num,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("loginUser");
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("gubun", "item");
			map.put("useridx", info.getUseridx());
			map.put("product_num", product_num);
			
			service.deleteZzim(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return "redirect:/mypage/zzim"; 
	}	
	
	// 찜목록 선택한 상품 삭제
	@PostMapping("deleteListZzim")
	public String deleteListZzim(
			@RequestParam List<Long> nums,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("loginUser");
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("useridx", info.getUseridx());
			map.put("list", nums);
			
			service.deleteZzim(map);
			
		} catch (Exception e) {
		}
		
		return "redirect:/mypage/zzim"; 
	}		
	
	

}
