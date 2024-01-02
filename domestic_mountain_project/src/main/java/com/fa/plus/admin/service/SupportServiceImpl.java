package com.fa.plus.admin.service;

import java.util.ArrayList;
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
	public void insert_faq_category(Support dto) throws Exception {
		try {
			long faq_category_num = mapper.faq_category_seq();
			long faq_category_order = mapper.faq_category_order_seq();
			
			dto.setFaq_category_num(faq_category_num);
			dto.setFaq_category_order(faq_category_order);
			
			mapper.insert_faq_category(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		

		
	}

	@Override
	public void update_faq_category(Support dto) throws Exception {
		try {
			mapper.update_faq_category(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void visible_faq_category(Map<String, Object> map) throws Exception {
		try {
			mapper.visible_faq_category(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
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
	public void insert_faq_board(Support dto) throws Exception {
		try {
			long faq_num = mapper.faq_board_seq();
			dto.setFaq_num(faq_num);
			
			mapper.insert_faq_board(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void update_faq_board(Support dto) throws Exception {
		try {
			mapper.update_faq_board(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void visible_faq_board(Map<String, Object> map) throws Exception {
		try {
			mapper.visible_faq_category(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Support> list_faq_board() {
		List<Support> list = null;
		
		try {
			list = mapper.list_faq_board();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Support> find_by_category_num(List<String> input_list) throws Exception {
		List<Integer> category_num_list = new ArrayList<Integer>() ;
		List<Support> list = null;
		try {
			for(int i = 0 ; i < input_list.size() ; i+=5 ) {
				category_num_list.add(Integer.parseInt(input_list.get(i)));
			}
			
			list = mapper.find_by_category_num(category_num_list);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Support> find_by_board_num(List<String> input_list) throws Exception {
		List<Integer> board_num_list = new ArrayList<Integer>();
		List<Support> list = null;
		try {
			for(int i = 0; i < input_list.size(); i+= 1 ) {
				board_num_list.add(Integer.parseInt(input_list.get(i)));
			}
			
			list = mapper.find_by_board_num(board_num_list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Support show_content(String s) throws Exception {
		Support dto = null;

		try {
			dto = mapper.show_content(Long.parseLong(s));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Support> list_inquiry_category() throws Exception {
		List<Support> list = null;
		
		try {
			list = mapper.list_inquiry_category();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Support> list_inquiry_board() throws Exception {
		List<Support> list = null;
		
		try {
			list = mapper.list_inquiry_board();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insert_inquiry_category(Support dto) throws Exception {
		try {
			long inquiry_category_num = mapper.inquiry_category_seq();
			
			dto.setInquiry_category_num(inquiry_category_num);
			
			mapper.insert_inquiry_category(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void update_inquiry_category(Support dto) throws Exception {
		try {
			mapper.update_inquiry_category(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Support> find_by_inquiry_category_num(List<String> input_list) throws Exception {
		List<Integer> category_num_list = new ArrayList<Integer>() ;
		List<Support> list = null;
		try {
			for(int i = 0 ; i < input_list.size() ; i+=5 ) {
				category_num_list.add(Integer.parseInt(input_list.get(i)));
			}
			
			list = mapper.find_by_inquiry_category_num(category_num_list);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Support find_by_inquiry_board_num(String num) throws Exception {
		Support dto = null;
		
		try {
			Long l = Long.parseLong(num);
			dto = mapper.find_by_inquiry_board_num(l);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void insert_inquiry_answer(Support dto) throws Exception {
		
		try {

			mapper.insert_inquiry_answer(dto);
			mapper.chage_inquiry_board_status(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		
	}

	@Override
	public Support find_by_answer_num(String num) throws Exception {
		Support dto = null;
		
		try {
			long l = Long.parseLong(num);
			dto = mapper.find_by_answer_num(l);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return dto;
	}

	@Override
	public void update_inquiry_answer(Support dto) {
		
		try {
			mapper.update_inquiry_answer(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	

	

	
}
