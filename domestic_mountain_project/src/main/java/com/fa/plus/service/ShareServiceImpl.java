package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.common.FileManager;
import com.fa.plus.domain.Share;
import com.fa.plus.domain.Reply;
import com.fa.plus.mapper.ShareMapper;

@Service
public class ShareServiceImpl implements ShareService {
	
	@Autowired
	private ShareMapper mapper;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertShare(Share dto, String pathname) throws Exception {
		
		try {

			long post_num = mapper.post_seq();
			long file_num = mapper.post_file_seq();
			
			dto.setPost_num(post_num);
			dto.setFile_num(file_num);
			
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if(saveFilename != null) {
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getSelectFile().getOriginalFilename());
				
				mapper.insertShare(dto);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Share> listShare(Map<String, Object> map) {
		List<Share> list = null;
		
		try {
			list = mapper.listShare(map);
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
	public Share findByPrev(Map<String, Object> map) {
		Share dto = null;
		
		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Share findByNext(Map<String, Object> map) {
		Share dto = null;
		
		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Share findById(long post_num) {
		Share dto = null;
		
		try {
			dto = mapper.findById(post_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public boolean userBoardLiked(Map<String, Object> map) {
		
		boolean result = false;
		try {
			Share dto = mapper.userBoardLiked(map);
			if(dto != null) {
				result = true; 
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void insertBoardLike(Map<String, Object> map) throws Exception {
		try {
			mapper.insertBoardLike(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteBoardLike(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteBoardLike(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int boardLikeCount(long post_num) {
		int result = 0;
		
		try {
			result = mapper.boardLikeCount(post_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	@Override
	public void updateShare(Share dto, String pathname) throws Exception {
		try {
			mapper.updateShare(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public void updateShare2(Share dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (saveFilename != null) {
				if (dto.getSaveFilename() != null && dto.getSaveFilename().length() != 0) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}

				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getSelectFile().getOriginalFilename());
			}

			mapper.updateShare2(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public void deletePostlike(long post_num, String pathname, String userid, int usership) throws Exception {
		try {
			Share dto = findById(post_num);
			if (dto == null || (usership < 51 && ! dto.getUser_id().equals(userid))) {
				return;
			}

			fileManager.doFileDelete(dto.getSaveFilename(), pathname);

			mapper.deletePostlike(post_num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deletePostfile(long post_num, String pathname, String userid, int usership) throws Exception {
		try {
			Share dto = findById(post_num);
			if (dto == null || (usership < 51 && ! dto.getUser_id().equals(userid))) {
				return;
			}

			fileManager.doFileDelete(dto.getSaveFilename(), pathname);

			mapper.deletePostfile(post_num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public void deleteShare(long post_num, String pathname, String userid, int usership) throws Exception {
		try {
			// Share dto = findById(post_num);
			/*
			 * if (dto == null || (usership < 51 && ! dto.getUser_id().equals(userid))) {
			 
				return;
			}
			*/
			mapper.deleteShare(post_num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list = null;
		
		try {
			list = mapper.listReply(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.replyCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void insertReply(Reply dto) throws Exception {
		try {
			mapper.insertReply(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteReply(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Reply> listReplyAnswer(Map<String, Object> map) {
		List<Reply> list = null;
		
		try {
			list = mapper.listReplyAnswer(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int replyAnswerCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.replyAnswerCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void insertReplyLike(Map<String, Object> map) throws Exception {
		try {
			mapper.insertReplyLike(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		Map<String, Object> countMap = null;
		
		try {
			countMap = mapper.replyLikeCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return countMap;
	}

	@Override
	public void updateReplyShowHide(Map<String, Object> map) throws Exception {
		try {
			mapper.updateReplyShowHide(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}			
	}

	@Override
	public void deleteShare1(long file_num) throws Exception {
		try {
			mapper.deleteShare1(file_num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Share findById1(long file_num) {
		Share dto = null;
		
		try {
			dto = mapper.findById1(file_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	

	
	
}
