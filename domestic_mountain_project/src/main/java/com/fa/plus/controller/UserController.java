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
			@RequestParam String userId,
			@RequestParam String userPwd,
			HttpSession session,
			Model model
			) {
		User dto = service.loginUser(userId);
		if (dto == null || !userPwd.equals(dto.getUser_pwd())) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return ".member.login";
		}

		// 세션에 로그인 정보 저장
		SessionInfo info = new SessionInfo();
		info.setUseridx(dto.getUseridx());
		info.setUserid(dto.getUser_id());
		info.setUsername(dto.getUser_name());
		info.setUsership(dto.getUsership());

		session.setMaxInactiveInterval(30 * 60); // 세션유지시간 30분, 기본:30분

		session.setAttribute("User", info);

		// 로그인 이전 URI로 이동
		String uri = (String) session.getAttribute("preLoginURI");
		session.removeAttribute("preLoginURI");
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
		session.removeAttribute("User");

		// 세션에 저장된 모든 정보 지우고, 세션초기화
		session.invalidate();

		return "redirect:/";
	}
}
