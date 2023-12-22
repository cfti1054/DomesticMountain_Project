package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.MemberChart;
import com.fa.plus.admin.domain.MemberManage;

@Mapper
public interface MemberManageMapper {
	public int dataCount(Map<String, Object> map);
	public List<MemberManage> listMember(Map<String, Object> map);
	
	public MemberManage findById(long useridx);
	
	public void updateFailureCountReset(long useridx) throws SQLException;
	public void updateMemberEnabled(Map<String, Object> map) throws SQLException;
	public void insertMemberState(MemberManage dto) throws SQLException;
	public List<MemberManage> listMemberState(long useridx);
	public MemberManage findByState(long useridx);	
	
	public List<MemberChart> listAgeSection();
	
	// 회원등급 수정
	public void updateMemberRank(Map<String, Object> map) throws SQLException;
	public void insertMemberRank(MemberManage dto) throws SQLException;
	
	// 상세 등급 수정
	public List<MemberManage> listRank();
	
}
