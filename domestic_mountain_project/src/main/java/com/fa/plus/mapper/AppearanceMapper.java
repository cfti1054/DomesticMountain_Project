package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Appearance;


@Mapper
public interface AppearanceMapper {
	public long post_file_seq();
	public long post_seq();
	
	public void insertAppearance(Appearance dto) throws SQLException;
	
	List<Appearance> listAppearance(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public Appearance findById(long file_num);
	public void updateHitCount(long file_num) throws SQLException;
	public Appearance findByPrev(Map<String, Object> map);
	public Appearance findByNext(Map<String, Object> map);
	
}
