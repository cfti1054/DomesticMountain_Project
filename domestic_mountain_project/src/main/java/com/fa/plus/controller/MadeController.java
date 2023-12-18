package com.fa.plus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/made/*")
public class MadeController {
	
	@GetMapping("list")
	public String recommendForm() {
		
		return ".made.list";
	}
}

