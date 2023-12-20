package com.fa.plus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("Related/*")
public class RelatedController {
	
	@GetMapping("main")
	public String recommendForm() {
		
		return ".Related.main";
	}
}

