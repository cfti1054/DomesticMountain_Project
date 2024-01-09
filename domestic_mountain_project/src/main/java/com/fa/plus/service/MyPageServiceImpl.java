package com.fa.plus.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.Order;
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
				map.put("detail_num2", dto.getDetail_nums2().get(i));
				
				dto.setProduct_num(dto.getProduct_nums().get(i));
				dto.setDetail_num1(dto.getDetail_nums().get(i));
				dto.setDetail_num2(dto.getDetail_nums2().get(i));
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

				dto.setOrder_total_money(dto.getOd_price() * dto.getQty());
			}
		} catch (Exception e) {
			e.printStackTrace();
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
}
