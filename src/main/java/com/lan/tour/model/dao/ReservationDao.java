package com.lan.tour.model.dao;

import java.util.List;

import com.lan.tour.model.dto.ReservationDto;

public interface ReservationDao {

	String NAMESPACE = "reservation.";

	public List<ReservationDto> selectList();

	public List<ReservationDto> selectList(String type, int no, int rno);

	public ReservationDto selectOne(ReservationDto dto);

	public ReservationDto selectOne(int Reservaition_no);

	public List<ReservationDto> countDate(String date, int no);

	public int insert(ReservationDto dto);

	public List<ReservationDto> selectList(int m_no);

	public int updatepay(ReservationDto dto);

	public List<ReservationDto> selectListLanM(int member_no);

	public List<ReservationDto> selectListRoomM(int member_no);

	public List<ReservationDto> selectListCheckDate(String check_in, String check_out, String hotel_type);
	public List<ReservationDto> selectListJoin(int member_no);
	public ReservationDto selectcount(String type, int no);

	public List<ReservationDto> selectchart();

	public int deleteByMemberNo(int member_no);

}
