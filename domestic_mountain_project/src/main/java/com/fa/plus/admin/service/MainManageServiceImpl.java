package com.fa.plus.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.MemberChart;
import com.fa.plus.admin.mapper.MemberManageMapper;

@Service
public class MainManageServiceImpl implements MainManageService {
	@Autowired
	private MemberManageMapper mapper;
	
	@Override
	public List<MemberChart> listAgeSection() {
		List<MemberChart> list = null;
		
		try {
			list = mapper.listAgeSection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
