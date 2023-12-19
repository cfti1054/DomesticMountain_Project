package com.fa.plus.service;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.User;
import com.fa.plus.mapper.UserMapper;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper mapper;
	
	@Override
	public User loginUser(String user_id) {
		User dto = null;

		try {
			dto = mapper.loginUser(user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void insertUser(User dto) throws SQLException {
		try {
			if(dto.getEmail1().length()!=0 && dto.getEmail2().length()!=0) {
				dto.setEmail(dto.getEmail1()+"@"+dto.getEmail2());
			}
			
			if(dto.getTel1().length()!=0 && dto.getTel2().length()!=0 && dto.getTel3().length()!=0) {
				dto.setTel(dto.getTel1()+"-"+dto.getTel2()+"-"+dto.getTel3());
			}
			
			// 시퀀스 번호 가져오기
			long seq = mapper.UserSeq();
			dto.setUseridx(seq);
			
			// 회원번호, membership 저장
			mapper.insertUserAll(seq);
			
			// member1, member2 테이블 저장
			//mapper.insertMember12(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateUserShip(Map<String, Object> map) throws Exception {
		
		
	}

	@Override
	public void updateUser(User dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User findById(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User findById(long userIdx) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	@Override
	public void deleteUser(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void generatePwd(User dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean findByEmailId(String email) {
		// TODO Auto-generated method stub
		return false;
	}


	
}
