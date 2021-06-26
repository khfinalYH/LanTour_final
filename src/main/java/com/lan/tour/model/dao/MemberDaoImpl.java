package com.lan.tour.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lan.tour.model.dto.MemberDto;


@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<MemberDto> selectList() {
		List<MemberDto> res = new ArrayList<MemberDto>();
		try {
			res = sqlSession.selectList(NAMESPACE+"selectList");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}


	@Override
	public MemberDto selectOne(int member_no) {
		
		MemberDto res = null;
		try {
			res = sqlSession.selectOne(NAMESPACE+"selectOne", member_no);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(MemberDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE+"update", dto);
		}catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(int member_no) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE+"delete", member_no);
		}catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int insert(MemberDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		}catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public MemberDto idCheck(String member_id) {
		MemberDto dto = null;
		try {
			dto = sqlSession.selectOne(NAMESPACE+"idCheck", member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		System.out.println("--------------dao");
		System.out.println(dto);
		return dto;
	}

}
