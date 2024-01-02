package com.fa.plus.admin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fa.plus.admin.domain.ProductManage;
import com.fa.plus.admin.domain.ProductStockManage;
import com.fa.plus.admin.mapper.ProductManageMapper;
import com.fa.plus.common.FileManager;

@Service 
public class ProductManageServiceImpl implements ProductManageService {
	@Autowired
	private ProductManageMapper mapper;
		
	@Autowired
	private FileManager fileManager;
	
	@Override
	public List<ProductManage> listProduct(Map<String, Object> map) {
		List<ProductManage> list = null;
		
		try {
			list = mapper.listProduct(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

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
	public ProductManage findByCategory(long category_num) {
		ProductManage dto = null;
		
		try {
			dto = mapper.findByCategory(category_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<ProductManage> listCategory() {
		List<ProductManage> list = null;
		
		try {
			list = mapper.listCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ProductManage> listSubCategory(long parent_num) {
		List<ProductManage> list = null;
		
		try {
			list = mapper.listSubCategory(parent_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void insertProduct(ProductManage dto, String pathname) throws Exception {
		try {
			// 썸네일 이미지
			String file_name = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			dto.setProduct_summary(file_name);
			
			// 상품 저장
			long product_num = mapper.productSeq();
			
			dto.setProduct_num(product_num);
			mapper.insertProduct(dto);	
			
			// 추가 이미지 저장
			if(! dto.getAddFiles().isEmpty()) {
				for(MultipartFile mf : dto.getAddFiles()) {
					file_name = fileManager.doFileUpload(mf, pathname);
					if(file_name == null) {
						continue;
					}
					dto.setFile_name(file_name);
					
					mapper.insertProductFile(dto);
				}
			}		
			
			// 상위 옵션 저장
			long option_num = mapper.optionSeq();
			dto.setOption_num(option_num);
			dto.setParent(null);
			mapper.insertProductOption(dto);	
			
			// 상위 옵션 값 저장
			long detail_num;
			dto.setDetail_nums(new ArrayList<Long>());
			for(String option_value : dto.getOption_values()) {
				detail_num = mapper.detailSeq(); 
				dto.setDetail_num(detail_num);
				dto.setOption_value(option_value);

				mapper.insertOptionDetail(dto);
				
				dto.getDetail_nums().add(detail_num);
			}		
			
			// 하위 옵션 저장
			long option_num2 = mapper.optionSeq();
			dto.setOption_num(option_num2);
			dto.setOption_name(dto.getOption_name2());
			dto.setParent(option_num);
			mapper.insertProductOption(dto);
			
			// 하위 옵션 값 저장
			dto.setDetail_nums2(new ArrayList<Long>());
			for(String option_value2 : dto.getOption_values2()) {
				detail_num = mapper.detailSeq(); 
				dto.setDetail_num(detail_num);
				dto.setOption_value(option_value2);
				mapper.insertOptionDetail(dto);
				
				dto.getDetail_nums2().add(detail_num);
			}		
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}			
	}

	@Override
	public void updateProduct(ProductManage dto, String pathname) throws Exception {
		try {
			// 썸네일 이미지
			String file_name = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			if(file_name != null) {
				// 이전 파일 지우기
				if (dto.getProduct_summary().length() != 0) {
					fileManager.doFileDelete(dto.getProduct_summary(), pathname);
				}
				
				dto.setProduct_summary(file_name);
			}
			
			mapper.updateProduct(dto);
			
			if(! dto.getAddFiles().isEmpty()) {
				for(MultipartFile mf : dto.getAddFiles()) {
					file_name = fileManager.doFileUpload(mf, pathname);
					if(file_name == null) {
						continue;
					}
					dto.setFile_name(file_name);
					
					mapper.insertProductFile(dto);
				}
			}	
			// 상위 옵션 수정
			mapper.updateProductOption(dto);
			
			// 기존 상위 옵션값 수정
			int size = dto.getDetail_nums().size();
			for(int i = 0; i < size; i++) {
				dto.setDetail_num(dto.getDetail_nums().get(i));
				dto.setOption_value(dto.getOption_values().get(i));
				mapper.updateOptionDetail(dto);
			}		
			
			// 새로운 상위 옵션값 추가
			long detail_num;
			dto.setDetail_nums(new ArrayList<Long>());
			for(int i = size; i < dto.getOption_values().size(); i++) {
				detail_num = mapper.detailSeq(); 
				dto.setDetail_num(detail_num);
				dto.setOption_value(dto.getOption_values().get(i));
				mapper.insertOptionDetail(dto);
				
				dto.getDetail_nums().add(detail_num);
			}			
			
			// 하위 옵션 수정
			dto.setOption_num(dto.getOption_num2());
			dto.setOption_name(dto.getOption_name2());
			mapper.updateProductOption(dto);
			
			// 기존 하위 옵션값 수정
			int size2 = dto.getDetail_nums2().size();
			for(int i = 0; i < size2; i++) {
				dto.setDetail_num(dto.getDetail_nums2().get(i));
				dto.setOption_value(dto.getOption_values2().get(i));
				mapper.updateOptionDetail(dto);
			}	
			
			// 새로운 하위 옵션값 추가
			dto.setDetail_nums2(new ArrayList<Long>());
			for(int i = size2; i < dto.getOption_values2().size(); i++) {
				detail_num = mapper.detailSeq(); 
				dto.setDetail_num(detail_num);
				dto.setOption_value(dto.getOption_values2().get(i));
				mapper.insertOptionDetail(dto);
				
				dto.getDetail_nums2().add(detail_num);
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteProduct(long product_num, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProductFile(long file_num, String pathname) throws Exception {
		try {
			if (pathname != null) {
				fileManager.doFileDelete(pathname);
			}

			mapper.deleteProductFile(file_num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteOptionDetail(long detail_num) throws Exception {
		try {
			mapper.deleteOptionDetail(detail_num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public ProductManage findById(long product_num) {
		ProductManage dto = null;
		
		try {
			dto = mapper.findById(product_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public ProductManage findByPrev(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductManage findByNext(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductManage> listProductFile(long product_num) {
		List<ProductManage> list = null;
		
		try {
			list = mapper.listProductFile(product_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ProductManage> listProductOption(long product_num) {
		List<ProductManage> list = null;
		
		try {
			list = mapper.listProductOption(product_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ProductManage> listOptionDetail(long option_num) {
		List<ProductManage> list = null;
		
		try {
			list = mapper.listOptionDetail(option_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ProductStockManage> listProductStock(long productNum) {
		List<ProductStockManage> list = null;
		
		try {
			list = mapper.listProductStock(productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void updateProductStock(ProductStockManage dto) throws Exception {
		try {
			mapper.updateProductStock(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	
}
