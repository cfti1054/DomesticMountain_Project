package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.ProductManage;
import com.fa.plus.admin.domain.ProductStockManage;

public interface ProductManageService {
	public void insertProduct(ProductManage dto, String pathname) throws Exception;
	public void updateProduct(ProductManage dto, String pathname) throws Exception;
	public void deleteProduct(long product_num, String pathname) throws Exception;
	public void deleteProductFile(long file_num, String pathname) throws Exception;
	public void deleteOptionDetail(long detail_num) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<ProductManage> listProduct(Map<String, Object> map);
	
	public ProductManage findById(long product_num);
	public ProductManage findByPrev(Map<String, Object> map);
	public ProductManage findByNext(Map<String, Object> map);
	
	public List<ProductManage> listProductFile(long product_num);
	public List<ProductManage> listProductOption(long product_num);
	public List<ProductManage> listOptionDetail(long option_num);
	
	// 상품 상위 카테고리 목록
	public ProductManage findByCategory(long category_num);
	public List<ProductManage> listCategory();
	public List<ProductManage> listSubCategory(long parent_num);
	
	// 상품 재고
	public List<ProductStockManage> listProductStock(long product_num);
	public void updateProductStock(ProductStockManage dto) throws Exception;
	
}
