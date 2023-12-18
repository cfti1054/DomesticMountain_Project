package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.Support;
import com.fa.plus.admin.mapper.SupportMapper;
import com.fa.plus.common.FileManager;

@Service
public class SupportServiceImpl implements SupportService {
	
	@Autowired
	private SupportMapper mapper;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void insert_faq_category(Support dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update_faq_category(Support dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete_faq_category(long faq_board_num, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int data_count(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Support> list_faq_category() {
		List<Support> list = null;
		
		try {
			list = mapper.list_faq_category();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Support find_by_id(long faq_board_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Support> list_faq_board(Map<String, Object> map) {
		List<Support> list = null;
		
		try {
			list = mapper.list_faq_board();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Support find_by_category(long faq_category_num) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
