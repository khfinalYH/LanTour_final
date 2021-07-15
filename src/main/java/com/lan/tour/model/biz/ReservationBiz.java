package com.lan.tour.model.biz;

import java.util.List;

import com.lan.tour.model.dto.ReservationDto;

public interface ReservationBiz {

	public List<ReservationDto> selectList();
	public ReservationDto selectOne(ReservationDto dto);
	public ReservationDto selectOne(int Reservation_no);
	public List<ReservationDto> selectList(String type, int no, int rno);
	public List<ReservationDto> countDate(String date, int no);
	public int insert(ReservationDto dto);
	public List<ReservationDto> selectList(int m_no);
	public int updatepay(ReservationDto dto);
	public List<ReservationDto> selectListLanM(int member_no);
	public List<ReservationDto> selectListRoomM(int member_no);
}
