package com.fa.plus.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.MemberManage;
import com.fa.plus.domain.Order;
import com.fa.plus.domain.Payment;
import com.fa.plus.domain.Zzim;
import com.fa.plus.mapper.MyPageMapper;

@Service
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private MyPageMapper mapper;
	
	///////////////////////////////////////////////////
	// 카트 
	@Override
	public void insertCart(Order dto) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("useridx", dto.getUseridx());
		
		try {
			for(int i = 0; i < dto.getProduct_nums().size(); i++) {
				if(dto.getDetail_nums2() == null) {
					map.put("detail_num2", dto.getDetail_nums().get(i));
				} else {
					map.put("detail_num2", dto.getDetail_nums2().get(i));
				}
				
				dto.setProduct_num(dto.getProduct_nums().get(i));
				dto.setDetail_num1(dto.getDetail_nums().get(i));
				if(dto.getDetail_nums2() != null) {
					dto.setDetail_num2(dto.getDetail_nums2().get(i));
				}
				dto.setQty(dto.getBuyQtys().get(i));
				
				
				if(mapper.findByCartId(map) == null) {
					mapper.insertCart(dto);
				} else {
					mapper.updateCart(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}		
	}

	@Override
	public List<Order> listCart(long useridx) {
		List<Order> list = null;
		
		try {
			list = mapper.listCart(useridx);
			
			for(Order dto : list) {

				dto.setOd_total_amount(dto.getProduct_price() * dto.getQty());

			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return list;
	}

	@Override
	public void deleteCart(Map<String, Object> map) throws Exception {
		try {

			mapper.deleteCart(map);
	
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	///////////////////////////////////////////////////

	@Override
	public List<MemberManage> listMember(long useridx) {
		List<MemberManage> list = null;
		
		try {
			list = mapper.listMember(useridx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public MemberManage findById(long useridx) {
		MemberManage dto = null;

		try {
			dto = mapper.findById(useridx);

			if (dto != null) {
				if (dto.getEmail() != null) {
					String[] s = dto.getEmail().split("@");
					dto.setEmail(s[0]);
				}

				if (dto.getTel() != null) {
					String[] s = dto.getTel().split("-");
					dto.setTel(s[0]);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}


	
	@Override
	public List<Zzim> listZzim(long useridx) {
		List<Zzim> list = null;
		
		try {
			list = mapper.listZzim(useridx);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return list;
	}

	@Override
	public void insertZzim(Zzim dto) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("useridx", dto.getUseridx());
		map.put("product_num", dto.getProduct_num());
		
		try {
			
			mapper.insertZzim(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}		
	}

	@Override
	public void deleteZzim(Map<String, Object> map) throws SQLException {
		try {
			mapper.deleteZzim(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	
	
	@Override
	public int countPayment(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.countPayment(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Payment> listPayment(Map<String, Object> map) {
		
		List<Payment> list = null;
		
		try {
			
			
			list = mapper.listPayment(map);
			
			/*
			String productState;
			Date endDate = new Date();
			long gap;
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			for(Payment dto : list) {
				dto.setOrderDate(dto.getOrderDate().replaceAll("-", ".").substring(5,10));
				dto.setOrderStateInfo(OrderState.ORDERSTATEINFO[dto.getOrderState()]);
				dto.setDetailStateInfo(OrderState.DETAILSTATEINFO[dto.getDetailState()]);
				
				productState = OrderState.ORDERSTATEINFO[dto.getOrderState()];
				if(dto.getDetailState() > 0) {
					productState = OrderState.DETAILSTATEINFO[dto.getDetailState()];
				}
				dto.setStateProduct(productState);
				
				// 배송 완료후 지난 일자
				if(dto.getOrderState() == 5 && dto.getStateDate() != null) {
					Date beginDate = formatter.parse(dto.getStateDate());
					gap = (endDate.getTime() - beginDate.getTime()) / (24 * 60 * 60 * 1000);
					dto.setAfterDelivery(gap);
				}
			}
			*/
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Payment> listPaymentProduct(Map<String, Object> map) {
		List<Payment> list = null;
		
		try {
			list = mapper.listPaymentProduct(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void updateOrderstatus(long od_num) throws Exception {
		try {
			mapper.updateOrderstatus(od_num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
}
