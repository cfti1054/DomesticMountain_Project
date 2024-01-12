package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.Ootd;
import com.fa.plus.domain.Reply;

public interface OotdService {
	public void insertOotd(Ootd dto, String pathname) throws Exception;                            
    
	List<Ootd> listOotd(Map<String, Object> map);                                                  
	public int dataCount(Map<String, Object> map);                                                             
	                                                                                                           
	public Ootd findById(long post_num);                                                                 
	public void updateHitCount(long file_num) throws Exception;                                                
	public Ootd findByPrev(Map<String, Object> map);                                                     
	public Ootd findByNext(Map<String, Object> map);                                                     
	public void updateOotd(Ootd dto, String pathname) throws Exception;                            
	public void updateOotd2(Ootd dto, String pathname) throws Exception;                           
	public void deletePostlike(long post_num, String pathname, String userid, int usership) throws Exception;  
	public void deletePostfile(long post_num, String pathname, String userid, int usership) throws Exception;  
	public void deleteOotd(long post_num, String pathname, String userid, int usership) throws Exception;
	                                                                                                           
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
