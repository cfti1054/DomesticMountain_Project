package com.fa.plus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/services/*")
public class ServicesController {
	
	@GetMapping("privacy")
	public String privacyForm() {
		
		return ".services.privacy";
	}
	
	@GetMapping("policy")
	public String policyForm() {
		
		return ".services.policy";
	}
	
	@GetMapping("comment")
	public String commentForm() {
		
		return ".services.comment";
	}
	
	@GetMapping("serviceTel")
	public String serviceTelForm() {
		
		return ".services.serviceTel";
	}
}
