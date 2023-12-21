package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.Product;
import com.fa.plus.mapper.ProductMapper;


@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductMapper mapper;
	 
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Product> listProduct(Map<String, Object> map) {
		List<Product> list = null;
		
		try {
			list = mapper.listProduct(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Product findById(long product_num) {
		Product dto = null;
		
		try {
			dto = mapper.findById(product_num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Product> listProductFile(long productNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> listAllCategory() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> listCategory() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> listSubCategory(long parentNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> listProductOption(long product_num) {
		List<Product> list = null;
		
		try {
			list = mapper.listProductOption(product_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<Product> listOptionDetail(long option_num) {
		List<Product> list = null;
		
		try {
			list = mapper.listOptionDetail(option_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
}
