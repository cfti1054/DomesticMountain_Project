package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.EchartMap;
import com.fa.plus.mapper.EchartMapMapper;

@Service
public class EchartMapServiceImpl implements EchartMapService {
	@Autowired
	private EchartMapMapper mapper;

	@Override
	public List<EchartMap> listMountain(Map<String, Object> map) {
		List<EchartMap> list = null;
		
		try {
			list = mapper.listMountain(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public EchartMap findByName(long num) {
		EchartMap dto = null;
		
		try {
			dto = mapper.findByName(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public EchartMap findById(long num) {
		EchartMap dto = null;
		
		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
