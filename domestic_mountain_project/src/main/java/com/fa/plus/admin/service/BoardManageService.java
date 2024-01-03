package com.fa.plus.admin.service;

import java.util.List;

import com.fa.plus.admin.domain.BoardManage;

public interface BoardManageService {

	public List<BoardManage> list_notice_category() throws Exception; 
	public List<BoardManage> find_by_category_num(List<Integer> input_list) throws Exception;
	
	public void insert_notice_category(BoardManage dto) throws Exception;
	
}