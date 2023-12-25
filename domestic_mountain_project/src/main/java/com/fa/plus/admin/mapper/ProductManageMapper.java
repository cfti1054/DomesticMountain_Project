package com.fa.plus.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.ProductManage;

@Mapper
public interface ProductManageMapper {
	public List<ProductManage> listProduct(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
}
