package com.fa.plus.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.User;
import com.fa.plus.mail.Mail;
import com.fa.plus.mail.MailSender;
import com.fa.plus.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private MailSender mailSender;
	
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
			mapper.insertRank(dto);
			
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
			
			mapper.updateUser1(dto);
			mapper.updateUser2(dto);
			
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
	public boolean findByEmailId(String email) {
		boolean b = false;
		try {
			/*
			 List<User> list = mapper.findByEmail(email);
			 if(list.size() > 0) {
					String result;
					result = email + "님의 아이디는 <b>"
							+ list.get(0).getUseridx()
							+ "</b> 입니다.";
			Mail mail = new Mail();
			mail.setReceiverEmail(email);	
		*/	
			
			
		} catch (Exception e) {
			
		}
		
		return b;
	}
	
	@Override
	public void deleteUser(Map<String, Object> map) throws Exception {
		try {
			map.put("usership", 0);
			updateUserShip(map);
			
			mapper.deleteUser2(map);
			mapper.deleteUser1(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public void generatePwd(User dto) throws Exception {
		// 임시패스워드
		StringBuilder sb = new StringBuilder();
		Random rd = new Random();
		String s = "~!@#$%^&*_+-=ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
		
		// 몇자리 보낼지 임시로 패스워드
		for(int i=0; i<5; i++) {
			int n = rd.nextInt(s.length());
			sb.append(s.substring(n, n + 1));
		}
		
		String result;
		result = dto. getUser_id() + "님의 새로 발급된 임시 패스워드 <b>"
			+ sb.toString()
			+ "</b> 입니다.<br>"
			+ "로그인 후 반드시 패스워드를 변경하시기 바랍니다.";
		
		Mail mail = new Mail();
		mail.setReceiverEmail(dto.getEmail());
		
		// 설정한 이메일
		mail.setSenderEmail("@gmail.com");	// 구글 이메일 입력칸
		mail.setSenderName("관리자");
		mail.setSubject("임시패스워드");
		mail.setContent(result);
		
		boolean b = mailSender.mailSend(mail);
		if ( b ) {
			//임시패스워드로 패스워드 바꾸깅 수혁잉
			dto.setUser_pwd(sb.toString());
			
			mapper.updateUser1(dto);
		} else {
			throw new Exception("이메일 전송중 오류가 발생했습니다");
		}
	}

	@Override
	public User findById(long useridx) {
		User dto = null;

		try {
			dto = mapper.findById(useridx);

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
	


}
