package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.fa.plus.domain.Recommend;

public interface RecommendMapper {
	public void insertRecommend(Recommend dto) throws SQLException;
	public void insertRecommendFile(Recommend dto) throws SQLException;
	
	public void updateRecommend(Recommend dto) throws SQLException;
	public void deleteRecommend(long num) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<Recommend> listRecommend(Map<String, Object> map);
	
	public Recommend findById(long num);
	public Recommend findByPrev(Map<String, Object> map);
	public Recommend findByNext(Map<String, Object> map);
	
	public void updateHitCount(long num) throws SQLException;
	
	public Recommend userBoardLiked(Map<String, Object> map);
	public List<Recommend> listRecommendFile(long num);
	public long post_file_seq();
	public long post_seq();
}
