package com.lan.tour.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lan.tour.model.biz.MemberBiz;
import com.lan.tour.model.biz.ReviewBiz;
import com.lan.tour.model.dto.ReviewDto;
import com.lan.tour.model.dto.MemberDto;


@Controller
public class ReviewController {

	@Autowired
	ReviewBiz biz;
	@Autowired
	MemberBiz Mbiz;

	@RequestMapping("hotelreviewlist.do")
	public String reviewList(Model model,int hotel_no) {
		List<ReviewDto> list = null;
		Map<String,String> map = new HashMap<String, String>();
		list = biz.selectList("hotel", hotel_no);
		for(ReviewDto dto :list) {
			int num = dto.getMember_no();
			MemberDto Mdto = Mbiz.selectOne(num);
			Mdto.getMember_name();
			map.put(""+num, Mdto.getMember_name());
		}
		
		model.addAttribute("map", map);
		model.addAttribute("list", list);
		model.addAttribute("hotel_no", hotel_no);
		return "review/review_list";
	}
	
	@RequestMapping("hotelReviewInsert.do")
	public String hotelReviewInsert(HttpSession session, int hotel_no, String review_title, int review_score) {
		MemberDto Mdto = (MemberDto) session.getAttribute("login");
		
		ReviewDto dto = new ReviewDto(0, hotel_no, 0, Mdto.getMember_no(), null, review_title, review_score);
		
		if (biz.insert(dto)>0) {
			return "redirect:hotelreviewlist.do?hotel_no="+hotel_no;
		}
		return "review/test";
	}

	@RequestMapping("hotelReviewUpdate.do")
	public String hotelReviewUpdate(Model model, int review_no) {	
		Map<String,String> map = new HashMap<String, String>();
		ReviewDto Rdto = biz.selectOne("hotel", review_no);
		model.addAttribute("Rdto", Rdto);
		return "review/review_update";
	}
	

	@RequestMapping("hotelReviewUpdateRes.do")
	public String hotelReviewUpdateRes(int review_no,int hotel_no, String review_title, int review_score) {		
		ReviewDto dto = new ReviewDto(review_no, 0, 0, 0, null, review_title, review_score);
		if (biz.update(dto)>0) {
			return "redirect:hotelreviewlist.do?hotel_no="+hotel_no;
		}
		return "review/test";
	}

	@RequestMapping("hotelReviewDelete.do")
	public String hotelReviewDelete(int review_no) {		
		ReviewDto dto = biz.selectOne("hotel", review_no);
		if (biz.delete(review_no)>0) {
			return "redirect:hotelreviewlist.do?hotel_no="+dto.gethotel_no();
		}
		return "review/test";
	}
	
}
