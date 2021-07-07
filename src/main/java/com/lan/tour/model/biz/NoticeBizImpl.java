package com.lan.tour.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lan.tour.model.dao.NoticeDao;
import com.lan.tour.model.dto.NoticeDto;

@Service
public class NoticeBizImpl implements NoticeBiz {

	@Autowired
	private NoticeDao dao;

	@Override
	public List<NoticeDto> selectList() {

		return dao.selectList();
	}

	@Override
	public NoticeDto selectOne(int notice_no) {

		return dao.selectOne(notice_no);
	}

	@Override
	public int insert(NoticeDto dto) {

		return dao.insert(dto);
	}

	@Override
	public int update(NoticeDto dto) {

		return dao.update(dto);
	}

	@Override
	public int delete(int notice_no) {

		return dao.delete(notice_no);
	}
	
}
