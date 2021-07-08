package com.lan.tour.model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.Session;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lan.tour.model.dto.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ReviewDto> selectList(String type, int no) {		
		List<ReviewDto> list = new ArrayList<ReviewDto>();
		switch(type){
			case "hotel":
				try {
					int hotel_no = no;
					list = sqlSession.selectList(NAMESPACE+"select_hotel", hotel_no);

				}catch (Exception e) {
					e.printStackTrace();
				}
				break;
			case "lantour":
				try {
					int lantour_no = no;
					list = sqlSession.selectList(NAMESPACE+"select_lantour", lantour_no);
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
		return list;
	}

	@Override
	public ReviewDto selectOne(String type, int number) {	
		ReviewDto dto = null;
		switch(type){
			case "hotel":
				try {
					int hotel_no = number;
					dto = sqlSession.selectOne(NAMESPACE+"select_one_hotel", hotel_no);

				}catch (Exception e) {
					e.printStackTrace();
				}
				break;
			case "lantour":
				try {
					int lantour_no = number;
					dto = sqlSession.selectOne(NAMESPACE+"select_one_lantour", lantour_no);
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
		return dto;
	}

	@Override
	public int insert(ReviewDto dto) {
		int res = 0;
		if(dto.gethotel_no()!=0) {
			try {
				res = sqlSession.insert(NAMESPACE+"insert_hotel", dto);
			}catch (Exception e) {
				e.printStackTrace();
			}			
		}else {
			try {
				res = sqlSession.insert(NAMESPACE+"insert_lantour", dto);
			}catch (Exception e) {
				e.printStackTrace();
			}				
		}
		return res;
	}

	@Override
	public int delete(int number) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(ReviewDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE+"update_review", dto);
		}catch (Exception e) {
			e.printStackTrace();
		}		
		return res;
		
	}

	

}
