package com.lan.tour.model.biz;

import java.util.List;

import com.lan.tour.model.dto.LantourDto;

public interface LantourBiz {

	public List<LantourDto> selectList();
	public LantourDto selectOne(int lantour_no);
	public int insert(LantourDto dto);
	public int delete(int lantour_no);
	public int update (LantourDto dto);
	public int rtcupdate(LantourDto dto);
}
