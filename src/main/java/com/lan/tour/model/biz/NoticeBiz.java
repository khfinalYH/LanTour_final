package com.lan.tour.model.biz;

import java.util.List;

import com.lan.tour.model.dto.NoticeDto;
import com.lan.tour.model.dto.NoticePagingDto;

public interface NoticeBiz {

	public List<NoticeDto> selectList(NoticePagingDto dto);
	public NoticeDto selectOne(int notice_no);
	public int insert(NoticeDto dto);
	public int update(NoticeDto dto);
	public int delete(int notice_no);
	public int countTotal();

}
