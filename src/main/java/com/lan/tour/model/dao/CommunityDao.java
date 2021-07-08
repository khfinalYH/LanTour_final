package com.lan.tour.model.dao;

import java.util.List;

import com.lan.tour.model.dto.CommunityDto;

public interface CommunityDao {

	String NAMESPACE = "community.";

	public List<CommunityDto> selectList();

	public CommunityDto selectOne(int community_no);

	public int insert(CommunityDto dto);

	public int update(CommunityDto dto);

	public int delete(int community_no);

}
