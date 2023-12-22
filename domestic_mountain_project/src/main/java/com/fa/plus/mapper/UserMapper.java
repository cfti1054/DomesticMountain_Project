package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.User;

@Mapper
public interface UserMapper {
	public User loginUser(String user_id);
	
	public long UserSeq();
	
	public void insertUserAll(long useridx) throws SQLException; //
	public void insertUser1(User dto) throws SQLException; //
	public void insertUser2(User dto) throws SQLException; //
	public void insertUser12(User dto) throws SQLException; //
	
	
	public User findById(String user_id); // 아이디 찾기
	
	
	// 비밀번호와 email이 UNIQUE가 아니므로 동일한 이메일이 존재할 수 있어서 List로 반환 받아야 함
	public List<User> findByPwd(String user_pwd); // 비밀번호 찾기
	// public List<User> findByEmail(String email); // 이메일 찾기
	
	// 회원 정보 수정
	public void updateUser1(User dto) throws SQLException;
	public void updateUser2(User dto) throws SQLException;

	public void updateUsership(Map<String, Object> map);

	public void deleteUser1(Map<String, Object> map) throws SQLException;
	public void deleteUser2(Map<String, Object> map) throws SQLException;
	
}
