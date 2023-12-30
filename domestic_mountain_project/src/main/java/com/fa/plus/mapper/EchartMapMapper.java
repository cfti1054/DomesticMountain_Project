package com.fa.plus.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.EchartMap;

@Mapper
public interface EchartMapMapper {
	public List<EchartMap> listMountain(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public EchartMap findByName(long num);
}
