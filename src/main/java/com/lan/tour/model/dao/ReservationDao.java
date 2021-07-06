package com.lan.tour.model.dao;

import java.util.List;

import com.lan.tour.model.dto.ReservationDto;

public interface ReservationDao {

	String NAMESPACE = "reservation.";
	
	public List<ReservationDto> selectList(int reservation_no);
	public ReservationDto selectOne(int reservation_no);
}
