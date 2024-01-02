package com.fa.plus.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.BoardManage;
import com.fa.plus.admin.mapper.BoardManageMapper;

@Service
public class BoardManageServiceImpl implements BoardManageService {

	@Autowired
	private BoardManageMapper mapper;

	@Override
	public List<BoardManage> list_notice_category() {
		List<BoardManage> list = null;
		
		try {
			list  = mapper.list_notice_category();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<BoardManage> find_by_category_num(List<Integer> input_list) {
		List<Integer> category_num_list = new ArrayList<Integer>();
		List<BoardManage> list = null;
		
		try {
				
//			list = mapper.find_by_category_num(category_num_list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
