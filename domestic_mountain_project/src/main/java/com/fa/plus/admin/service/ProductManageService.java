package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.ProductManage;

public interface ProductManageService {
	public List<ProductManage> listProduct(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
}
