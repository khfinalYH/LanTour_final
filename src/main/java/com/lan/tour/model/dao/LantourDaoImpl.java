package com.lan.tour.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lan.tour.model.dto.LantourDto;
@Repository
public class LantourDaoImpl implements LantourDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<LantourDto> selectList() {
		
		List<LantourDto> res = null;
		try {
			res = sqlSession.selectList(NAMESPACE+"lantourlist");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
	}

	@Override
	public LantourDto selectOne(int lantour_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(LantourDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int lantour_no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
