package com.lan.tour.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lan.tour.model.dao.ReservationDao;
import com.lan.tour.model.dto.ReservationDto;

@Service
public class ReservationBizImpl implements ReservationBiz {
	
	@Autowired
	private ReservationDao dao;

	@Override
	public List<ReservationDto> selectList() {
		return dao.selectList();
	}

	@Override
	public ReservationDto selectOne(ReservationDto dto) {
		return dao.selectOne(dto);
	}

	@Override
	public List<ReservationDto> selectList(String type, int no, int rno) {
		return dao.selectList(type, no, rno);
	}

	@Override
	public List<ReservationDto> countDate(String date, int no) {
		return dao.countDate(date, no);
	}

	@Override
	public int insert(ReservationDto dto) {
		return dao.insert(dto);
	}

	@Override
	public List<ReservationDto> selectList(int m_no) {
		return dao.selectList(m_no);
	}

	@Override
	public int updatepay(ReservationDto dto) {
		return dao.updatepay(dto);
	}

	@Override
	public ReservationDto selectOne(int Reservation_no) {
		return dao.selectOne(Reservation_no);
	}

}
