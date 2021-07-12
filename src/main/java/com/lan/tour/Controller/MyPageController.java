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
	
		//������ Ȯ��
		@RequestMapping("/mypage.do")
		public String mypage() {
			return "mypage";
		}
		//������ ����
		@RequestMapping("/mypageupdate.do")
		public String mypageupdate(Model model) {
			
			return "mypageupdate";
		}
		
		@RequestMapping("/mypageupdateres.do")
		public String updateres(MemberDto dto) {
			if (biz.update(dto) > 0) {
				return "redirect:mypage.do?member_no=" + dto.getMember_no();
			}

			return "redirect:mypageupdate.do?member_no=" + dto.getMember_no();
		}
		//���Խñ� Ȯ��
		@RequestMapping("/mypost.do")
		public String mypost() {
			return "mypost";
		} 
		//�� �������� Ȯ��
		@RequestMapping("/mypayment.do")
		public String mypayment() {
			return "mypayment";
		}
		//�� �����ȹ Ȯ��
		@RequestMapping("/mytrip.do")
		public String mytrip() {
			return "mytrip";
		}
		
		/* ǮĶ���� map���·� ��ȯ����� ajax ����� success�ȴ�.
		Map<String, FullCalendarDto> javaMap = new HashMap<String, FullCalendarDto();
		javaMap.put("evt1", new FullCalendarDTO("db�̺�Ʈ1", "2019-09-04", "2019-09-06", "false") );
		javaMap.put("evt2", new FullCalendarDTO("db�̺�Ʈ2", "2019-09-23", "2019-09-26", "false") );  
		*/
		
		
}
