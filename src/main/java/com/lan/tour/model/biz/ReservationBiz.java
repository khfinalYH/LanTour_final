package com.lan.tour.model.biz;

import java.util.List;

import com.lan.tour.model.dto.ReservationDto;

public interface ReservationBiz {

	public List<ReservationDto> selectList();
	public ReservationDto selectOne(int reservation_no);
	
}
