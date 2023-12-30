package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.Support;

public interface SupportService {
	
	public void insert_faq_category(Support dto) throws Exception;
	public void update_faq_category(Support dto) throws Exception;
	public void visible_faq_category(Map<String, Object> map) throws Exception;	
	public List<Support> list_faq_category();
	
	public List<Support> find_by_category_num(List<String> list) throws Exception;
	public List<Support> find_by_board_num(List<String> list) throws Exception;
	
	
	public void insert_faq_board(Support dto) throws Exception;
	public void update_faq_board(Support dto) throws Exception;
	public void visible_faq_board(Map<String, Object> map) throws Exception;
	public List<Support> list_faq_board();
	
	public Support show_content(String num) throws Exception;
	
	
	/* 											1:1 문의									*/
	public List<Support> list_inquiry_category() throws Exception;
	public List<Support> list_inquiry_board() throws Exception;

}
