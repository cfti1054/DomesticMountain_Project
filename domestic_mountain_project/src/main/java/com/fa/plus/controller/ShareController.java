package com.fa.plus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/share/*")
public class ShareController {
	
	@GetMapping("list")
	public String recommendForm() {
		
		return ".share.list";
	}
}

