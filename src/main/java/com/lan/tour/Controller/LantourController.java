package com.lan.tour.Controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lan.tour.model.biz.LantourBiz;
import com.lan.tour.model.dto.LantourDto;


@Controller
public class LantourController {

	@Autowired
	private LantourBiz biz;
	
	@RequestMapping("/lantourlist.do")
	public String lantourlist(Model model) {
		model.addAttribute("list", biz.selectList());
		return "lantour";
	}
	
	@RequestMapping("/lantourinsert.do")
	public String lantourinsert() {
		return "lantourinsert";
		
	}
	
	@RequestMapping("/lantourdetail")
	public String lantourdetail(Model model, int lantour_no) {
		
		model.addAttribute("dto", biz.selectOne(lantour_no));
		
		return "lantourdetail";
	}
	
	@RequestMapping("/lantourinsertres.do")
	public String lantourinsertres(LantourDto dto) {
		System.out.println(dto);
		
		if (biz.insert(dto) > 0) {
			return "redirect:lantourlist.do";
		}
		return "redirect:lantourinsert.do";
		
	}
	
	@RequestMapping("/lantourdelete.do")
	public String lantourdelete(int lantour_no) {
		
		if(biz.delete(lantour_no) > 0) {
			return "redirect:lantourlist.do";
		}
		
		return "redirect:lantourdetail";
		
	}
	
	
}
