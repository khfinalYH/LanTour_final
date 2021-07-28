
package com.lan.tour.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lan.tour.model.biz.CommunityBiz;
import com.lan.tour.model.biz.HotelBiz;
import com.lan.tour.model.biz.LantourBiz;
import com.lan.tour.model.biz.MemberBiz;
import com.lan.tour.model.biz.ReservationBiz;
import com.lan.tour.model.biz.ReviewBiz;
import com.lan.tour.model.biz.RoomBiz;
import com.lan.tour.model.dto.HotelDto;
import com.lan.tour.model.dto.LantourDto;
import com.lan.tour.model.dto.MemberDto;
import com.lan.tour.model.dto.ReservationDto;
import com.lan.tour.model.dto.ReviewDto;
import com.lan.tour.model.dto.RoomDto;

@Controller
public class MyPageController {

	
		@Autowired
		private MemberBiz biz;
		
		@Autowired
		private CommunityBiz communitybiz;
		
		@Autowired
		HotelBiz Hbiz;

		@Autowired
		RoomBiz Roobiz;
		
		@Autowired
		LantourBiz Lbiz;
		
		@Autowired
		ReservationBiz Resbiz;
		
		@Autowired
		ReviewBiz Revbiz;
		
		@Autowired
		private BCryptPasswordEncoder pwEncoder;
	
		//������ Ȯ��
		@RequestMapping("/mypage.do")
		public String mypage() {
			return "mypage";
		}
		
		@RequestMapping("/mypageupdate.do")
		public String mypageupdate(Model model) {
			
			return "mypageupdate";
		}
		
		@RequestMapping("/mypageupdateres.do")
		public String updateres(MemberDto dto, HttpSession session ) {
			
			if (biz.update(dto) > 0) {
				MemberDto memberdto = (MemberDto)session.getAttribute("login");
				memberdto.setMember_name(dto.getMember_name());
				memberdto.setMember_password(pwEncoder.encode(dto.getMember_password()));
				
				memberdto.setMember_phone(dto.getMember_phone());
				memberdto.setMember_email(dto.getMember_email());
				
				
				return "redirect:mypage.do?member_no=" + dto.getMember_no();
			}
			return "redirect:mypageupdate.do?member_no=" + dto.getMember_no();
		}
		
		

		@RequestMapping("/mypayment.do")
		public String reservationlist(Model model, HttpSession session) {
			MemberDto dto = (MemberDto)session.getAttribute("login");
			List<ReservationDto> Rlist = Resbiz.selectListJoin(dto.getMember_no());
			model.addAttribute("list", Rlist);
			return "mypage_reservation";
		}
		
		@RequestMapping("/mypagehost.do")
		public String reservationlistHost(HttpSession session, Model model) {
			MemberDto dto = (MemberDto)session.getAttribute("login");
			List<HotelDto> Hlist = Hbiz.selectList(dto.getMember_no());
			Map<Integer,List<RoomDto>> RooMap = new HashMap<Integer, List<RoomDto>>();
			Map<String, ReviewDto> RevMap = new HashMap<String,ReviewDto>();
			Map<String, ReservationDto> ResMap = new HashMap<String,ReservationDto>();
			Hlist.forEach(Hdto->{
				List<RoomDto> Rlist =  Roobiz.selectList(Hdto.getHotel_no());
				RooMap.put(Hdto.getHotel_no(), Rlist);
				RevMap.put("H"+Hdto.getHotel_no(), Revbiz.selectscore("Hotel", Hdto.getHotel_no()));
				Rlist.forEach(Rdto->{
					ResMap.put("R"+Rdto.getRoom_no(), Resbiz.selectcount("room", Rdto.getRoom_no()));
					
				});
			});
			List<LantourDto> Llist = Lbiz.selectList(dto.getMember_no());
			Llist.forEach(Ldto->{
				RevMap.put("L"+Ldto.getLantour_no(),Revbiz.selectscore("lantour", Ldto.getLantour_no()));
				ResMap.put("L"+Ldto.getLantour_no(), Resbiz.selectcount("lantour", Ldto.getLantour_no()));

			});
			model.addAttribute("Hlist", Hlist);
			model.addAttribute("RooMap", RooMap);
			model.addAttribute("Llist", Llist);
			model.addAttribute("RevMap", RevMap);
			model.addAttribute("ResMap", ResMap);
			
			
			return "mypage_host";
		}
		

		@RequestMapping("/mypage_hostreservation.do")
		public String reservationlistRoom(Model model, int no, int rno) {
			List<ReservationDto> list = new ArrayList<ReservationDto>();
			if(rno!=0) {
				 list =(List<ReservationDto>)Resbiz.selectList("hotel", no, rno);
			}else {
				list=(List<ReservationDto>)Resbiz.selectList("lantour", no, 0);
			}
			Map<Integer, MemberDto> map = new HashMap<Integer, MemberDto>();
			list.forEach(dto->{
				if(!map.containsKey(dto.getMember_no())) {
					map.put(dto.getMember_no(),biz.selectOne(dto.getMember_no()));					
				}
			});
			model.addAttribute("map", map);
			model.addAttribute("list", list);
			return "mypage_hostreservation";
		}
		
		@RequestMapping("/mypost.do")
		public String mypost(Model model,HttpSession session) {
			MemberDto dto = (MemberDto)session.getAttribute("login"); 

			model.addAttribute("list", communitybiz.mypostList(dto.getMember_no()));
			
			return "mypost";
		}
		
}
