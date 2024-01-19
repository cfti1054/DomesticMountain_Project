package com.fa.plus.service;

import java.sql.SQLException;
import java.util.Map;

import com.fa.plus.domain.User;

public interface UserService {
	public User loginUser(String user_id);
	
	public void insertUser(User dto) throws SQLException;
	
	public void updateUserShip(Map<String, Object> map) throws Exception;
	public void updateUser(User dto) throws Exception;
	
	public User findById(String user_id);
	public User findById(long useridx); // 아이디 찾기 이메일로 아이디 전송
	
	public boolean findByEmailId(String email);
	
	public void deleteUser(Map<String, Object> map) throws Exception;
	
	// 임시 비밀번호를 받을 때 사용
	public void generatePwd(User dto) throws Exception;
}
