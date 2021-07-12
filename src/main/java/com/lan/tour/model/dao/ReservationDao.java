package com.lan.tour.model.dao;

import java.util.List;

import com.lan.tour.model.dto.ReservationDto;

public interface ReservationDao {

	String NAMESPACE = "reservation.";
	
	public List<ReservationDto> selectList();
	public List<ReservationDto> selectList(String type, int no, int rno);
	public ReservationDto selectOne(ReservationDto dto);
	public List<ReservationDto> countDate(String date, int no);
}
