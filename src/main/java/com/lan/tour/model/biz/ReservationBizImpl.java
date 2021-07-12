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
		// TODO Auto-generated method stub
		return dao.selectList();
	}

	@Override
	public ReservationDto selectOne(ReservationDto dto) {
		return dao.selectOne(dto);
	}

	@Override
	public List<ReservationDto> selectList(String type, int no) {
		// TODO Auto-generated method stub
		return dao.selectList(type, no);
	}

}
