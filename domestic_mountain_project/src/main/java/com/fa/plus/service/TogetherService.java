package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.Together;


public interface TogetherService {
	public int dataCount(Map<String, Object> map);
	public List<Together> listTogether(Map<String, Object> map);
	
	public void updateHitCount(long num) throws Exception;
	public Together findById(long num);	// article
	public Together findByPrev(Map<String, Object> map);
	public Together findByNext(Map<String, Object> map);

	public void insertTogether(Together dto, String pathname) throws Exception;
	public void updateTogether(Together dto, String pathname) throws Exception;
	public void deleteTogether(long num, String pathname) throws Exception;
	

	// public void insertTogetherFile(Together dto) throws Exception;
	public List<Together> listTogetherFile(long num);
	public Together findByFileId(long file_num);
	public void deleteTogetherFile(Map<String, Object> map) throws Exception;
	
	// 신청인
	public void insertParticipant(Map<String, Object> map) throws Exception;
	public void deleteParticipant(Map<String, Object> map) throws Exception;
	public int participantCount(long post_num);
	public boolean userParticipantCount(Map<String, Object> map); 
}
