package com.lan.tour.Controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lan.tour.model.biz.HotelBiz;
import com.lan.tour.model.biz.LantourBiz;
import com.lan.tour.model.biz.MemberBiz;
import com.lan.tour.model.biz.ReservationBiz;
import com.lan.tour.model.biz.RoomBiz;

@Controller
public class ReservationController {

	@Autowired
	MemberBiz Mbiz;
	
	@Autowired
	HotelBiz Hbiz;

	@Autowired
	RoomBiz Roobiz;
	
	@Autowired
	LantourBiz Lbiz;
	
	@Autowired
	ReservationBiz Resbiz;
	
	
	@RequestMapping("reservation.do")
	public String reservation(Model model, String type, int no, int rno) {
		if(type.equals("lantour")) {
			model.addAttribute("lantourDto", Lbiz.selectOne(no));
			
			
			
		}else {
			
		}
		return "reservationform";
	}
	
	
}
