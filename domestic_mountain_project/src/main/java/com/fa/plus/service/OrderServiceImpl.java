package com.fa.plus.service;

import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.Order;
import com.fa.plus.mapper.MyPageMapper;
import com.fa.plus.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper mapper;
	
	@Autowired
	private MyPageMapper myPageMapper;
	
	private static AtomicLong count = new AtomicLong();
	
	@Override
	public String productOrderNumber() {
		// 상품 주문 번호 생성
		String result = "";
		
		try {
			Calendar cal = Calendar.getInstance();
			String y =String.format("%04d", cal.get(Calendar.YEAR));
			String m = String.format("%02d", (cal.get(Calendar.MONTH) + 1));
			String d = String.format("%03d", cal.get(Calendar.DATE) * 7);
			
			String preNumber = y + m + d;
			String savedPreNumber = "0";
			long savedLastNumber = 0;
			String maxOrderNumber = mapper.findByMaxOrderNumber();
			if(maxOrderNumber != null && maxOrderNumber.length() > 9) {
				savedPreNumber = maxOrderNumber.substring(0, 9);
				savedLastNumber = Long.parseLong(maxOrderNumber.substring(9));
			}
			
			long lastNumber = 1;
			if(! preNumber.equals(savedPreNumber)) {
				count.set(0);
				lastNumber = count.incrementAndGet();
			} else {
				lastNumber = count.incrementAndGet();
				
				if( savedLastNumber >= lastNumber )  {
					count.set(savedLastNumber);
					lastNumber = count.incrementAndGet();
				}
			}
			
			result = preNumber + String.format("%09d", lastNumber);
			
		} catch (Exception e) {
		}
		
		return result;
	}

	@Override
	public void insertOrder(Order dto) throws Exception {
		try {
			// 주문 정보 저장
			mapper.insertOrder(dto);

			// 결재 내역 저장
			mapper.insertPayDetail(dto);
			
			// 상세 주문 정보 및 주문 상태 저장
			for(int i=0; i < dto.getProduct_nums().size(); i++) {
				dto.setProduct_num(i);
				dto.setQty(dto.getBuyQtys().get(i));
				dto.setDetail_num1(dto.getDetail_nums().get(i));
				dto.setDetail_num2(dto.getDetail_nums2().get(i));
				dto.setProduct_price(dto.getProduct_prices().get(i));
				dto.setOd_total_amount(dto.getOd_total_amounts().get(i));
				
				// dto.setSalePrice(dto.getSalePrices().get(i)); // 없는거 아님?
				// dto.setSavedMoney(dto.getSavedMoneys().get(i)); // 포인트 적립...
			
				// 상세 주문 정보 저장
				mapper.insertOrderDetail(dto);
			}
			
			// 배송지 저장 
			mapper.insertOrderDelivery(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Order findById(long productNum) {
		Order dto = null;
		
		try {
			dto = mapper.findById(productNum); 
			
			if(dto != null) {
				
				
				// dto.set(dto.getProduct_price() * ());
				dto.setTotal_amount(dto.getProduct_price());
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Order> listProduct(List<Map<String, Long>> list) {
		List<Order> listProduct = null;
		
		try {
			listProduct = mapper.listProduct(list);
			for(Order dto : listProduct) {
				
				dto.setTotal_amount(dto.getProduct_price());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listProduct;
	}

	@Override
	public List<Order> listProduct2(List<Map<String, Long>> list) {
		List<Order> listProduct2 = null;
		
		try {
			listProduct2 = mapper.listProduct2(list);
			for(Order dto : listProduct2) {
				
				dto.setTotal_amount(dto.getProduct_price());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listProduct2;
	}
	
	@Override
	public Order findByDetailId(long detailNum) {
		Order dto = null;
		
		try {
			dto = mapper.findByDetailId(detailNum); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Order> listOptionDetail(List<Long> detailNums) {
		List<Order> listOptionDetail = null;
		
		try {
			listOptionDetail = mapper.listOptionDetail(detailNums);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listOptionDetail;
	}

	@Override
	public void deleteCart(Map<String, Object> map) throws Exception {
		try {
			myPageMapper.deleteCart(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Order findByMyInformation(long useridx) {
		Order dto = null;
		
		try {
			dto = mapper.findByMyInformation(useridx);
			
			if (dto != null) {
				if (dto.getTel() != null) {
					String[] s = dto.getTel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
