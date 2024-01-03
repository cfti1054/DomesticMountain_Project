package com.fa.plus.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.BoardManage;
import com.fa.plus.admin.mapper.BoardManageMapper;

@Service
public class BoardManageServiceImpl implements BoardManageService  {

	@Autowired
	private BoardManageMapper mapper;

	@Override
	public List<BoardManage> list_notice_category() throws Exception {
		List<BoardManage> list = null;
		
		try {
			list  = mapper.list_notice_category();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return list;
	}

	@Override
	public List<BoardManage> find_by_category_num(List<String> input_list) throws Exception {
		List<Integer> category_num_list = new ArrayList<Integer>();
		List<BoardManage> list = null;
		
		try {
			for(int i = 0 ; i < input_list.size() ; i+=5 ) {
				category_num_list.add(Integer.parseInt(input_list.get(i)));
			}
			list = mapper.find_by_category_num(category_num_list);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return list;
	}

	@Override
	public void insert_notice_category(BoardManage dto) throws Exception {
		
		try {
			mapper.insert_notice_category(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void update_notice_category(BoardManage dto) throws Exception {
		try {
			mapper.update_notice_category(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
}
