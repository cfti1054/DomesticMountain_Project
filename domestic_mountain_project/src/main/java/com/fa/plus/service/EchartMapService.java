package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.EchartMap;

public interface EchartMapService {
	public List<EchartMap> listMountain(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public EchartMap findByName(long num);
}
