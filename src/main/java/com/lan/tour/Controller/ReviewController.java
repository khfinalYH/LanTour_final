package com.lan.tour.Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

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

	@RequestMapping("reviewlist.do")
	public String reviewList(Model model,String type,int no) {
		List<ReviewDto> list = null;
		Map<String,String> map = new HashMap<String, String>();
		list = biz.selectList(type, no);
		for(ReviewDto dto :list) {
			int num = dto.getMember_no();
			MemberDto Mdto = Mbiz.selectOne(num);
			Mdto.getMember_name();
			map.put(""+num, Mdto.getMember_name());
		}
		model.addAttribute("type", type);
		model.addAttribute("map", map);
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		return "review_list";
	}
		
	
	@RequestMapping("ReviewInsert.do")
	public String ReviewInsert(HttpSession session, String type, int no, String review_title, double review_score) {
		MemberDto Mdto = (MemberDto) session.getAttribute("login");
		ReviewDto Rdto = null;
		switch(type) {
			case "hotel":
				Rdto = new ReviewDto(0, no, 0, Mdto.getMember_no(), null, review_title, review_score);
				break;
			case "lantour":
				Rdto = new ReviewDto(0, 0, no, Mdto.getMember_no(), null, review_title, review_score);
				break;
		}
		
		if (biz.insert(Rdto)>0) {
			return "redirect:reviewlist.do?type="+type+"&no="+no;
		}
		return "test";
	}

	@RequestMapping("ReviewUpdate.do")
	public String ReviewUpdate(Model model,String type, int review_no) {	
		Map<String,String> map = new HashMap<String, String>();
		ReviewDto Rdto = biz.selectOne(type, review_no);
		model.addAttribute("type", type);
		model.addAttribute("Rdto", Rdto);
		return "review_update";
	}
	

	@RequestMapping("ReviewUpdateRes.do")
	public String ReviewUpdateRes(String type, int review_no, int no, String review_title, double review_score) {		
		ReviewDto dto = new ReviewDto(review_no, 0, 0, 0, null, review_title, review_score);
		if (biz.update(dto)>0) {
			return "redirect:reviewlist.do?type="+type+"&no="+no;
		}
		return "test";
	}

	@RequestMapping("ReviewDelete.do")
	public String ReviewDelete(String type, int review_no) {		
		ReviewDto dto = biz.selectOne(type, review_no);
		if (biz.delete(review_no)>0) {
			return "redirect:reviewlist.do?type="+type+"&no="+(dto.getHotel_no()==0?dto.getLantour_no():dto.getHotel_no());
		}
		return "test";
	}
	
	@ResponseBody
	@RequestMapping("reviewupload.do")
	public Map<String, String> fileupload(@RequestParam("file") MultipartFile file, HttpServletRequest request) {

		String name = file.getOriginalFilename();
		String path = "";

		String[] new_name = name.split("\\.");
		System.out.println(new_name[0]);
		String na = new_name[0];
		String renew_na = na;

		String full_na = renew_na + "." + new_name[1];
		InputStream inputStream = null;
		OutputStream outputStream = null;
		try {
			inputStream = file.getInputStream();
			path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/reviewimg");

			File hotelimg = new File(path);
			if (!hotelimg.exists()) {
				hotelimg.mkdirs();
			}

			File newFile = null;

			for (int i = 1;; i++) {
				newFile = new File(path + "/" + full_na);
				if (!newFile.exists()) {
					newFile.createNewFile();
					break;
				} else {
					renew_na = na + "(" + i + ")";
					full_na = renew_na + "." + new_name[1];
				}
			}

			outputStream = new FileOutputStream(newFile);
			int read = 0;
			byte[] b = new byte[(int) file.getSize()];

			while ((read = inputStream.read(b)) != -1) {
				outputStream.write(b, 0, read);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				inputStream.close();
				outputStream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String return_path = "resources/reviewimg/" + full_na;
		System.out.println(return_path);

		Map<String, String> map = new HashMap<String, String>();

		map.put("path", return_path);

		return map;
	}
	
	
}
