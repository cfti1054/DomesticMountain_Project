package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.Notice;
import com.fa.plus.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeMapper mapper;
	
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
	public List<Notice> listNoticeTop() {
		List<Notice> list = null;
		
		try {
			list = mapper.listNoticeTop();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		List<Notice> list = null;
		
		try {
			list = mapper.listNotice(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void updateHitCount(long notice_category_num) throws Exception {
		try {
			mapper.updateHitCount(notice_category_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Notice findById(long notice_category_num) {
		Notice dto = null;
		
		try {
			dto = mapper.findById(notice_category_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Notice findByPrev(Map<String, Object> map) {
		Notice dto = null;
		
		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Notice findByNext(Map<String, Object> map) {
		Notice dto = null;
		
		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Notice> listNoticeFile(long num) {
		
		
		return null;
	}
	
	@Override
	public Notice findByFileId(long fileNum) {
		// TODO Auto-generated method stub
		return null;
	}
	
}