package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.fa.plus.domain.Ootd;

public interface OotdMapper {
	public void insertOotd(Ootd dto) throws SQLException;
	public void updateOotd(Ootd dto) throws SQLException;
	public void deleteOotd() throws SQLException;

	public int dataCount(Map<String, Object> map);
	public List<Ootd> listOotd(Map<String, Object> map);
	
	public Ootd findById();
	


}
