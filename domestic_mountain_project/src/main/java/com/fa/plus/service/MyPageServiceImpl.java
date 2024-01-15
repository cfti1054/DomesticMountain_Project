package com.fa.plus.service;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.MemberManage;
import com.fa.plus.domain.Order;
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
			if(dto.getDetail_num2() !=  null && dto.getDetail_num2()== 0) {
				dto.setDetail_num2(null);
			}			
					
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
}
