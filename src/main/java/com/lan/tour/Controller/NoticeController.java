package com.lan.tour.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lan.tour.model.biz.NoticeBiz;
import com.lan.tour.model.dto.NoticeDto;
import com.lan.tour.model.dto.NoticePagingDto;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeBiz biz;
	
	@RequestMapping("/noticeList.do")
	public String selectList(Model model, int nowPage) {
		int count = biz.countTotal();
		
		NoticePagingDto dto = new NoticePagingDto(count, nowPage);
		
		model.addAttribute("list", biz.selectList(dto));
		model.addAttribute("dto", dto);
		
		return "notice_list";
	}
	
	@RequestMapping("/noticeInsertForm.do")
	public String insertForm() {
		return "notice_insert";
	}
	
	@RequestMapping("/noticeInsertRes.do")
	public String insertRes(NoticeDto dto) {
		
		if (biz.insert(dto) > 0) {
			return "redirect:noticeList.do?nowPage=" + 1;
		}
		
		return "redirect:noticeInsert.do";
	}
	
	@RequestMapping("/noticeSelectOne.do")
	public String selectOne(Model model, int notice_no) {
		
		model.addAttribute("dto", biz.selectOne(notice_no));
		
		return "notice_detail";
	}
	
	@RequestMapping("/noticeUpdateForm.do")
	public String updateForm(Model model, int notice_no) {
		
		model.addAttribute("dto", biz.selectOne(notice_no));
		
		return "notice_update";
	}
	
	@RequestMapping("/noticeUpdateRes.do")
	public String updateRes(NoticeDto dto) {
		
		if(biz.update(dto) > 0) {
			return "redirect:noticeSelectOne.do?notice_no="+dto.getNotice_no();
		}
		
		return "redirect:noticeUpdateForm.do?notice_no="+dto.getNotice_no();
	}
	
	@RequestMapping("/noticeDelete.do")
	public String delete(int notice_no) {
		
		if(biz.delete(notice_no) > 0) {
			return "redirect:noticeList.do?nowPage=" + 1;
		}
		
		return "redirect:noticeSelectOne.do?notice_no=" + notice_no;
	}

}
