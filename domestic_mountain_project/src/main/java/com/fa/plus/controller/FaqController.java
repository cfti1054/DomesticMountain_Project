package com.fa.plus.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.Faq;
import com.fa.plus.service.FaqService;


@Controller
@RequestMapping("/faq/*")
public class FaqController {
	@Autowired
	private FaqService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("list")
	public String main(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
	        @RequestParam(defaultValue = "all") String schType,
	        @RequestParam(defaultValue = "") String kwd,
	        @RequestParam(defaultValue = "0") int categoryNum,
	        HttpServletRequest req,
	        Model model) throws Exception {
	    Map<String, Object> map = new HashMap<>();

	    map.put("mode", "category_visible");
	    List<Faq> listCategory = service.listCategory(map);

	    model.addAttribute("listCategory", listCategory);
	    model.addAttribute("category_num", "0");
	    model.addAttribute("pageNo", current_page);

	    int size = 5;
	    int total_page = 0;
	    int dataCount = 0;

	    if (req.getMethod().equalsIgnoreCase("GET")) {
	        kwd = URLDecoder.decode(kwd, "utf-8");
	    }

	    map = new HashMap<String, Object>();
	    map.put("schType", schType);
	    map.put("kwd", kwd);
	    map.put("faq_category_num", categoryNum);

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
	    

	    List<Faq> list = service.listFaq(map);
	    for (Faq dto : list) {
	        dto.setFaq_content(myUtil.htmlSymbols(dto.getFaq_content()));
	    }

	    String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

	    model.addAttribute("list", list);
	    model.addAttribute("dataCount", dataCount);
	    model.addAttribute("size", size);
	    model.addAttribute("total_page", total_page);
	    model.addAttribute("paging", paging);

	    model.addAttribute("schType", schType);
	    model.addAttribute("kwd", kwd);
	    model.addAttribute("faq_category_num", categoryNum); 

	    return ".faq.list";
	}

}
