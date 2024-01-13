package com.fa.plus.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.admin.domain.OrderManage;
import com.fa.plus.admin.service.OrderManageService;
import com.fa.plus.common.MyUtil;

@Controller
@RequestMapping("/admin/orderManage/*")
public class OrderManageController {

	@Autowired
	private OrderManageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("{orderStatus}")
	public String list_order(
			@PathVariable String orderStatus,
			@RequestParam(defaultValue="1") int state,
			HttpServletRequest req,
			Model model) throws Exception {
		
		// 주문 현황
		// state - 1: 결제완료, -2 :전체, 3-배송단계
		
		if(orderStatus.equals("delivery")) {
			state = 3;
		}
		
		String cp = req.getContextPath();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", state);
		
		
		
		List<OrderManage> list = null;
		List<OrderManage> listDeliveryCompany = null;
		try {
			list = service.list_order(map);
			listDeliveryCompany = service.list_company();
			
		} catch (Exception e) {
		}
		String listUrl = cp + "/admin/orderManage/" + orderStatus;
		
		String query = "state=" + state;
		listUrl += "?" + query;
		String paging = myUtil.pagingUrl(0, 0, listUrl);
		
		model.addAttribute("orderStatus", orderStatus);
		model.addAttribute("list", list);
		model.addAttribute("state", state);
		model.addAttribute("paging", paging);

		model.addAttribute("listDeliveryCompany", listDeliveryCompany);
		
		
		return ".admin.orderManage.order_list";
	}
	
	@GetMapping("order_detail/info")
	public String order_detail_info(
			@RequestParam String orderNum, 
			@RequestParam String orderStatus,
			Model model) throws Exception {
		
		OrderManage order = null;
		List<OrderManage> list_detail = null;
		try {
			order = service.find_by_order_num(orderNum);
			list_detail = service.find_order_detail_by_order_num(orderNum);
		} catch (Exception e) {
		}
		
		model.addAttribute("order", order);
		model.addAttribute("list_detail", list_detail);
		
		
		return  "admin/orderManage/order_detail";
	}
	
}
