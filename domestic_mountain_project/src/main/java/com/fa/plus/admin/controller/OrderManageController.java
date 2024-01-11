package com.fa.plus.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fa.plus.admin.domain.OrderManage;
import com.fa.plus.admin.service.OrderManageService;

@Controller
@RequestMapping("/admin/orderManage/*")
public class OrderManageController {

	@Autowired
	private OrderManageService service;
	
	@RequestMapping("order_list")
	public String list_order(Model model) throws Exception {
		List<OrderManage> list = null;
		
		try {
			list = service.list_order();
		} catch (Exception e) {
		}

		model.addAttribute("list", list);
		
		return ".admin.orderManage.order_list";
	}
}
