package com.fa.plus.admin.service;

import java.util.List;

import com.fa.plus.admin.domain.BoardManage;

public interface BoardManageService {

	public List<BoardManage> list_notice_category() throws Exception; 
	public List<BoardManage> find_by_category_num(List<String> input_list) throws Exception;
	
	public void insert_notice_category(BoardManage dto) throws Exception;
	public void update_notice_category(BoardManage dto) throws Exception;
	
	public List<BoardManage> list_notice_board() throws Exception;
	public BoardManage find_by_notice_board_num(String s) throws Exception;
	
	public void insert_notice_board(BoardManage dto) throws Exception;
	
	
	
	
}
