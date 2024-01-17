package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.ProductManage;
import com.fa.plus.admin.domain.ProductStockManage;

@Mapper
public interface ProductManageMapper {
	//상품 입력/리스트
	public List<ProductManage> listProduct(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public long productSeq();
	public void insertProduct(ProductManage dto) throws SQLException;
	public void insertProductFile(ProductManage dto) throws SQLException;
	
	//옵션 리스트
	public ProductManage findByCategory(long category_num);
	public List<ProductManage> listCategory();
	public List<ProductManage> listSubCategory(long parent_num);
	//
	public List<ProductManage> listManCategory(long parent_num);
	public List<ProductManage> listWomanCategory(long parent_num);
	
	//옵션
	public long optionSeq(); // 등산장비옵션
	public void insertProductOption(ProductManage dto) throws SQLException;

	public long detailSeq(); // 등산장비상세옵션
	public void insertOptionDetail(ProductManage dto) throws SQLException;
	
	// 장비 관리 세부 리스트
	public ProductManage findById(long product_num);
	public List<ProductManage> listProductFile(long product_num);
	public List<ProductManage> listProductOption(long product_num);
	public List<ProductManage> listOptionDetail(long option_num);
	
	// 상품 수정 및 삭제
	public void updateProduct(ProductManage dto) throws SQLException;
	public void deleteProduct(long product_num) throws SQLException;
	public void deleteProductFile(long file_num) throws SQLException;
	public void updateProductOption(ProductManage dto) throws SQLException;
	public void deleteProductOption(long option_num) throws SQLException;
	public void updateOptionDetail(ProductManage dto) throws SQLException;
	public void deleteOptionDetail(long detail_num) throws SQLException;
	
	// 상품 재고
	public List<ProductStockManage> listProductStock(long product_num);
	public void insertProductStock(ProductStockManage dto) throws SQLException;
	public void updateProductStock(ProductStockManage dto) throws SQLException;
	
}
