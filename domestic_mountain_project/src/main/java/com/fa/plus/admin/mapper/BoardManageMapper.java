package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.BoardManage;

@Mapper
public interface BoardManageMapper {
	
//	공지사항 카테고리
	public long notice_category_seq() throws SQLException;
	public List<BoardManage> find_by_category_num(List<Integer> list) throws SQLException;
	public List<BoardManage> list_notice_category() throws SQLException;
	
	public void insert_notice_category(BoardManage dto) throws SQLException;
	public void update_notice_category(BoardManage dto) throws SQLException;
	
// 공지사항 게시판
	public long notice_board_seq() throws SQLException;
	public BoardManage find_by_notice_board_num(Long l) throws SQLException;
	public List<BoardManage> list_notice_board() throws SQLException;
	
	public void insert_notice_board(BoardManage dto) throws SQLException;
	public void update_notice_board(BoardManage dto) throws SQLException;
	
}
