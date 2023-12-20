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
	
	
	
//	@Autowired
//	private BCryptPasswordEncoder bcryptEncoder;
	
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
			
			
			// 패스워드 암호화 사용? 해야겠지.?
//			String encPwd = bcryptEncoder.encode(dto.getUser_pwd());
//			dto.setUser_pwd(encPwd);
			
			// 시퀀스 번호 가져오기
			long seq = mapper.UserSeq();
			dto.setUseridx(seq);
			
			
			// 회원번호, usership 저장
			mapper.insertUserAll(seq);
			
			// user1, user2 테이블에 저장
			mapper.insertUser1(dto);
			mapper.insertUser2(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateUserShip(Map<String, Object> map) throws Exception {
		try {
			mapper.updateUsership(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateUser(User dto) throws Exception {
		try {
			if (dto.getEmail1().length() != 0 && dto.getEmail2().length() != 0) {
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			}

			if (dto.getTel1().length() != 0 && dto.getTel2().length() != 0 && dto.getTel3().length() != 0) {
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			}
			
			// 패스워드가 변경된 경우만 member1 테이블의 패스워드를 변경하도록 변경해야함
//			String encPwd = bcryptEncoder.encode(dto.getUser_pwd());
//			
//			dto.setUser_pwd(encPwd);
			
			mapper.insertUser1(dto);
			
			mapper.insertUser2(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public User findById(String user_id) {
		User dto = null;
		try {
			dto = mapper.findById(user_id);
			
			if (dto != null) {
				if (dto.getEmail() != null) {
					String[] s = dto.getEmail().split("@");
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}
				if (dto.getTel() != null) {
					String[] s = dto.getTel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return dto;
	}

	@Override
	public User findById(long useridx) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public boolean findByEmailId(String email) {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public void deleteUser(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void generatePwd(User dto) throws Exception {
		// TODO Auto-generated method stub
		
	}



	
}
