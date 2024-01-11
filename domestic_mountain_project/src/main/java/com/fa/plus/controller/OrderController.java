package com.fa.plus.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.domain.Order;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.domain.User;
import com.fa.plus.service.OrderService;
import com.fa.plus.service.UserService;

@Controller
@RequestMapping("/order/*")
public class OrderController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private UserService userService;

	@RequestMapping("buy")
	public String buyForm(
			@RequestParam List<Long> product_nums, 
			@RequestParam List<Long> detail_nums,
			@RequestParam(required = false) List<Long> detail_nums2,
			@RequestParam List<Integer> buyQtys,
			@RequestParam(defaultValue = "buy") String mode, HttpSession session, Model model) throws Exception {

		try {
			SessionInfo info = (SessionInfo) session.getAttribute("loginUser");
			User orderUser = userService.findById(info.getUseridx());

			Order vo = orderService.findByMyInformation(info.getUseridx());
			
			String productOrderNumber = null; // 주문번호
			int totalMoney = 0; // 상품합
			int deliveryCharge = 0; // 배송비
			int payment = 0; // 결제할 금액(상품합 + 배송비)
			int totalSavedMoney = 0; // 적립금 총합
			int totalDiscountPrice = 0; // 총 할인액

			productOrderNumber = orderService.productOrderNumber();

			if (detail_nums2 != null) {
				List<Map<String, Long>> list = new ArrayList<Map<String, Long>>();
				for (int i = 0; i < detail_nums.size(); i++) {
					Map<String, Long> map = new HashMap<String, Long>();
					map.put("detail_num1", detail_nums.get(i));
					map.put("detail_num2", detail_nums2.get(i));
					list.add(map);
				}

				List<Order> listProduct = orderService.listProduct(list);
				for (int i = 0; i < listProduct.size(); i++) {
					Order dto = listProduct.get(i);

					dto.setQty(buyQtys.get(i));
					dto.setOd_price(buyQtys.get(i) * dto.getOrder_sale());

					// totalSavedMoney += (buyQtys.get(i) * dto.getOd_total_amount());
					dto.setOd_total_amount(buyQtys.get(i) * dto.getOd_total_amount());

					totalMoney += buyQtys.get(i) * dto.getOrder_sale();
					totalDiscountPrice += buyQtys.get(i) * dto.getOrder_sale();
				}

				
				
				model.addAttribute("listProduct", listProduct);
			} else {
				List<Map<String, Long>> list = new ArrayList<Map<String, Long>>();
				for (int i = 0; i < detail_nums.size(); i++) {
					Map<String, Long> map = new HashMap<String, Long>();
					map.put("detail_num1", detail_nums.get(i));
					list.add(map);
				}

				List<Order> listProduct = orderService.listProduct(list);
				for (int i = 0; i < listProduct.size(); i++) {
					Order dto = listProduct.get(i);

					dto.setQty(buyQtys.get(i));
					dto.setOd_price(buyQtys.get(i) * dto.getOrder_sale());

					// totalSavedMoney += (buyQtys.get(i) * dto.getOd_total_amount());
					dto.setOd_total_amount(buyQtys.get(i) * dto.getOd_total_amount());

					totalMoney += buyQtys.get(i) * dto.getOrder_sale();
					totalDiscountPrice += buyQtys.get(i) * dto.getOrder_sale();
				}

				
				
				model.addAttribute("listProduct", listProduct);
			}
			
			

			payment = totalMoney + deliveryCharge;
			
			model.addAttribute("vo", vo);
			model.addAttribute("productOrderNumber", productOrderNumber); // 주문 번호
			model.addAttribute("orderUser", orderUser); // 주문 유저

			model.addAttribute("totalMoney", totalMoney); // 총금액 (수량*할인가격 의 합)
			model.addAttribute("payment", payment); // 결제할 금액
			model.addAttribute("totalSavedMoney", totalSavedMoney); // 총 적림예정액
			model.addAttribute("totalDiscountPrice", totalDiscountPrice); // 할인 총액
			model.addAttribute("deliveryCharge", deliveryCharge); // 배송비

			model.addAttribute("mode", mode); // 바로구매인지 장바구니 구매인지를 가지고 있음

			return ".order.buy";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/";
	}

}
