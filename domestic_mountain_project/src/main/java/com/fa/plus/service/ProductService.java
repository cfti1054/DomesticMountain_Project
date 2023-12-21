package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.Product;

public interface ProductService {
	public int dataCount(Map<String, Object> map);
	public List<Product> listProduct(Map<String, Object> map);
	
	public Product findById(long product_num);
	public List<Product> listProductFile(long product_num);
	
	public List<Product> listAllCategory();
	public List<Product> listCategory();
	public List<Product> listSubCategory(long parent_num);
	
	public List<Product> listProductOption(long product_num);
	public List<Product> listOptionDetail(long option_num);
}
