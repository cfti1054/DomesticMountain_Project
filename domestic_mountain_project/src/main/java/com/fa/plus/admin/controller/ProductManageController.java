package com.fa.plus.admin.controller;


import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.admin.domain.ProductManage;
import com.fa.plus.admin.domain.ProductStockManage;
import com.fa.plus.admin.service.ProductManageService;
import com.fa.plus.common.MyUtil;


@Controller
@RequestMapping("/admin/product/*")
public class ProductManageController {
	@Autowired
	private ProductManageService service;
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
	
	@RequestMapping("product_list")
	public String list(
			@RequestParam(defaultValue = "0") long parent_num,
			@RequestParam(defaultValue = "0") long category_num,
			@RequestParam(defaultValue = "1") int product_status,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(value = "size", defaultValue = "10") int size,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		String cp = req.getContextPath();
		
		int total_page = 0;
		int dataCount = 0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		List<ProductManage> listCategory = service.listCategory(); 
		List<ProductManage> listSubCategory = null;
		if(parent_num == 0 && listCategory.size() !=0) {
			parent_num = listCategory.get(0).getCategory_num();
		}
		listSubCategory = service.listSubCategory(parent_num);
		if(category_num == 0 && listSubCategory.size() != 0) {
			category_num = listSubCategory.get(0).getCategory_num();
		}		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("parent_num", parent_num);
		map.put("category_num", category_num);
		map.put("product_status", product_status);
					
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);

		List<ProductManage> list = service.listProduct(map);

		String listUrl = cp + "/admin/product/product_list";
		String articleUrl = cp + "/admin/product/article?page=" + current_page;
		
		String query = "parent_num=" + parent_num + "&category_num="+category_num;
		if(product_status != -1) {
			query += "&product_status="+product_status;
		}
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}		
		listUrl += "?" + query;
		articleUrl += "&" + query;
		
		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);

		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listSubCategory", listSubCategory);
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		
		model.addAttribute("product_status", product_status);
		model.addAttribute("parent_num", parent_num);
		model.addAttribute("category_num", category_num);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);

		model.addAttribute("articleUrl", articleUrl);
		
		model.addAttribute("page", current_page);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		
		return ".admin.product.product_list";
	}
	
	@GetMapping("listSubCategory")
	@ResponseBody
	public Map<String, Object> listSubCategory(
			@RequestParam long parent_num) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<ProductManage> listSubCategory = service.listSubCategory(parent_num);
		
		model.put("listSubCategory", listSubCategory);
		
		return model;
	}	
	
	@PostMapping("deleteOptionDetail")
	@ResponseBody
	public Map<String, Object> deleteOptionDetail(@RequestParam long detail_num) throws Exception {
		
		String state = "true";
		try {
			service.deleteOptionDetail(detail_num);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}	
	
	@GetMapping("write")
	public String writeForm(Model model) {
		List<ProductManage> listCategory = service.listCategory();
		List<ProductManage> listSubCategory = null;
		long parent_num = 0;
		if(listCategory.size() !=0) {
			parent_num = listCategory.get(0).getCategory_num();
		}
		listSubCategory = service.listSubCategory(parent_num);
		
		model.addAttribute("mode", "write");
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listSubCategory", listSubCategory);
		
		return ".admin.product.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(ProductManage dto,
			HttpSession session,
			Model model) {
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "product";
		
		try {
			service.insertProduct(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String url = "redirect:/admin/product/product_list?parent_num=" + dto.getParent_num()
						+ "&category_num=" + dto.getCategory_num();

		return url;
	}
	
	@GetMapping("update")
	public String updateForm(
			@RequestParam(defaultValue = "0") long parent_num,
			@RequestParam(defaultValue = "0") long category_num,
			@RequestParam long product_num,
			@RequestParam String page,
			Model model) {
		
		ProductManage dto = service.findById(product_num);
		if(dto == null) {
			String query = "parent_num=" + parent_num + "&category_num=" + category_num + "&page=" + page;

			return "redirect:/admin/product/product_list?" + query;
		}

		// 카테고리
		List<ProductManage> listCategory = service.listCategory();
		List<ProductManage> listSubCategory = service.listSubCategory(parent_num);
		
		// 추가 이미지
		List<ProductManage> listFile = service.listProductFile(product_num);
		// 상위/하위 옵션명
		List<ProductManage> listOption = service.listProductOption(product_num);
		// 상위/하위 상세 옵션
		List<ProductManage> listOptionDetail = null;
		List<ProductManage> listOptionDetail2 = null;
		if(listOption.size() > 0) {
			dto.setOption_num(listOption.get(0).getOption_num());
			dto.setOption_name(listOption.get(0).getOption_name());
			listOptionDetail = service.listOptionDetail(listOption.get(0).getOption_num());
		}
		if(listOption.size() > 1) {
			dto.setOption_num2(listOption.get(1).getOption_num());
			dto.setOption_name2(listOption.get(1).getOption_name());
			listOptionDetail2 = service.listOptionDetail(listOption.get(1).getOption_num());
		}
		
		model.addAttribute("mode", "update");
		
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("listOptionDetail", listOptionDetail);
		model.addAttribute("listOptionDetail2", listOptionDetail2);
		
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("listSubCategory", listSubCategory);
		model.addAttribute("parent_num", parent_num);
		
		model.addAttribute("page", page);
		
		return ".admin.product.write";
	}	
	
	@PostMapping("update")
	public String updateSubmit(ProductManage dto,
			@RequestParam String page,
			HttpSession session,
			Model model) {
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "product";
		
		try {
			service.updateProduct(dto, path);
		} catch (Exception e) {
		}
		
		String query = "parent_num=" + dto.getParent_num() + "&category_num=" + dto.getCategory_num() + "&page=" + page;

		return "redirect:/admin/product/product_list?" + query;
	}	
	
	@PostMapping("deleteFile")
	@ResponseBody
	public Map<String, Object> deleteFile(@RequestParam long file_num, 
			@RequestParam String file_name,
			HttpSession session) throws Exception {

		String state = "true";
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "product" + File.separator + file_name;

			service.deleteProductFile(file_num, pathname);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}	
	
	@GetMapping("article")
	public String article(Model model) {
		
		return ".admin.product.article";
	}	
	
	
	@GetMapping("stock")
	public String stockForm(@RequestParam long product_num,
			Model model) throws Exception {

		List<ProductStockManage> listProductStock = service.listProductStock(product_num);
		
		listProductStock = service.listProductStock(product_num);
		
		Map<String, Object> map = new HashMap<String, Object>();
		int dataCount = 0;
		dataCount = service.dataCount(map);
		
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("mode", "stock");
		model.addAttribute("listProductStock", listProductStock);
		
		
		return ".admin.product.stock";
	}
	
}
