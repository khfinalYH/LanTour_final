package com.lan.tour.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lan.tour.model.biz.CommunityBiz;
import com.lan.tour.model.biz.MemberBiz;
import com.lan.tour.model.biz.NoticeBiz;
import com.lan.tour.model.dto.MemberDto;

@Controller
public class AdminController {

	@Autowired
	private MemberBiz mem_biz;

	@Autowired
	private CommunityBiz com_biz;

	@Autowired
	private NoticeBiz not_biz;

	// 관리자 페이지로 이동
	@RequestMapping("/adminpage.do")
	public String adminpage(Model model) {
		model.addAttribute("m_list", mem_biz.selectList());
		model.addAttribute("c_list", com_biz.selectList());
		model.addAttribute("n_list", not_biz.noticelist());

		return "adminpage";
	}

	@RequestMapping("/memberupdate.do")
	public String update(MemberDto dto) {
		System.out.println(dto.getMember_grade());
		
		mem_biz.memberupdate(dto);
		return "redirect:adminpage.do";

	}
}
