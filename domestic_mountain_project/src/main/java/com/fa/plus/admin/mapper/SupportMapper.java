package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.Support;

@Mapper
public interface SupportMapper {
	
	public long faq_category_seq();
	public long faq_category_order_seq();
	
	public void insert_faq_category(Support dto) throws SQLException;
	public void update_faq_category(Support dto) throws SQLException;
	public void visible_faq_category(Map<String, Object> map) throws SQLException;
	public List<Support> list_faq_category() throws SQLException;
	
	public List<Support> find_by_category_num(List<Integer> list) throws SQLException;
	public List<Support> find_by_board_num(List<Integer> list) throws SQLException;
	
	public long faq_board_seq();
	
	public void insert_faq_board(Support dto) throws SQLException;
	public void update_faq_board(Support dto) throws SQLException;
	public void visible_faq_board(Map<String, Object> map) throws SQLException;
	public List<Support> list_faq_board() throws SQLException;
	
	public Support show_content(long faq_num) throws SQLException;
	
	
	/* 											1:1 문의									*/
	
	public List<Support> list_inquiry_category() throws SQLException;
	public List<Support> list_inquiry_board() throws SQLException;
	public List<Support> list_inquiry_answer() throws SQLException;
	
	public long inquiry_category_seq();
	public void insert_inquiry_category(Support dto) throws SQLException;
	public void update_inquiry_category(Support dto) throws SQLException;
	
	public void insert_inquiry_answer(Support dto) throws SQLException;
	public List<Support> find_by_inquiry_category_num(List<Integer> list) throws SQLException; 
	public Support find_by_inquiry_board_num(Long inquiry_board_num) throws SQLException;
	
	public void chage_inquiry_board_status(Support dto) throws SQLException;
	
	public Support find_by_answer_num(Long inquiry_board_num) throws SQLException;
	public void update_inquiry_answer(Support dto) throws SQLException;

}
