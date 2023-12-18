package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.Support;

public interface SupportService {
	
	public void insert_faq_category(Support dto, String pathname) throws Exception;
	public void update_faq_category(Support dto, String pathname) throws Exception;
	public void delete_faq_category(long faq_board_num, String pathname)throws Exception;	
	
	public int data_count(Map<String, Object> map);
	public List<Support> list_faq_category();
	
	public Support find_by_id(long faq_board_num);
	public List<Support> list_faq_board(Map<String, Object> map);
	

	public Support find_by_category(long faq_category_num);
}
