package com.fa.plus.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
			@RequestParam(defaultValue = "buy") String mode, 
			HttpSession session, 
			Model model
			) throws Exception {

		try {
			SessionInfo info = (SessionInfo) session.getAttribute("loginUser");
			User orderUser = userService.findById(info.getUseridx());

			Order vo = orderService.findByMyInformation(info.getUseridx());
			
			
			
			String productOrderNumber = null; // 주문번호
			String productOrderName = ""; // 주문상품번호
			
			int totalMoney = 0; // 상품합
			int deliveryCharge = 3000; // 배송비(고정)
			int payment = 0; // 결제할 금액(상품합 + 배송비)
			int totalDiscountPrice = 0; // 총 할인액
			int percentSale = 0; // 전체가격 * (퍼센트 / 100)

			productOrderNumber = orderService.productOrderNumber();
			
			
			if (mode == "buy") {
				if (detail_nums2 != null) {
					
					List<Map<String, Long>> list = new ArrayList<Map<String, Long>>();
					for (int i = 0; i < detail_nums.size(); i++) {
						Map<String, Long> map = new HashMap<String, Long>();
						map.put("detail_num", detail_nums.get(i));
						map.put("detail_num2", detail_nums2.get(i));
						list.add(map);
					}

					List<Order> listProduct = orderService.listProduct(list);
					
					
					for (int i = 0; i < listProduct.size(); i++) {
						Order dto = listProduct.get(i);
						System.out.println(dto.getProduct_name() + i);
						dto.setQty(buyQtys.get(i));
						
						// 각 상품의 총 금액 (상품 가격 * 수량)
						dto.setTotal_amount(dto.getProduct_price() * buyQtys.get(i));
						
						// 전체 상품합 = 수량 * 세일 적용된 가격
						totalMoney += dto.getTotal_amount();
						
						// 세일할 가격 = 원가 * (% / 100)
						percentSale = totalMoney * vo.getSale() / 100;
						
						// 결제할 금액
						payment = totalMoney + deliveryCharge - percentSale;
						
						
					}
					productOrderName = listProduct.get(0).getProduct_name();
					if(listProduct.size() > 1) {
						productOrderName += " 외 " + (listProduct.size() - 1) + "건";
					}
					

					model.addAttribute("listProduct", listProduct);
					
				} else {
					List<Map<String, Long>> list = new ArrayList<Map<String, Long>>();
					for (int i = 0; i < detail_nums.size(); i++) {
						Map<String, Long> map = new HashMap<String, Long>();
						map.put("detail_num", detail_nums.get(i));
						list.add(map);
					}

					List<Order> listProduct = orderService.listProduct2(list);
					
					
					for (int i = 0; i < listProduct.size(); i++) {
						Order dto = listProduct.get(i);
						System.out.println(dto.getProduct_name() + i);
						dto.setQty(buyQtys.get(i));
						
						// 각 상품의 총 금액 (상품 가격 * 수량)
						dto.setTotal_amount(dto.getProduct_price() * buyQtys.get(i));
						
						// 전체 상품합 = 수량 * 세일 적용된 가격
						totalMoney += dto.getTotal_amount();
						
						// 세일할 가격 = 원가 * (% / 100)
						percentSale = totalMoney * vo.getSale() / 100;
						
						// 결제할 금액
						payment = totalMoney + deliveryCharge - percentSale;
						
						
					}
					productOrderName = listProduct.get(0).getProduct_name();
					if(listProduct.size() > 1) {
						productOrderName += " 외 " + (listProduct.size() - 1) + "건";
					}
					
					model.addAttribute("listProduct", listProduct);
				}

			} else { // "cart"
				if (detail_nums2 != null && detail_nums2.equals("")) {
					
					List<Map<String, Long>> list = new ArrayList<Map<String, Long>>();
					for (int i = 0; i < detail_nums.size(); i++) {
						Map<String, Long> map = new HashMap<String, Long>();
						map.put("detail_num", detail_nums.get(i));
						map.put("detail_num2", detail_nums2.get(i));
						list.add(map);
					}

					List<Order> listProduct = orderService.listProduct(list);
					
					
					for (int i = 0; i < listProduct.size(); i++) {
						Order dto = listProduct.get(i);
						System.out.println(dto.getProduct_name() + i);
						dto.setQty(buyQtys.get(i));
						
						// 각 상품의 총 금액 (상품 가격 * 수량)
						dto.setTotal_amount(dto.getProduct_price() * buyQtys.get(i));
						
						// 전체 상품합 = 수량 * 세일 적용된 가격
						totalMoney += dto.getTotal_amount();
						
						// 세일할 가격 = 원가 * (% / 100)
						percentSale = totalMoney * vo.getSale() / 100;
						
						// 결제할 금액
						payment = totalMoney + deliveryCharge - percentSale;
						
						
					}
					productOrderName = listProduct.get(0).getProduct_name();
					if(listProduct.size() > 1) {
						productOrderName += " 외 " + (listProduct.size() - 1) + "건";
					}
					

					model.addAttribute("listProduct", listProduct);
					
				} else {
					List<Map<String, Long>> list = new ArrayList<Map<String, Long>>();
					for (int i = 0; i < detail_nums.size(); i++) {
						Map<String, Long> map = new HashMap<String, Long>();
						map.put("detail_num", detail_nums.get(i));
						list.add(map);
					}

					List<Order> listProduct = orderService.listProduct2(list);
					
					
					for (int i = 0; i < listProduct.size(); i++) {
						Order dto = listProduct.get(i);
						System.out.println(dto.getProduct_name() + i);
						dto.setQty(buyQtys.get(i));
						
						// 각 상품의 총 금액 (상품 가격 * 수량)
						dto.setTotal_amount(dto.getProduct_price() * buyQtys.get(i));
						
						// 전체 상품합 = 수량 * 세일 적용된 가격
						totalMoney += dto.getTotal_amount();
						
						// 세일할 가격 = 원가 * (% / 100)
						percentSale = totalMoney * vo.getSale() / 100;
						
						// 결제할 금액
						payment = totalMoney + deliveryCharge - percentSale;
						
						
					}
					productOrderName = listProduct.get(0).getProduct_name();
					if(listProduct.size() > 1) {
						productOrderName += " 외 " + (listProduct.size() - 1) + "건";
					}
					
					
					
					model.addAttribute("listProduct", listProduct);
				}
			}
			
			
			
			
			
			
			model.addAttribute("vo", vo);
			model.addAttribute("productOrderNumber", productOrderNumber); // 주문 번호
			model.addAttribute("productOrderName", productOrderName); // 주문 상품명
			model.addAttribute("orderUser", orderUser); // 주문 유저

			model.addAttribute("totalMoney", totalMoney); // 총금액 (수량*할인가격 의 합)
			model.addAttribute("payment", payment); // 결제할 금액
			model.addAttribute("totalDiscountPrice", totalDiscountPrice); // 할인 총액
			model.addAttribute("deliveryCharge", deliveryCharge); // 배송비
			model.addAttribute("percentSale", percentSale); // 전체가격 * (퍼센트 / 100)

			model.addAttribute("mode", mode); // 바로구매인지 장바구니 구매인지를 가지고 있음

			return ".order.buy";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/";
	}
	
	@PostMapping("paymentOk")
	public String paymentSubmit(
			Order dto,
			@RequestParam(defaultValue = "buy") String mode,
			RedirectAttributes reAttr,
			HttpSession session
			) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("loginUser");
		
		try {
			dto.setUseridx(info.getUseridx());
			orderService.insertOrder(dto);
			
			/*
			if(mode.equals("cart")) {
				// 구매 상품에 대한 장바구니 비우기
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("gubun", "list");
				map.put("userId", info.getUserid());
				map.put("list", dto.getDetail_nums2());
				
				orderService.deleteCart(map);
			}
			*/
			
			String p = String.format("%,d", dto.getTotal_amount());
			
			StringBuilder sb = new StringBuilder();
			sb.append(info.getUsername() + "님 상품을 구매해 주셔서 감사 합니다.<br>");
			sb.append("구매 하신 상품의 결제가 정상적으로 처리되었습니다.<br>");
			sb.append("결제 금액 : <label class='fs-5 fw-bold text-primary'>" +  p + "</label>원");

			reAttr.addFlashAttribute("title", "상품 결제 완료");
			reAttr.addFlashAttribute("message", sb.toString());
			
			return "redirect:/order/complete";
		} catch (Exception e) {
		}
		
		return "redirect:/";
	}
	
	
	@GetMapping("complete")
	public String complete(@ModelAttribute("title") String title, 
			@ModelAttribute("message") String message
			) throws Exception {
		
		// F5를 누른 경우
		if (message == null || message.length() == 0) { 
			return "redirect:/";
		}
		
		
		return ".order.complete";
	}
}
