package com.lan.tour.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lan.tour.model.dao.ReviewDao;
import com.lan.tour.model.dto.ReviewDto;

@Service
public class ReviewBizImpl implements ReviewBiz {

	@Autowired
	ReviewDao dao;

	@Override
	public List<ReviewDto> selectList(String type, int no) {
		return dao.selectList(type,no);
	}

	@Override
	public ReviewDto selectOne(String type, int number) {
		return dao.selectOne(type, number);
	}

	@Override
	public int insert(ReviewDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int delete(int number) {
		// TODO Auto-generated method stub
		return dao.delete(number);
	}

	@Override
	public int update(ReviewDto dto) {
		// TODO Auto-generated method stub
		return dao.update(dto);
	}
	

}
