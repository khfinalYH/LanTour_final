package com.lan.tour.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lan.tour.model.dao.HotelDao;
import com.lan.tour.model.dto.HotelDto;

@Service
public class HotelBizImpl implements HotelBiz {

	@Autowired
	private HotelDao dao;

	@Override
	public List<HotelDto> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}

	@Override
	public HotelDto selectOne(int hotel_no) {
		// TODO Auto-generated method stub
		return dao.selectOne(hotel_no);
	}

	@Override
	public int insert(HotelDto dto) {
		// TODO Auto-generated method stub
		return dao.insert(dto);
	}

	@Override
	public int delete(int hotel_no) {
		// TODO Auto-generated method stub
		return dao.delete(hotel_no);
	}

	@Override
	public int update(HotelDto dto) {
		// TODO Auto-generated method stub
		return dao.update(dto);
	}

}
