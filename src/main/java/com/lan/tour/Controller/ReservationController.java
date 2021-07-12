package com.lan.tour.Controller;


import java.util.HashMap;
import java.util.Map;

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
import com.lan.tour.model.dto.LantourDto;
import com.lan.tour.model.dto.ReservationDto;

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
			Map<String, Integer> map = new HashMap<String, Integer>();
			LantourDto Ldto = Lbiz.selectOne(no);
			if(Ldto.getLantour_date().indexOf(',')>0){
				for(int i = 0; i < Ldto.getLantour_date().split(",").length ; i++){
					map.put(Ldto.getLantour_date().split(",")[i], Resbiz.countDate(Ldto.getLantour_date().split(",")[i], no).size());
				}
			}
			model.addAttribute("map", map);
			model.addAttribute("lantourDto", Ldto);
			model.addAttribute("ResDto", Resbiz.selectList(type, no, 0));
		}else {
			model.addAttribute("HotelDto", Hbiz.selectOne(no));
			model.addAttribute("RoomDto", Roobiz.selectOne(rno));
		}
		return "reservation_insert";
	}
	@RequestMapping("insertReservation.do")
	public String InertReservation(int no, int rno, int member_no, String reservation_date, int reservation_price ) {
		
		ReservationDto dto = new ReservationDto(0, no, rno, rno, member_no, reservation_date, reservation_price, "N", null); 
		Resbiz.insert(dto);
		
		return "redirect:lantourdetail.do?lantour_no=" + no;
	}
	
}
