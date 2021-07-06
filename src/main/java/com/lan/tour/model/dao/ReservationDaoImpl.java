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
		// TODO Auto-generated method stub
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
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return res;
	}
}
