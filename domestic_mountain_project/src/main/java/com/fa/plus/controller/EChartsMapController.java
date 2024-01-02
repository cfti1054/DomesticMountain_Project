package com.fa.plus.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.EchartMap;
import com.fa.plus.service.EchartMapService;

@Controller
@RequestMapping("/echartsMap/*")
public class EChartsMapController {
	@Autowired
	private EchartMapService service;
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
	
	@RequestMapping("main")
	public String main(
			@RequestParam(defaultValue = "mountain_name") String schType,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(defaultValue = "") String sido_name,
			@RequestParam(defaultValue = "") String sigungoo_name,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		String cp = req.getContextPath();
		
		int dataCount = 0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("sido_name", sido_name);
		map.put("sigungoo_name", sigungoo_name);
		
		dataCount = service.dataCount(map);
		
		List<EchartMap> list = service.listMountain(map);
		
		String query = "";
		String listUrl = cp + "/echartsMap/main";
		String articleUrl = cp + "/echartsMap/article";
		
		if (kwd.length() != 0) {
			query =  "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		if (query.length() != 0) {
			listUrl = listUrl + "?" + query;
			articleUrl = cp + "/echartsMap/article?" + query;
		}
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("articleUrl", articleUrl);
		
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		model.addAttribute("sido_name", sido_name);
		model.addAttribute("sigungoo_name", sigungoo_name);
		
		
		return ".echartsMap.main";
	}

	
	@GetMapping("article")
	public String article(
			@RequestParam long mountain_num,
			@RequestParam(defaultValue = "mountain_name") String schType,
			@RequestParam(defaultValue = "") String kwd,
			Model model
			) throws Exception {
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		
		String query = "";
		
		if (kwd.length() != 0) {
			query += "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		EchartMap dto = service.findById(mountain_num);
		if (dto == null) {
			return "redirect:/echartsMap/main?" + query;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("query", query);
		
		return ".echartsMap.article";
	}
	
}
