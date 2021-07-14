package com.lan.tour.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lan.tour.model.dto.ReservationDto;

@Repository
public class ReservationDaoImpl implements ReservationDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ReservationDto> selectList() {
		List<ReservationDto> list = new ArrayList<ReservationDto>();
		try {
			list = sqlSession.selectList(NAMESPACE+"selectlist");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public ReservationDto selectOne(ReservationDto dto) {
		
		ReservationDto res = null;
		try {
			res = sqlSession.selectOne(NAMESPACE+"selectOne", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return res;
	}

	@Override
	public List<ReservationDto> selectList(String type, int no, int rno) {
		List<ReservationDto> list = new ArrayList<ReservationDto>();
		if(type.equals("hotel")) {
			
		}else {
			try {
				int lantour_no = no;
				list = sqlSession.selectList(NAMESPACE+"selectList_lantour", lantour_no);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public List<ReservationDto> countDate(String date, int no) {
		List<ReservationDto> list = new ArrayList<ReservationDto>();
		ReservationDto dto = new ReservationDto();
		dto.setReservation_date(date);
		dto.setLantour_no(no);
		try {
			list = sqlSession.selectList(NAMESPACE+"countDate", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int insert(ReservationDto dto) {
		int res = 0;
		if(dto.getHotel_no()==0) {
			try {
				res = sqlSession.insert(NAMESPACE+"insert_lantour", dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return res;
	}
}
