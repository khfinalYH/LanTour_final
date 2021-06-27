package com.lan.tour.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lan.tour.model.biz.HotelBiz;
import com.lan.tour.model.dto.HotelDto;

@Controller
public class HotelController {

	@Autowired
	private HotelBiz biz;

	@RequestMapping("/hotellist.do")
	public String hotellist(Model model) {
		model.addAttribute("list", biz.selectList());
		return "hotel";
	}

	@RequestMapping("/hotelinsert.do")
	public String hotelinsert() {
		return "hotelinsert";
	}
	
	@RequestMapping("/insertres.do")
	public String hotelinsertres(HotelDto dto) {
		System.out.println(dto);
		
		if(biz.insert(dto) > 0) {
			return "redirect:hotellist.do";
		}
		return "redirect:hotelinsert.do";
	}
}
