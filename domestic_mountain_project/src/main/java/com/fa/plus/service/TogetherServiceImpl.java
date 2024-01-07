package com.fa.plus.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fa.plus.common.FileManager;
import com.fa.plus.domain.Together;
import com.fa.plus.mapper.TogetherMapper;

@Service
public class TogetherServiceImpl implements TogetherService {
	@Autowired
	private TogetherMapper mapper;

	@Autowired
	private FileManager fileManager;

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
	public List<Together> listTogether(Map<String, Object> map) {
		List<Together> list = null;

		try {
			list = mapper.listTogether(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			mapper.updateHitCount(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Together findById(long num) {
		Together dto = null;

		// 게시물 가져오기
		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Together findByPrev(Map<String, Object> map) {
		Together dto = null;

		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Together findByNext(Map<String, Object> map) {
		Together dto = null;

		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void insertTogether(Together dto, String pathname) throws Exception {

		try {
			long post_num = mapper.post_seq();
			long gather_num = mapper.gather_seq();

			dto.setPost_num(post_num);
			dto.setGather_num(gather_num);

			mapper.insertTogether(dto);
			
			if (! dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if (saveFilename == null) {
						continue;
					}
					
					String originalFilename = mf.getOriginalFilename();
					
					dto.setOriginalFilename(originalFilename);
					dto.setSaveFilename(saveFilename);
					
					mapper.insertTogetherFile(dto);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void updateTogether(Together dto, String pathname) throws Exception {
		try {
			mapper.updateTogetherPost(dto);
			mapper.updateTogetherGather(dto);
			
			if(! dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if(saveFilename == null) {
						continue;
					}
					
					String originalFilename = mf.getOriginalFilename();
					
					dto.setOriginalFilename(originalFilename);
					dto.setSaveFilename(saveFilename);
					
					mapper.insertTogetherFile(dto);
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void deleteTogether(long num, String pathname) throws Exception {
		try {
			
			List<Together> listFile = listTogetherFile(num);
			if (listFile != null) {
				for (Together dto : listFile) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			
			// 파일 내용 지우기
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "file_num");
			map.put("post_num", num);
			
			deleteTogetherFile(map);
			
			mapper.deleteTogether(num);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void deleteTogetherFile(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteTogetherFile(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Together> listTogetherFile(long num) {
		List<Together> list = null;
		
		try {
			list = mapper.listTogetherFile(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Together findByFileId(long file_num) {
		Together dto = null;
		
		try {
			dto = mapper.findByFileId(file_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void insertParticipant(Map<String, Object> map) throws Exception {
		try {
			mapper.insertParticipant(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteParticipant(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteParticipant(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int ParticipantCount(long post_num) {
		int result = 0;
		
		try {
			result = mapper.ParticipantCount(post_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public boolean userParticipantCount(Map<String, Object> map) {
		boolean result = false;
		try {
			Together dto = mapper.userParticipantCount(map);
			if(dto != null) {
				result = true; 
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
