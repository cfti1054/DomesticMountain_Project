package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fa.plus.common.FileManager;
import com.fa.plus.domain.Recommend;
import com.fa.plus.mapper.RecommendMapper;

@Service
public class RecommendServiceImpl implements RecommendService{
	@Autowired
	private RecommendMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertRecommend(Recommend dto, String pathname) throws Exception {
	    try {
	        mapper.insertRecommend(dto);
	        
	        if (! dto.getSelectFile().isEmpty()) {
	            for (MultipartFile mf : dto.getSelectFile()) {
	                String saveFilename = fileManager.doFileUpload(mf, pathname);
	                if (saveFilename == null) {
	                    continue;
	                }

	                String originalFilename = mf.getOriginalFilename();

	                dto.setOriginalFilename(originalFilename);
	                dto.setSaveFilename(saveFilename);

	                mapper.insertRecommendFile(dto);
	            }
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
	        if (! dto.getSelectFile().isEmpty()) {
	            for (MultipartFile mf : dto.getSelectFile()) {
	                String saveFilename = fileManager.doFileUpload(mf, pathname);
	                if (saveFilename == null) {
	                    continue;
	                }

	                String originalFilename = mf.getOriginalFilename();

	                dto.setOriginalFilename(originalFilename);
	                dto.setSaveFilename(saveFilename);

	                mapper.insertRecommendFile(dto);
	            }
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

	@Override
	public void updateHitCount(long num) throws Exception {
		// 조회수 증가
				try {
					mapper.updateHitCount(num);
				} catch (Exception e) {
					e.printStackTrace();
					throw e;
				}
		
	}

	@Override
	public List<Recommend> listRecommendFile(long num) {
		List<Recommend> list = null;
		
		try {
			list = mapper.listRecommendFile(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public boolean userBoardLiked(Map<String, Object> map) {
		
		boolean result = false;
		try {
			Recommend dto = mapper.userBoardLiked(map);
			if(dto != null) {
				result = true; 
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
