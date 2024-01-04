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

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.Appearance;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.service.AppearanceService;

@Controller
@RequestMapping("appearance/*")
public class AppearanceController {
	
	@Autowired
	private AppearanceService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String recommendForm(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();

		int size = 5;
		int total_page;
		int dataCount;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);

		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);

		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		List<Appearance> list = service.listAppearance(map);

		String query = "";
		String listUrl = cp + "/appearance/list";
		String articleUrl = cp + "/appearance/article?page=" + current_page;
		if (kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}

		if (query.length() != 0) {
			listUrl += "?" + query;
			articleUrl = cp + "/appearance/article?page=" + current_page + "&" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);

		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		return ".appearance.list";
	}
	
	@GetMapping("write")
	public String writeForm(Model model) throws Exception {
		model.addAttribute("mode", "write");
		
		return ".appearance.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Appearance dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("loginUser");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "appearance";
		
		try {
			dto.setPost_reg_id(info.getUseridx());
			service.insertAppearance(dto, pathname);
			System.out.println(dto.getPost_title());
		} catch (Exception e) {
		}
		
		return "redirect:/appearance/list";
	}
	
	@GetMapping("article")
	public String srticle(
			@RequestParam long post_num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session,
			Model model
			) throws Exception {
		
		kwd = URLDecoder.decode(kwd, "utf-8");

		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + 
					"&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		service.updateHitCount(post_num);
		
		Appearance dto = service.findById(post_num);
		if (dto == null) {
			return "redirect:/appearance/list?" + query;
		}
		
		// 스마트 에디터 사용시
		dto.setPost_content(myUtil.htmlSymbols(dto.getPost_content()));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("post_num", post_num);
		
		Appearance prevDto = service.findByPrev(map);
		Appearance nextDto = service.findByNext(map);
		
//		SessionInfo info = (SessionInfo) session.getAttribute("user");
		// 게시글 좋아요 여부
//		map.put("userId", info.getUserId());
//		boolean userBoardLiked = service.userBoardLiked(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);

		model.addAttribute("page", page);
		model.addAttribute("query", query);

//		model.addAttribute("userBoardLiked", userBoardLiked);
		
		return ".appearance.article";
	}
	
}

