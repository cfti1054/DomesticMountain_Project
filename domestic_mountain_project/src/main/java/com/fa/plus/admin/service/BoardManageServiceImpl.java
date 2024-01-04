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
			long l = mapper.notice_category_seq();
			dto.setNotice_category_num(l);
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

	@Override
	public List<BoardManage> list_notice_board() throws Exception {
		List<BoardManage> list = null;
		
		try {
			list = mapper.list_notice_board();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public BoardManage find_by_notice_board_num(String s) throws Exception {
		BoardManage dto = null;
		
		try {
			Long l = Long.parseLong(s);
			dto = mapper.find_by_notice_board_num(l);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void insert_notice_board(BoardManage dto) throws Exception {
		try {
			long l = mapper.notice_board_seq();
			dto.setNotice_board_num(l);
			mapper.insert_notice_board(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
