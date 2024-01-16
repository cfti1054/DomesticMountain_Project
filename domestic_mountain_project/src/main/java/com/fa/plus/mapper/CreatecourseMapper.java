package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Createcourse;
import com.fa.plus.domain.Reply;


@Mapper
public interface CreatecourseMapper {
	public void insertCreatecourse(Createcourse dto) throws SQLException;
	public void updateCreatecourse(Createcourse dto) throws SQLException;
	public void updateCreatecourse2(Createcourse dto) throws SQLException;
	public void deleteCreatecourse1(long file_num) throws SQLException;
	public void deletePostlike(long post_num) throws SQLException;
	public void deletePostfile(long post_num) throws SQLException;
	public void deleteCreatecourse(long post_num) throws SQLException;
	public long post_file_seq();
	public long post_seq();
	
	
	List<Createcourse> listCreatecourse(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public Createcourse findById(long post_num);
	public Createcourse findById1(long file_num);
	public void updateHitCount(long post_num) throws SQLException;
	public Createcourse findByPrev(Map<String, Object> map);
	public Createcourse findByNext(Map<String, Object> map);
	
	public void insertBoardLike(Map<String, Object> map) throws SQLException;
	public void deleteBoardLike(Map<String, Object> map) throws SQLException;
	public int boardLikeCount(long post_num);
	public Createcourse userBoardLiked(Map<String, Object> map);
	
	public int replyCount(Map<String, Object> map);
	public List<Reply> listReply(Map<String, Object> map);
	public void insertReply(Reply dto) throws SQLException;

	public void deleteReply(Map<String, Object> map) throws SQLException;
	
	public List<Reply> listReplyAnswer(Map<String, Object> map);
	public int replyAnswerCount(Map<String, Object> map);
	
	public void insertReplyLike(Map<String, Object> map) throws SQLException;
	public Map<String, Object> replyLikeCount(Map<String, Object> map);
	
	public void updateReplyShowHide(Map<String, Object> map) throws SQLException;	

}
