package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Member;

@Mapper
public interface MemberMapper {
	public Member loginMember(String userId);
	
	public long memberSeq();
	public void insertMember(long memberIdx) throws SQLException; // userall
	public void insertMemberAll(Member dto) throws SQLException; // 회원가입
	
	// public Member findById(String userId); // 아이디 찾기
	
	
	// 비밀번호와 email이 UNIQUE가 아니므로 동일한 이메일이 존재할 수 있어서 List로 반환 받아야 함
	public List<Member> findByPwd(String userPwd); // 비밀번호 찾기
	// public List<Member> findByEmail(String email); // 이메일 찾기
	
	// 회원 정보 수정
	public void updateMember1(Member dto) throws SQLException;
	public void updateMember2(Member dto) throws SQLException;
	
}
