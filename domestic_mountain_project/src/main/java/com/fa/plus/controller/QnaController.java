package com.fa.plus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/services/*")
public class QnaController {
	
	@GetMapping("qna_list")
	public String qnaForm() {
		
		return ".services.qna_list";
	}
}
