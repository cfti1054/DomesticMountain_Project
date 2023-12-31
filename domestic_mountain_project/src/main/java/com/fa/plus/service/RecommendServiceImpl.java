package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.Recommend;
import com.fa.plus.mapper.RecommendMapper;
import com.fa.plus.common.FileManager;

@Service
public class RecommendServiceImpl implements RecommendService{
	@Autowired
	private RecommendMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertRecommend(Recommend dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (saveFilename != null) {
				dto.setFile_name(saveFilename);

				mapper.insertRecommend(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
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
	public List<Recommend> listRecommend(Map<String, Object> map) {
		List<Recommend> list = null;

		try {
			list = mapper.listRecommend(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Recommend findById(long num) {
		Recommend dto = null;

		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Recommend findByPrev(Map<String, Object> map) {
		Recommend dto = null;

		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Recommend findByNext(Map<String, Object> map) {
		Recommend dto = null;

		try {
			dto =  mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateRecommend(Recommend dto, String pathname) throws Exception {
		try {
			// 업로드한 파일이 존재한 경우
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);

			if (saveFilename != null) {
				// 이전 파일 지우기
				if (dto.getFile_name().length() != 0) {
					fileManager.doFileDelete(dto.getFile_name(), pathname);
				}

				dto.setFile_name(saveFilename);
			}

			 mapper.updateRecommend(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteRecommend(long num, String pathname) throws Exception {
		try {
			if (pathname != null) {
				fileManager.doFileDelete(pathname);
			}

			// 게시물지우기
			 mapper.deleteRecommend(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
