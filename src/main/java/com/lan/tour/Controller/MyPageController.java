package com.lan.tour.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lan.tour.model.biz.MemberBiz;
import com.lan.tour.model.dto.MemberDto;

@Controller
public class MyPageController {

	
		@Autowired
		private MemberBiz biz;
	
		//내정보 확인
		@RequestMapping("/mypage.do")
		public String mypage() {
			return "mypage";
		}
		//내정보 수정
		@RequestMapping("/mypageupdate.do")
		public String mypageupdate(Model model, int member_no) {
			model.addAttribute("dto", biz.selectOne(member_no));
			
			return "mypageupdate";
		}
		
		@RequestMapping("/mypageupdateres.do")
		public String updateres(MemberDto dto) {
			if (biz.update(dto) > 0) {
				return "redirect:mypage.do?member_no=" + dto.getMember_no();
			}

			return "redirect:mypageupdate.do?member_no=" + dto.getMember_no();
		}
		//내게시글 확인
		@RequestMapping("/mypost.do")
		public String mypost() {
			return "mypost";
		} 
		//내 결제내역 확인
		@RequestMapping("/mypayment.do")
		public String mypayment() {
			return "mypayment";
		}
		//내 여행계획 확인
		@RequestMapping("/mytrip.do")
		public String mytrip() {
			return "mytrip";
		}
		
		/* 풀캘린더 map형태로 변환해줘야 ajax 통신이 success된다.
		Map<String, FullCalendarDto> javaMap = new HashMap<String, FullCalendarDto();
		javaMap.put("evt1", new FullCalendarDTO("db이벤트1", "2019-09-04", "2019-09-06", "false") );
		javaMap.put("evt2", new FullCalendarDTO("db이벤트2", "2019-09-23", "2019-09-26", "false") );  
		*/
		
		
}
