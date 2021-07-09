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
	
	@RequestMapping("/noticeList_category.do")
	public String selectKeywordList(Model model, NoticePagingDto dto) {

		int count = 0;
		
		String category = dto.getCategory();
		String keyword = dto.getKeyword();
		int nowPage = dto.getNowPage();
		
		if (category == null || category.equals("")) {
			count = biz.countTotal();
			System.out.println(count);
			NoticePagingDto dtoN = new NoticePagingDto(count, nowPage);
			
			model.addAttribute("list", biz.selectList(dtoN));
			model.addAttribute("dto", dtoN);
		} else if (category.equals("n_t")) {
			count = biz.countT(keyword);
			NoticePagingDto dtoN = new NoticePagingDto(count, nowPage, keyword, category);
			
			model.addAttribute("list", biz.selectTitleList(dtoN));
			model.addAttribute("dto", dtoN);
			
		} else if (category.equals("n_c")) {
			count = biz.countC(keyword);
			NoticePagingDto dtoN = new NoticePagingDto(count, nowPage, keyword, category);
			
			model.addAttribute("list", biz.selectContentList(dtoN));
			model.addAttribute("dto", dtoN);
			
		} else if (category.equals("n_t_c")) {
			count = biz.countTC(keyword);
			NoticePagingDto dtoN = new NoticePagingDto(count, nowPage, keyword, category);
			
			model.addAttribute("list", biz.selectTCList(dtoN));
			model.addAttribute("dto", dtoN);
			
		}
		
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
