package com.lan.tour.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lan.tour.model.dao.LantourDao;
import com.lan.tour.model.dto.LantourDto;
@Service
public class LantourBizImpl implements LantourBiz {
	
	@Autowired
	private LantourDao dao;

	@Override
	public List<LantourDto> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}

	@Override
	public LantourDto selectOne(int lantour_no) {
		// TODO Auto-generated method stub
		return dao.selectOne(lantour_no);
	}

	@Override
	public int insert(LantourDto dto) {
		// TODO Auto-generated method stub
		return dao.insert(dto);
	}

	@Override
	public int delete(int lantour_no) {
		// TODO Auto-generated method stub
		return dao.delete(lantour_no);
	}

}
