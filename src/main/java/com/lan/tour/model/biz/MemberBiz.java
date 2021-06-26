package com.lan.tour.model.biz;

import java.util.List;

import com.lan.tour.model.dto.MemberDto;

public interface MemberBiz {


	public List<MemberDto> selectList();
	public MemberDto selectOne(int member_no);
	public MemberDto idCheck(String member_id);
	public int update(MemberDto dto);
	public int delete(int member_no);
	public int insert(MemberDto dto);
	
	
}
