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
	public void insertFaq(Support dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateFaq(Support dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFaq(long faq_board_num, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public Support findById(long faq_board_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Support> listFaqBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Support findByCategory(long faq_category_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Support> listCategory() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Support> listFaqCategory() {
		List<Support> list = null;
		
		try {
			list = mapper.listFaqCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
