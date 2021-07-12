package com.lan.tour.model.biz;

import java.util.List;
import java.util.Map;

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
	public List<ReviewDto> selectList(String type, Map<String, Integer> map, String sort) {
		return dao.selectList(type, map, sort);
	}

	@Override
	public ReviewDto selectOne(String type, int review_no) {
		return dao.selectOne(type, review_no);
	}

	@Override
	public int insert(ReviewDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int delete(int number) {
		return dao.delete(number);
	}

	@Override
	public int update(ReviewDto dto) {
		return dao.update(dto);
	}

	@Override
	public List<ReviewDto> scoreList(String type) {
		return dao.scoreList(type);
	}

	

}