package com.lan.tour.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lan.tour.model.dto.HotelDto;

@Repository
public class HotelDaoImpl implements HotelDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<HotelDto> selectList() {
		// TODO Auto-generated method stub
		List<HotelDto> res = null;
		try {
			res = sqlSession.selectList(NAMESPACE + "hotellist");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public HotelDto selectOne(int hotel_no) {
		// TODO Auto-generated method stub
		HotelDto dto = null;
		try {
			dto = sqlSession.selectOne(NAMESPACE + "hotelOne", hotel_no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insert(HotelDto dto) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "hotelinsert", dto);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int hotel_no) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			res = sqlSession.delete(NAMESPACE + "hoteldelete", hotel_no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int update(HotelDto dto) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "hotelupdate", dto);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

}
