package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.Createcourse;
import com.fa.plus.domain.Reply;

public interface CreatecourseService {

	public void insertCreatecourse(Createcourse dto, String pathname) throws Exception;
	
	List<Createcourse> listCreatecourse(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public Createcourse findById(long post_num);
	public Createcourse findById1(long file_num);
	public void updateHitCount(long file_num) throws Exception;
	public Createcourse findByPrev(Map<String, Object> map);
	public Createcourse findByNext(Map<String, Object> map);
	public void updateCreatecourse(Createcourse dto, String pathname) throws Exception;
	public void updateCreatecourse2(Createcourse dto, String pathname) throws Exception;
	public void deleteCreatecourse1(long file_num) throws Exception;
	public void deletePostlike(long post_num, String pathname, String userid, int usership) throws Exception;
	public void deletePostfile(long post_num, String pathname, String userid, int usership) throws Exception;
	public void deleteCreatecourse(long post_num, String pathname, String userid, int usership) throws Exception;
	
	public void insertBoardLike(Map<String, Object> map) throws Exception;
	public void deleteBoardLike(Map<String, Object> map) throws Exception;
	public int boardLikeCount(long post_num);
	public boolean userBoardLiked(Map<String, Object> map);
	
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void insertReply(Reply dto) throws Exception;
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	
	public List<Reply> listReplyAnswer(Map<String, Object> map);
	public int replyAnswerCount(Map<String, Object> map);
	
	public void insertReplyLike(Map<String, Object> map) throws Exception;
	public Map<String, Object> replyLikeCount(Map<String, Object> map);
	
	public void updateReplyShowHide(Map<String, Object> map) throws Exception;
	
}
