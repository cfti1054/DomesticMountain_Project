package com.fa.plus.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.admin.domain.OrderDetailManage;
import com.fa.plus.admin.domain.OrderManage;
import com.fa.plus.admin.service.OrderManageService;
import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;

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
		
		List<OrderManage> list = service.listOrder(map);
		List<Map<String, Object>> listDeliveryCompany = service.listDeliveryCompany();
		
		String listUrl = cp + "/admin/orderManage/" + orderStatus;
		
		String query = "state=" + state;
		listUrl += "?" + query;
		
		model.addAttribute("orderStatus", orderStatus);
		
		model.addAttribute("list", list);
		model.addAttribute("state", state);
		
		model.addAttribute("listDeliveryCompany", listDeliveryCompany);
		
		return ".admin.orderManage.order_list";
	}
	
	@GetMapping("order_detail/info")
	public String order_detail_info(
			@RequestParam String orderNum, 
			@RequestParam String orderStatus,
			Model model) throws Exception {
		
		// 주문번호에 대한 주문상세 정보
		
				// 주문 정보
				OrderManage order = service.findById(orderNum);
				
				// 주문 상세 정보
				List<OrderDetailManage> listDetail = service.orderDetails(orderNum);
				model.addAttribute("order", order);
				model.addAttribute("listDetail", listDetail);
		
		return  "admin/orderManage/order_detail";
	}
	
	
	@PostMapping("order_detail/invoiceNumber")
	@ResponseBody
	public Map<String, Object> invoiceNumber(@RequestParam Map<String, Object> paramMap) {
		// 송장 번호 등록/변경
		String state = "true";
		
		try {
			service.updateOrder("invoiceNumber", paramMap);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	
	@PostMapping("order_detail/delivery")
	@ResponseBody
	public Map<String, Object> delivery(@RequestParam Map<String, Object> paramMap) {
		// 배송 상태 변경
		String state = "true";
		
		try {
			service.updateOrder("delivery", paramMap);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	
	@PostMapping("order_detail/updateDetailState")
	@ResponseBody
	public Map<String, Object> updateDetailState(@RequestParam Map<String, Object> paramMap,
			HttpSession session) {
		// 상세주문별 상태 변경
		Map<String, Object> model = new HashMap<String, Object>();
		
		String state = "true";
		
		try {
			int detailState = Integer.parseInt((String)paramMap.get("detailState"));
			
			paramMap.put("memberIdx", 1);
			
			service.updateOrderDetailState(paramMap);
			
			model.put("detailState", detailState);
			
		} catch (Exception e) {
			state = "false";
		}
		
		model.put("state", state);
		return model;
	}
	
	
	@GetMapping("order_detail/listDetailState")
	@ResponseBody
	public Map<String, Object> listDetailState(@RequestParam long orderDetailNum) {
		// 상세주문별 상태 리스트
		List<Map<String, Object>> list = null;
		try {
			list = service.listDetailStateInfo(orderDetailNum);
		} catch (Exception e) {
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("list", list);
		return model;
	}
	
	public String exchange() throws Exception {
		// 교환관리
		return "";
	}

	@PostMapping("order_detail/cancel")
	@ResponseBody
	public Map<String, Object> cancel(@RequestParam String orderNum) throws Exception {
		String state = "true";
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("orderNum", orderNum);
		map.put("detailState", 5);
		try {
			service.updateOrder("cancelAmount", map);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
