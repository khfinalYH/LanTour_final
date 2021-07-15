package com.lan.tour.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lan.tour.model.biz.CommentBiz;
import com.lan.tour.model.biz.CommunityBiz;
import com.lan.tour.model.biz.MemberBiz;
import com.lan.tour.model.dto.MemberDto;

@Controller
public class AdminController {

	@Autowired
	private MemberBiz mem_biz;

	@Autowired
	private CommunityBiz com_biz;

	@Autowired
	private CommentBiz comment_biz;

	// 관리자 페이지로 이동
	@RequestMapping("/adminmember.do")
	public String adminmember(Model model) {
		model.addAttribute("m_list", mem_biz.selectList());

		return "adminmember";
	}

	@RequestMapping("/adminmemberupdate.do")
	public String update(MemberDto dto) {
		System.out.println(dto.getMember_grade());

		mem_biz.memberupdate(dto);
		return "redirect:adminpage.do";

	}

	@RequestMapping("/admincommunity.do")
	public String admincommunity(Model model) {
		model.addAttribute("c_list", com_biz.selectList());

		return "admincommunity";
	}

	@RequestMapping("/admincommunityAlldelete.do")
	public String admincommunityAlldelete(int community_no) {
		if (com_biz.communityAlldelete(community_no) > 0) {
			if (comment_biz.deleteAll(community_no) > 0) {
				return "redirect:admincommunity.do";
			}
		}
		return "redirect:main.do";
	}

	@RequestMapping("/admincommunity_refaire.do")
	public String admincommunity_refaire(int community_no) {
		if (com_biz.community_refaire(community_no) > 0) {
			return "redirect:admincommunity.do";
		}
		return "redirect:main.do";
	}
}
