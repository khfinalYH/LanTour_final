package com.lan.tour.model.biz;

import java.util.List;

import com.lan.tour.model.dto.MemberDto;

public interface MemberBiz {

	public List<MemberDto> selectList();

	public MemberDto selectOne(int member_no);
<<<<<<< HEAD
=======

	public MemberDto idCheck(MemberDto dto);

>>>>>>> e857c90a92ec46e50b0379898bd407c322de1b6c
	public int update(MemberDto dto);

	public int delete(int member_no);

	public int insert(MemberDto dto);
<<<<<<< HEAD
	public MemberDto idCheck(MemberDto dto);
=======

	public List<MemberDto> memberList();

	public int memberupdate(MemberDto dto);
>>>>>>> e857c90a92ec46e50b0379898bd407c322de1b6c
}
