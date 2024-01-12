package com.fa.plus.controller;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.common.FileManager;
import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.Ootd;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.service.OotdService;


@Controller
@RequestMapping("ootd/*")
public class OotdController {
	
	@Autowired
	private OotdService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	
	@GetMapping("list")
	public String recommendForm(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);

		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = dataCount / size + (dataCount % size > 0 ? 1 : 0);
		}
		
		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if (total_page < current_page) {
			current_page = total_page;
		}

		// 리스트에 출력할 데이터를 가져오기
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);
		
		// 글 리스트
		List<Ootd> list = service.listOotd(map);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);

		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		return ".ootd.list";
	}
	
	@GetMapping("write")
	public String writeForm(Model model) throws Exception {
	
		model.addAttribute("mode", "write");
		
		return ".ootd.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Ootd dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("loginUser");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "ootd";
		
		try {
			dto.setPost_reg_id(info.getUseridx());
			service.insertOotd(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/ootd/list";
	}
	
	@GetMapping("article")
	public String article(@RequestParam long post_num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session,
			Model model) throws Exception {
		
		kwd = URLDecoder.decode(kwd, "utf-8");

		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + 
					"&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}

		service.updateHitCount(post_num);

		// 해당 레코드 가져 오기
		Ootd dto = service.findById(post_num);
		if (dto == null) {
			return "redirect:/ootd/list?" + query;
		}
		
		// 스마트 에디터를 사용하므로

		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("post_num", post_num);

		Ootd prevDto = service.findByPrev(map);
		Ootd nextDto = service.findByNext(map);

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		// 게시글 좋아요 여부
		map.put("userId", info.getUseridx());
		boolean userBoardLiked = service.userBoardLiked(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);

		model.addAttribute("page", page);
		model.addAttribute("query", query);

		model.addAttribute("userBoardLiked", userBoardLiked);
		
		return ".ootd.article";
	}
	
	@GetMapping("update")
	public String updateForm(@RequestParam long post_num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("loginUser");
		
		Ootd dto = service.findById(post_num);
		if (dto == null || ! info.getUserid().equals(dto.getUser_id())) {
			return "redirect:/ootd/list?page=" + page;
		}
		
		model.addAttribute("dto", dto);      
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);    
		
		return ".ootd.write";
	}
	
	@PostMapping("update")
	public String updateSubmit(Ootd dto,
			@RequestParam String page,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "ootd";
		
		try {
			service.updateOotd(dto, pathname);
			service.updateOotd2(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/ootd/list?page=" + page;
	}
	
	@GetMapping("delete")
	public String delete(@RequestParam long post_num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("loginUser");
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "ootd";
		
		service.deleteOotd(post_num, pathname, info.getUserid(), info.getUsership());
		
		return "redirect:/ootd/list?" + query;
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

