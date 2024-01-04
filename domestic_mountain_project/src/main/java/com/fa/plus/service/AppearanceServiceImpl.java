package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.common.FileManager;
import com.fa.plus.domain.Appearance;
import com.fa.plus.mapper.AppearanceMapper;

@Service
public class AppearanceServiceImpl implements AppearanceService {
	
	@Autowired
	private AppearanceMapper mapper;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertAppearance(Appearance dto, String pathname) throws Exception {
		
		try {
			long post_num = mapper.post_seq();
			long file_num = mapper.post_file_seq();
			
			dto.setPost_num(post_num);
			dto.setFile_num(file_num);
			
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if(saveFilename != null) {
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getSelectFile().getOriginalFilename());
			}
			mapper.insertAppearance(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Appearance> listAppearance(Map<String, Object> map) {
		List<Appearance> list = null;
		
		try {
			list = mapper.listAppearance(map);
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
	public void updateHitCount(long file_num) throws Exception {
		try {
			mapper.updateHitCount(file_num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Appearance findByPrev(Map<String, Object> map) {
		Appearance dto = null;
		
		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Appearance findByNext(Map<String, Object> map) {
		Appearance dto = null;
		
		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Appearance findById(long file_num) {
		Appearance dto = null;
		
		try {
			dto = mapper.findById(file_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
	
}
