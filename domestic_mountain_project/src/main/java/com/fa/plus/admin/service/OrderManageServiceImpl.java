package com.fa.plus.admin.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.OrderDetailManage;
import com.fa.plus.admin.domain.OrderManage;
import com.fa.plus.admin.mapper.OrderManageMapper;
import com.fa.plus.admin.state.OrderState;

@Service
public class OrderManageServiceImpl implements OrderManageService {

	@Autowired
	private OrderManageMapper mapper;

	@Override
	public int orderCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.orderCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<OrderManage> listOrder(Map<String, Object> map) {
		List<OrderManage> list = null;

		// OrderState.ORDERSTATEINFO : 주문상태 정보
		// OrderState.DETAILSTATEMANAGER : 주문상세상태 정보(관리자)
		
		try {
			list = mapper.listOrder(map);
//			for(OrderManage dto : list) {
//				dto.setOrderStateInfo(OrderState.ORDERSTATEINFO[dto.getOrderState()]);
//			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public OrderManage findById(String orderNum) {
		OrderManage dto = null;
		
		// OrderState.ORDERSTATEINFO : 주문상태 정보
		
		try {
			dto = mapper.findById(orderNum);
//			if(dto != null) {
//				dto.setOrderStateInfo(OrderState.ORDERSTATEINFO[dto.getOrderState()]);
//			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<OrderDetailManage> orderDetails(String orderNum) {
		List<OrderDetailManage> list = null;

		// OrderState.DETAILSTATEMANAGER : 주문상세상태 정보(관리자)
		
		try {
			list = mapper.findByOrderDetails(orderNum);
//			for(OrderDetailManage dto : list) {
//				dto.setDetailStateInfo(OrderState.DETAILSTATEMANAGER[dto.getDetailState()]);
//			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int orderDetailCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.orderDetailCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<OrderDetailManage> listOrderDetail(Map<String, Object> map) {
		List<OrderDetailManage> list = null;
		
		try {
			list = mapper.listOrderDetail(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateOrder(String mode, Map<String, Object> map) throws Exception {
		try {
			if(mode.equals("state")) {
				mapper.updateOrderState(map);
			} else if(mode.equals("invoiceNumber")) { // 송장번호 등록
				mapper.updateOrderInvoiceNumber1(map);
				mapper.updateOrderInvoiceNumber2(map);
			} else if(mode.equals("delivery")) { // 배송 변경
				mapper.updateOrderState(map);
				mapper.updateOrderState2(map);
			} else if(mode.equals("cancelAmount")) { // 주문취소 금액 수정
				
				List<OrderDetailManage> list = mapper.findByOrderDetails((String)map.get("orderNum"));
				map.put("refundReason", "관리자 요청");
				map.put("change_num", "3");
				
				for(OrderDetailManage dto : list) {
					map.put("orderDetailNum", dto.getOrderDetailNum());
					map.put("totalAmount", dto.getTotalMoney());
					mapper.updateCancelOrder1(map);
				}
				
				mapper.updateCancelOrder2(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateOrderDetailState(Map<String, Object> map) throws Exception {
		try {
			String orderNum = (String)map.get("orderNum");
			
			int detailState = Integer.parseInt(map.get("detailState").toString());
			
//			int detailState = Integer.parseInt((String)map.get("detailState"));
			int productMoney = Integer.parseInt((String)map.get("productMoney"));
			
			// 주문에 대한 전체 취소 금액 가져오기
			int cancelAmount = 0;
			if(detailState == 3 || detailState == 5 || detailState == 12) {
				// totalCancelAmount = dao.selectOne("adminOrder.readTotalCancelAmount", orderNum);
				cancelAmount = Integer.parseInt((String)map.get("cancelAmount"));
				System.out.println("============================================");
				System.out.println("============================================");
				System.out.println("============================================");
				System.out.println(cancelAmount);
				System.out.println("============================================");
				System.out.println("============================================");
				System.out.println("============================================");
			}
			
			// orderDetail 테이블 상태 변경
			mapper.updateOrderDetailState(map);
			
			// detailStateInfo 테이블에 상태 변경 내용 및 날짜 저장
			mapper.insertDetailStateInfo(map);

			// productOrder 테이블 취소금액 변경
			// 환불-개별판매취소(관리자),주문취소완료(관리자),반품완료(관리자)
			if(detailState == 3 || detailState == 5 || detailState == 12) {
				cancelAmount += productMoney;
				map.put("cancelAmount", cancelAmount);

				if(detailState == 3) {
					map.put("refundReason", "관리자 요청");
				} else if(detailState == 4) {
					map.put("refundReason", "소비자 요청");
				} else {
					map.put("refundReason", "기타");
				}
				
				mapper.updateCancelDetail1(map);
				mapper.updateCancelDetail2(map);
				
				// 주문정보에 대한 모든 주문 내역이 주문 취소이면 주문정보의 상태는 판매 취소로 변경
				int totalOrderCount = mapper.totalOrderCount(orderNum);
				if(totalOrderCount == 0) {
					map.put("orderState", 0);
					
					mapper.updateOrderState(map);
				}
				
				// 카드 취소내역 저장
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public List<Map<String, Object>> listDeliveryCompany() {
		List<Map<String, Object>> list = null;
		
		try {
			list = mapper.listDeliveryCompany();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<Map<String, Object>> listDetailStateInfo(long orderDetailNum) {
		List<Map<String, Object>> list = null;
		
		// OrderState.DETAILSTATEMANAGER : 주문상세상태 정보(관리자)
		try {
			list = mapper.listDetailStateInfo(orderDetailNum);
			
			String detalStateInfo;
//			for(Map<String, Object> map : list) {
//				int detailState = ((BigDecimal) map.get("DETAILSTATE")).intValue(); 
//				detalStateInfo = OrderState.DETAILSTATEMANAGER[detailState];
//				map.put("DETALSTATEINFO", detalStateInfo);
//			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
}
