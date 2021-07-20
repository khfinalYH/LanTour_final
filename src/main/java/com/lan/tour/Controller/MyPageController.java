package com.lan.tour.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lan.tour.model.biz.MemberBiz;
import com.lan.tour.model.dto.MemberDto;

@Controller
public class MyPageController {

	
		@Autowired
		private MemberBiz biz;
		
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
		
		@RequestMapping("/mypost.do")
		public String mypost() {
			return "mypost";
		}
		
		@RequestMapping("/mypayment.do")
		public String mypayment() {
			return "mypayment";
		}

		
}
