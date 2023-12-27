package com.fa.plus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@GetMapping("list")
	public String qnaForm() {
		
		return ".notice.list";
	}
}
