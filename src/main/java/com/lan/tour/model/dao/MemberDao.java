package com.lan.tour.model.dao;

import java.util.List;

import com.lan.tour.model.dto.MemberDto;


public interface MemberDao {

	String NAMESPACE = "member.";
	
	public List<MemberDto> selectList();

	public MemberDto selectOne(int member_no);
	public int update(MemberDto dto);
	public int delete(int member_no);
	public int insert(MemberDto dto);
	public MemberDto idCheck(MemberDto dto);
	
	
	
}