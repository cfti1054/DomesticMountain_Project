package com.fa.plus.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	/*
	@Autowired
	private MemberService service;
	
	@GetMapping("login")
	public String loginForm() {
		return ".member.login";
	}
	
	@PostMapping("login")
	public String loginSubmit(
			@RequestParam String userId,
			@RequestParam String userPwd,
			HttpSession session,
			Model model
			) {
		
		
		return null;
	}
	*/
}
