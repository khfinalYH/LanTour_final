package com.lan.tour.model.biz;

import java.util.List;

import com.lan.tour.model.dto.HotelDto;

public interface HotelBiz {

	public List<HotelDto> selectList();

	public HotelDto selectOne(int hotel_no);

	public int insert(HotelDto dto);

	public int delete(int hotel_no);

	public int update(HotelDto dto);
	
	public List<HotelDto> searchList(HotelDto dto);
}
