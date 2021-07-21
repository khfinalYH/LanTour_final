package com.lan.tour.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lan.tour.model.biz.HotelBiz;

@Controller
public class MainController {

	@Autowired
	private HotelBiz h_biz;

	@RequestMapping("/main.do")
	public String main(Model model) {
		model.addAttribute("h_list", h_biz.selectList());

		return "main";
	}
}
