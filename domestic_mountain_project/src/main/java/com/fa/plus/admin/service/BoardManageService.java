package com.fa.plus.admin.service;

import java.util.List;

import com.fa.plus.admin.domain.BoardManage;

public interface BoardManageService {

	public List<BoardManage> list_notice_category(); 
	public List<BoardManage> find_by_category_num(List<Integer> input_list);
}
