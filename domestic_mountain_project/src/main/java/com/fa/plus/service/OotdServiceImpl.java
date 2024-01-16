package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.common.FileManager;
import com.fa.plus.domain.Ootd;
import com.fa.plus.domain.Reply;
import com.fa.plus.mapper.OotdMapper;

@Service
public class OotdServiceImpl implements OotdService{
	@Autowired
	private OotdMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertOotd(Ootd dto, String pathname) throws Exception {
		try {
			
			long post_num = mapper.post_seq();
			long file_num = mapper.post_file_seq();
			
			dto.setPost_num(post_num);
			dto.setFile_num(file_num);
			
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (saveFilename != null) {
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getSelectFile().getOriginalFilename());
				mapper.insertOotd(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public List<Ootd> listOotd(Map<String, Object> map) {
		List<Ootd> list = null;

		try {
			list = mapper.listOotd(map);
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
	public Ootd findById(long post_num) {
		Ootd dto = null;

		// 게시물 가져오기
		try {
			dto = mapper.findById(post_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
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
	public Ootd findByPrev(Map<String, Object> map) {
		Ootd dto = null;

		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Ootd findByNext(Map<String, Object> map) {
		Ootd dto = null;

		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateOotd(Ootd dto, String pathname) throws Exception {
		try {
			mapper.updateOotd(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateOotd2(Ootd dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (saveFilename != null) {
				if (dto.getSaveFilename() != null && dto.getSaveFilename().length() != 0) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}

				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getSelectFile().getOriginalFilename());
			}

			mapper.updateOotd2(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deletePostlike(long post_num, String pathname, String userid, int usership) throws Exception {
		try {
			Ootd dto = findById(post_num);
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
			Ootd dto = findById(post_num);
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
	public void deleteOotd(long post_num, String pathname, String userid, int usership) throws Exception {
		try {
			mapper.deleteOotd(post_num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
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
	public boolean userBoardLiked(Map<String, Object> map) {
		boolean result = false;
		try {
			Ootd dto = mapper.userBoardLiked(map);
			if(dto != null) {
				result = true; 
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
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
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Reply> listReplyAnswer(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyAnswerCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertReplyLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateReplyShowHide(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteOotd1(long file_num) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
