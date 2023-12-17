package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.Support;

@Mapper
public interface SupportMapper {
	
	public long faqCategorySeq();
	public long faqCategoryOrderSeq();
	
	public void insertFaqCategory(Support dto) throws SQLException;
	public void updateFaqCategory(Support dto) throws SQLException;
	

	public Support findByNum(long faqBoardNum);
	public Support findByCategory(long categoryNum);
	public List<Support> listFaqCategory() throws SQLException;
	public int boardCount(Map<String, Object> map);
	public int categoryCount(Map<String, Object> map);
	
	public long faqBoardSeq();
	
	public void insertFaqBoard(Support dto) throws SQLException;
	public void updateFaqBoard(Support dto) throws SQLException;
	
	public List<Support> listFaqBoard(long faqBoardNum) throws SQLException;
	
	
	
	
	
	
	

}
