package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.Recommend;

public interface RecommendService {
	public void insertRecommend(Recommend dto, String pathname) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Recommend> listRecommend(Map<String, Object> map);
	public Recommend findById(long num);
	public Recommend findByPrev(Map<String, Object> map);
	public Recommend findByNext(Map<String, Object> map);
	public void updateRecommend(Recommend dto, String pathname) throws Exception;
	public void deleteRecommend(long num, String pathname) throws Exception;
	
	public void updateHitCount(long num) throws Exception;
	
	public List<Recommend> listRecommendFile(long num);
	public boolean userBoardLiked(Map<String, Object> map);
}
