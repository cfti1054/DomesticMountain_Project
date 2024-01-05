package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Appearance;


@Mapper
public interface AppearanceMapper {
	public void insertAppearance(Appearance dto) throws SQLException;
	public void updateAppearance(Appearance dto) throws SQLException;
	public void updateAppearance2(Appearance dto) throws SQLException;
	// public void deleteAppearance(long post_num) throws SQLException;
	public long post_file_seq();
	public long post_seq();
	
	
	List<Appearance> listAppearance(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public Appearance findById(long file_num);
	public void updateHitCount(long file_num) throws SQLException;
	public Appearance findByPrev(Map<String, Object> map);
	public Appearance findByNext(Map<String, Object> map);
	
	public void insertBoardLike(Map<String, Object> map) throws SQLException;
	public void deleteBoardLike(Map<String, Object> map) throws SQLException;
	public int boardLikeCount(long post_num);
	public Appearance userBoardLiked(Map<String, Object> map);
	
	/*
	 * 
	public void insertReply(Reply dto) throws SQLException;
	public int replyCount(Map<String, Object> map);
	public List<Reply> listReply(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws SQLException;
	
	public List<Reply> listReplyAnswer(Map<String, Object> map);
	public int replyAnswerCount(Map<String, Object> map);
	
	public void insertReplyLike(Map<String, Object> map) throws SQLException;
	public Map<String, Object> replyLikeCount(Map<String, Object> map);
	
	public void updateReplyShowHide(Map<String, Object> map) throws SQLException;	
	 */
}
