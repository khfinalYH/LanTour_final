package com.lan.tour.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lan.tour.model.biz.MemberBiz;
import com.lan.tour.model.dto.MemberDto;

@Controller
public class MemberController {

	@Autowired
	private MemberBiz biz;

	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	// ---------------------------------------------
	// 로그인------------------------------------------
	@RequestMapping("/loginform.do")
	public String loginForm() {
		return "login";
	}

	@ResponseBody
	@RequestMapping(value = "/loginCheck.do", method = RequestMethod.POST)
	public Map<String, Boolean> loginCheck(@RequestBody MemberDto dto, HttpSession session) {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		MemberDto res = biz.idCheck(dto);
		boolean check = false;
		System.out.println(res);
		if (res != null) {
			if (pwEncoder.matches(dto.getMember_password(), res.getMember_password())) {
				session.setAttribute("login", res);
				check = true;
			}
		}
		map.put("check", check);
		return map;
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:main.do";
	}
	// ---------------------------------------------
	// 회원가입------------------------------------------
	// singup.do -> registerform.do 로 변경(회원가입 페이지로 가는것이 없음)
	@RequestMapping("/registselect.do")
	public String singup() {
		return "registselect";
	}
	
	@RequestMapping("/registerform.do")
	public String signupform() {
		// 회원 가입 페이지로 이동 (페이지 이름을 몰라서 register로 작성)
		return "singnup_general";
	}
	
	
	@RequestMapping("/registerhost.do")
	public String registerForm() {
		return "signup_host";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	public Map<String, Boolean> idCheck(@RequestBody MemberDto dto) {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		MemberDto res = biz.idCheck(dto);
		boolean check = false;

		System.out.println("----------------res 출력");
		System.out.println(res);

		if (res != null) {
			check = true;
		}

		map.put("check", check);

		System.out.println(map);
		return map;
	}

	@RequestMapping("/registerres.do")
	public String registerRes(MemberDto dto) {
		System.out.println(dto);

		System.out.println("암호화 전 : " + dto.getMember_password());
		dto.setMember_password(pwEncoder.encode(dto.getMember_password()));
		System.out.println("암호화 후 : " + dto.getMember_password());
		if (biz.insert(dto) > 0) {
			return "redirect:loginform.do";
		}
		return "redirect:registerform.do";
	}	

	
}