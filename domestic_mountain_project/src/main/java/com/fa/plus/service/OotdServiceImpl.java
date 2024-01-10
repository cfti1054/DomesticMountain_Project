package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.fa.plus.domain.Ootd;
import com.fa.plus.domain.Reply;

@Service
public class OotdServiceImpl implements OotdService{

	@Override
	public void insertOotd(Ootd dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Ootd> listOotd(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Ootd findById(long post_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHitCount(long file_num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Ootd findByPrev(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Ootd findByNext(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateOotd(Ootd dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateOotd2(Ootd dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletePostlike(long post_num, String pathname, String userid, int usership) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletePostfile(long post_num, String pathname, String userid, int usership) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteOotd(long post_num, String pathname, String userid, int usership) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertBoardLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoardLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int boardLikeCount(long post_num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean userBoardLiked(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
