package com.fa.plus.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.EchartMap;
import com.fa.plus.service.EchartMapService;

@Controller
@RequestMapping("/echartsMap/*")
public class EChartsMapController {
	@Autowired
	private EchartMapService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("main")
	public String main(Model model) throws Exception {	
		
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
	
	@GetMapping("search")
	@ResponseBody
	public Map<String, Object> search(
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType,
			
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(defaultValue = "") String sido_name,
			@RequestParam(defaultValue = "") String sigungoo_name
			) throws Exception {
		

        int size = 5;
        int total_page = 0;
		int dataCount = 0;
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kwd", kwd);
		map.put("sido_name", sido_name);
		map.put("sigungoo_name", sigungoo_name);
		
		dataCount = service.dataCount(map);
		if (dataCount != 0) {
	        total_page = myUtil.pageCount(dataCount, size);
	    }
		if (total_page < current_page) {
            current_page = total_page;
        }
		
		int offset = (current_page - 1) * size;
        if (offset < 0) offset = 0;

        map.put("offset", offset);
        map.put("size", size);
        
        
		
		List<EchartMap> list = service.listMountain(map);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		
		
		model.put("list", list);
		model.put("dataCount", dataCount);
		
		model.put("size", size);
		model.put("pageNo", current_page);
        model.put("schType", schType);
        model.put("kwd", kwd);
		
		return model;
	}
	
}
