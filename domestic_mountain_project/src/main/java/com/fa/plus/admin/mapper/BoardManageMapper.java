package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.BoardManage;

@Mapper
public interface BoardManageMapper {
	
//	공지사항 카테고리
	public long notice_category_seq() throws SQLException;;
	public List<BoardManage> find_by_category_num(List<Integer> list) throws SQLException;;
	public List<BoardManage> list_notice_category();
	
	public void insert_notice_category(BoardManage dto);
	
}
