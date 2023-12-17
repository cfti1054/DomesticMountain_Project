package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.Support;

public interface SupportService {
	
	public void insertFaq(Support dto, String pathname) throws Exception;
	public void updateFaq(Support dto, String pathname) throws Exception;
	public void deleteFaq(long faq_board_num, String pathname)throws Exception;	
	
	public int dataCount(Map<String, Object> map);
	public List<Support> listFaqCategory();
	
	public Support findById(long faq_board_num);
	public List<Support> listFaqBoard(Map<String, Object> map);
	
	// FAQ 카테고리 목록
	public Support findByCategory(long faq_category_num);
	public List<Support> listCategory();
}
