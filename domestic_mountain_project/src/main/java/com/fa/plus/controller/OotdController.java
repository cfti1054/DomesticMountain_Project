package com.fa.plus.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("ootd/*")
public class OotdController {
	
	@GetMapping("list")
	public String recommendForm() {
		
		return ".ootd.list";
	}
	
	@GetMapping("write")
	public String writeForm(Model model) throws Exception {
	
		return null;
	}
	
	@PostMapping("write")
	public String writeSubmit() throws Exception {
		
		return null;
	}
	
	@GetMapping("article")
	public String article() throws Exception {
		
		return null;
	}
	
	@GetMapping("update")
	public String updateForm() throws Exception {
		
		return null;
	}
	
	@PostMapping("update")
	public String updateSubmit() throws Exception {
	
		return null;
	}
	
	@GetMapping("delete")
	public String delete() throws Exception {
		
		return null;
	}
	
	// 댓글 리스트 : AJAX-TEXT
	@GetMapping("listReply")
	public String listReply() throws Exception {
			
		return null;
		}
		
	@PostMapping("insertBoardLike")
	@ResponseBody
	public Map<String, Object> insertBoardLike() throws Exception {
		
		return null;
	}
		
		
		
}

