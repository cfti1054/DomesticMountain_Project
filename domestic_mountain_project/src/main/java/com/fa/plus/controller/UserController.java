package com.fa.plus.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.service.UserService;
import com.fa.plus.domain.User;
import com.fa.plus.domain.SessionInfo;

@Controller
@RequestMapping(value = "/user/*")
public class UserController {
	
	@Autowired
	private UserService service;
	
	@GetMapping("login")
	public String loginForm() {
		return ".user.login"; 
	}
	
	@PostMapping("login")
	public String loginSubmit(
			@RequestParam String user_id,
			@RequestParam String user_pwd,
			HttpSession session,
			Model model
			) {
		
			
		User dto = service.loginUser(user_id);
		if (dto == null || !user_pwd.equals(dto.getUser_pwd())) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return ".user.login"; 
		}

		// 세션에 로그인 정보 저장
		SessionInfo info = new SessionInfo();
		info.setUseridx(dto.getUseridx());
		info.setUserid(dto.getUser_id());
		info.setUsername(dto.getUser_name());
		info.setUsership(dto.getUsership());

		session.setMaxInactiveInterval(30 * 60); // 세션유지시간 30분, 기본:30분

		session.setAttribute("loginUser", info);

		// 로그인 이전 URI로 이동
		String uri = (String) session.getAttribute("preLoginURI");
		if (uri == null) {
			uri = "redirect:/";
		} else {
			uri = "redirect:" + uri;
		}
		
		
		return uri;
	}
	
	@GetMapping(value = "logout")
	public String logout(HttpSession session) {
		// 세션에 저장된 정보 지우기
		session.removeAttribute("loginUser");

		// 세션에 저장된 모든 정보 지우고, 세션초기화
		session.invalidate();

		return "redirect:/";
	}
	
	@GetMapping("noAuthorized")
	public String noAuthorized() {
		// 권한이 없는 유저가 접근 한 경우
		return ".user.noAuthorized";
	}
	
	// 회원가입 폼
		@GetMapping("user")
		public String memberForm(Model model) {
			model.addAttribute("mode", "user");
			return ".user.user";
		}
		
	// 회원 가입 완료 
		@PostMapping("user")
		public String userSubmit() {
			
			return "redirect://";
		}
		@PostMapping("update")
		public String complete() {
			
			return "";
		}
		
		@GetMapping("pwdFind")
		public String pwdFindForm() throws Exception {
			
			return "redirect:/";
		}
		
		@PostMapping("pwdFind")
		public String pwdFindSubmit() throws Exception {
			
			return "redirect:";
		}
		
		@GetMapping("idFind")
		public String idFindForm() throws Exception {
			
			return "";
		}
		
		@PostMapping("idFind")
		public String idFindSubmit() throws Exception {
			
			return "";
		}
}
