package com.fa.plus.admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.MemberChart;
import com.fa.plus.admin.domain.MemberManage;

public interface MemberManageService {
	public int dataCount(Map<String, Object> map);
	public List<MemberManage> listMember(Map<String, Object> map);
	
	public MemberManage findById(long useridx);

	public void updateFailureCountReset(long useridx) throws Exception;
	public void updateMemberEnabled(Map<String, Object> map) throws Exception;
	public void insertMemberState(MemberManage dto) throws Exception;
	public List<MemberManage> listMemberState(long useridx);
	public MemberManage findByState(long useridx);	
	
	public List<MemberChart> listAgeSection();
	
	// 회원등급 수정
	public void insertMemberRank(Map<String, Object> map) throws SQLException;
	
	// 상세 등급 수정
	public List<MemberManage> listRank();	
}
