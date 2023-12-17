package com.fa.plus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/services/*")
public class FaqController {
	
	@GetMapping("faq")
	public String qnaForm() {
		
		return ".services.faq";
	}
}
