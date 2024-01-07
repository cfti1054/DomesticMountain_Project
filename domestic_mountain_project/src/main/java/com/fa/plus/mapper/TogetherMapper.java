package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Together;

@Mapper
public interface TogetherMapper {
	public long post_seq();
	public long gather_seq();
	
	
	public int dataCount(Map<String, Object> map);
	public List<Together> listTogether(Map<String, Object> map);

	public Together findById(long num);	// article
	public void updateHitCount(long num) throws SQLException;
	public Together findByPrev(Map<String, Object> map);
	public Together findByNext(Map<String, Object> map);
	
	public void insertTogether(Together dto) throws SQLException;
	public void updateTogetherPost(Together dto) throws SQLException;
	public void updateTogetherGather(Together dto) throws SQLException;
	public void deleteTogether(long num) throws SQLException;
	
	
	public void insertTogetherFile(Together dto) throws SQLException;
	public List<Together> listTogetherFile(long num);
	public Together findByFileId(long file_num);
	public void deleteTogetherFile(Map<String, Object> map) throws SQLException;
	
	
	// 신청인
	public void insertParticipant(Map<String, Object> map) throws SQLException;
	public void deleteParticipant(Map<String, Object> map) throws SQLException;
	public int ParticipantCount(long post_num);
	public Together userParticipantCount(Map<String, Object> map); 
	
}
