package com.fa.plus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/emaps/*")
public class EChartsMapController {
	
	@GetMapping("main")
	public String main() throws Exception {
		return ".echartsMap.main";
	}

}
