package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.Appearance;

public interface AppearanceService {

	public void insertAppearance(Appearance dto, String pathname) throws Exception;
	
	List<Appearance> listAppearance(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public Appearance findById(long file_num);
	public void updateHitCount(long file_num) throws Exception;
	public Appearance findByPrev(Map<String, Object> map);
	public Appearance findByNext(Map<String, Object> map);
	
}
