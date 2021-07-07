package com.lan.tour.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lan.tour.model.dto.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<NoticeDto> selectList() {
		List<NoticeDto> list = new ArrayList<NoticeDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "notice_selectlist");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public NoticeDto selectOne(int notice_no) {
		NoticeDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "notice_selectOne", notice_no);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public int insert(NoticeDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "notice_insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(NoticeDto dto) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "notice_update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int notice_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "notice_delete", notice_no);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}
	
}
