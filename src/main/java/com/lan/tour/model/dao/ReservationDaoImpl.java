package com.lan.tour.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("hotel_no", no);
			map.put("room_no", rno);
			try {
				int lantour_no = no;
				list = sqlSession.selectList(NAMESPACE+"selectList_room", map);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
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
		if(dto.getRoom_no()==0) {
			try {
				res = sqlSession.insert(NAMESPACE+"insert_lantour", dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else {
			try {
				res = sqlSession.insert(NAMESPACE+"insert_room", dto);
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}
		return res;
	}

	@Override
	public List<ReservationDto> selectList(int member_no) {
		List<ReservationDto> list = new ArrayList<ReservationDto>();

		try {
			list = sqlSession.selectList(NAMESPACE+"selectlist_MemberNo", member_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int updatepay(ReservationDto dto) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE+"update_pay", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public ReservationDto selectOne(int reservaition_no) {
		
		ReservationDto res = null;
		try {
			res = sqlSession.selectOne(NAMESPACE+"selectOne_Res", reservaition_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return res;
	}
}
