package com.fa.plus.service;

import java.sql.SQLException;
import java.util.Map;

import com.fa.plus.domain.Member;

public interface MemberService {
	public Member loginMember(String userId);
	
	public void insertMember(Member dto) throws SQLException;
	
	public void updateMemberShip(Map<String, Object> map) throws Exception;
	public void updateLastLogin(String userId) throws Exception;
	public void updateMember(Member dto) throws Exception;
	
	public Member findById(String userId);
	public Member findByPwd(String userPwd);
	
	public void deleteMember(Map<String, Object> map) throws Exception;
	
	// 임시 비밀번호를 받을 때 사용
	// public void generatePwd(Member dto) throws Exception;
}
