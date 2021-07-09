package com.lan.tour.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.lan.tour.model.dto.ReviewDto;


public interface ReviewDao {

	String NAMESPACE = "review.";
	
	public List<ReviewDto> selectList(String type, int no);
	public ReviewDto selectOne(String type, int review_no);
	public int insert(ReviewDto dto);
	public int delete(int number);
	public int update(ReviewDto dto);
	public List<ReviewDto> scoreList(String type);
}
