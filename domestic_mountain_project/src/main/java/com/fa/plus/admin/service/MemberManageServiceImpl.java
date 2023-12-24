package com.fa.plus.admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.MemberChart;
import com.fa.plus.admin.domain.MemberManage;
import com.fa.plus.admin.mapper.MemberManageMapper;

@Service
public class MemberManageServiceImpl implements MemberManageService {
	@Autowired
	private MemberManageMapper mapper;
	
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
	public List<MemberManage> listMember(Map<String, Object> map) {
		List<MemberManage> list = null;
		
		try {
			list = mapper.listMember(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public MemberManage findById(long useridx) {
		MemberManage dto = null;

		try {
			dto = mapper.findById(useridx);

			if (dto != null) {
				if (dto.getEmail() != null) {
					String[] s = dto.getEmail().split("@");
					dto.setEmail(s[0]);
				}

				if (dto.getTel() != null) {
					String[] s = dto.getTel().split("-");
					dto.setTel(s[0]);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateFailureCountReset(long useridx) throws Exception {
		try {
			mapper.updateFailureCountReset(useridx);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateMemberEnabled(Map<String, Object> map) throws Exception {
		try {
			mapper.updateMemberEnabled(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertMemberState(MemberManage dto) throws Exception {
		try {
			mapper.insertMemberState(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<MemberManage> listMemberState(long useridx) {
		List<MemberManage> list = null;
		
		try {
			list = mapper.listMemberState(useridx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public MemberManage findByState(long useridx) {
		MemberManage dto = null;

		try {
			dto = mapper.findByState(useridx);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

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

	@Override
	public void insertMemberRank(Map<String, Object> map) throws SQLException {
		try {
			mapper.insertMemberRank(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<MemberManage> listRank() {
		List<MemberManage> list = null;
		
		try {
			list = mapper.listRank();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<MemberManage> listMember() {
		List<MemberManage> list = null;
		try {
			list = mapper.findByAll();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	
}
