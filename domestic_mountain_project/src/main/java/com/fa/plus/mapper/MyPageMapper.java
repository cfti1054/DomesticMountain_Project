package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Order;

@Mapper
public interface MyPageMapper {
	// 카트
	public void insertCart(Order dto) throws SQLException; 	// 카트에 담기
	public void updateCart(Order dto) throws SQLException; 	// 카트 업데이트
	public Order findByCartId(Map<String, Object> map);	   	// 카트 회원 찾기		
	public List<Order> listCart(long useridx);		   		// 카트 리스트
	public void deleteCart(Map<String, Object> map) throws SQLException; // 장바구니 삭제
	public void deleteCartExpiration() throws SQLException;	// 장바구니 만료
}
