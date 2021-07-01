package com.lan.tour.model.dao;

import java.util.List;

import com.lan.tour.model.dto.LantourDto;

public interface LantourDao {

	String NAMESPACE = "lantour.";
	
	public List<LantourDto> selectList();
	public LantourDto selectOne(int lantour_no);
	public int insert(LantourDto dto);
	public int delete(int lantour_no);
	public int update(LantourDto dto);
}
