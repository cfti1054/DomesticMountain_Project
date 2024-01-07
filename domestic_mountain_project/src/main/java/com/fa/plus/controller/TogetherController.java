package com.fa.plus.controller;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.common.FileManager;
import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.domain.Together;
import com.fa.plus.service.TogetherService;

@Controller
@RequestMapping("/together/*")
public class TogetherController {

	@Autowired
	private TogetherService service;

	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;

	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType, 
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req, 
			Model model
			) throws Exception {

		int size = 5;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);

		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}

		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		List<Together> list = service.listTogether(map);

		String cp = req.getContextPath();

		String query = "";
		String listUrl = cp + "/together/list";
		String articleUrl = cp + "/together/article?page=" + current_page;
		if (kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}

		if (query.length() != 0) {
			listUrl += "?" + query;
			articleUrl = cp + "/together/article?page=" + current_page + "&" + query;
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

		return ".together.list";
	}

	@GetMapping("write")
	public String writeForm(Model model, HttpSession session) throws Exception {

		model.addAttribute("mode", "write");

		return ".together.write";
	}

	@PostMapping("write")
	public String writeSubmit(Together dto, HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("loginUser");

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "together";

			dto.setPost_reg_id(info.getUseridx());
			service.insertTogether(dto, pathname);
		} catch (Exception e) {
		}

		return "redirect:/together/list";
	}
	
	
	@GetMapping("article")
	public String article(
			@RequestParam long post_num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType, 
			@RequestParam(defaultValue = "") String kwd,
			Model model
			) throws Exception {
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		
		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		service.updateHitCount(post_num);
		
		Together dto = service.findById(post_num);
		if (dto == null) {
			return "redirect:/together/list?" + query;
		}
		
		// 스마트 에디어 사용시
		dto.setPost_content(dto.getPost_content().replaceAll("\n", "<br>"));
		
		// 이전글, 다음글 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("post_num", post_num);
		
		Together prevDto = service.findByPrev(map);
		Together nextDto = service.findByNext(map);
		
		// file
		List<Together> listFile = service.listTogetherFile(post_num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".together.article";
	}
	
	@GetMapping("update")
	public String updateForm(
			@RequestParam long post_num,
			@RequestParam String page,
			HttpSession session,
			Model model
			) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("loginUser");
		
		Together dto = service.findById(post_num);
		if(dto == null || ! info.getUserid().equals(dto.getUser_id())) {
			return "redirect:/together/list?page=" + page;
		}
		
		List<Together> listFile = service.listTogetherFile(post_num);
		
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		
		return ".together.write";
	}
	
	@PostMapping("update")
	public String updateSubmit(
			Together dto,
			@RequestParam String page,
			HttpSession session
			) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("loginUser");
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "together";

			dto.setPost_reg_id(info.getUseridx());
			service.updateTogether(dto, pathname);
			
			
		} catch (Exception e) {
		}
		
		return "redirect:/together/list?page=" + page;
	}
	
	
	@GetMapping("delete")
	public String delete(
			@RequestParam long post_num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session
			) throws Exception {
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		String query = "page=" + page;
		
		if(kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "notice";
			service.deleteTogether(post_num, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/together/list?" + query;
	}
	
	@GetMapping("download")
	public void download(
			@RequestParam long file_num,
			HttpServletResponse resp,
			HttpSession session
			) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";

		boolean b = false;
		
		Together dto = service.findByFileId(file_num);
		if(dto != null) {
			String saveFilename = dto.getSaveFilename();
			String originalFilename = dto.getOriginalFilename();
			
			b = fileManager.doFileDownload(saveFilename, originalFilename, pathname, resp);
		}
		
		if (! b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능 합니다 !!!');history.back();</script>");
			} catch (Exception e) {
			}
		}
		
	}
	
	@PostMapping("deleteFile")
	@ResponseBody
	public Map<String, Object> deleteFile(
			@RequestParam long file_num,
			HttpSession session
			) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";

		Together dto = service.findByFileId(file_num);
		if (dto != null) {
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
		}
		
		String state = "false";
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "file_num");
			map.put("post_num", file_num);
			service.deleteTogetherFile(map);
			
			state = "true";
		} catch (Exception e) {
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	@PostMapping("insertParticipant")
	@ResponseBody
	public Map<String, Object> insertParticipant(
			@RequestParam long post_num,
			@RequestParam boolean userApply,
			HttpSession session
			) throws Exception {
		
		String state = "true";
		
		int participantCount = 0;
		SessionInfo info = (SessionInfo) session.getAttribute("loginUser");

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("post_num", post_num);
		paramMap.put("useridx", info.getUseridx());

		try {
			if(userApply) {
				service.deleteParticipant(paramMap);
			} else {
				service.insertParticipant(paramMap);
			}
		} catch (DuplicateKeyException e) {
			state = "liked";
		} catch (Exception e) {
			state = "false";
		}

		participantCount = service.ParticipantCount(post_num);

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		model.put("participantCount", participantCount);

		
		return model;
	}
	
	
	
	

}
