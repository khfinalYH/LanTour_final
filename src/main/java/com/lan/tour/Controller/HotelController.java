package com.lan.tour.Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.lan.tour.model.biz.HotelBiz;
import com.lan.tour.model.biz.ReviewBiz;
import com.lan.tour.model.biz.RoomBiz;
import com.lan.tour.model.dto.HotelDto;

@Controller
public class HotelController {

	@Autowired
	private HotelBiz biz;

	
	@Autowired
	private RoomBiz biz2;

	@Autowired
	private ReviewBiz Rbiz;

	@RequestMapping("/hotellist.do")
	public String hotellist(Model model) {
		model.addAttribute("list", biz.selectList());
		model.addAttribute("scorelist", Rbiz.scoreList("hotel"));
		return "hotel";
	}

	@RequestMapping("/hotelinsert.do")
	public String hotelinsert() {
		return "hotelinsert";
	}

	@RequestMapping("/hotelinsertres.do")
	public String hotelinsertres(HotelDto dto) {
		System.out.println(dto);

		if (biz.insert(dto) > 0) {
			return "redirect:hotellist.do";
		}
		return "redirect:hotelinsert.do";
	}

	@RequestMapping("/hoteldetail.do")
	public String hoteldetail(Model model, int hotel_no) {
		model.addAttribute("dto", biz.selectOne(hotel_no));
		model.addAttribute("roomlist", biz2.selectList(hotel_no));

		return "hoteldetail";
	}

	@RequestMapping("/hoteldelete.do")
	public String hoteldelete(int hotel_no) {
		if (biz.delete(hotel_no) > 0) {
			return "redirect:hotellist.do";
		}

		return "redirect:hoteldetail.do?hotel_no=" + hotel_no;
	}

	@RequestMapping("/hotelupdate.do")
	public String updateform(Model model, int hotel_no) {
		model.addAttribute("dto", biz.selectOne(hotel_no));

		return "hotelupdate";
	}

	@RequestMapping("/hotelupdateres.do")
	public String updateres(HotelDto dto) {
		if (biz.update(dto) > 0) {
			return "redirect:hoteldetail.do?hotel_no=" + dto.getHotel_no();
		}

		return "redirect:hotelupdate.do?hotel_no=" + dto.getHotel_no();
	}

	@ResponseBody
	@RequestMapping("/hotelupload.do")
	public Map<String, String> hotelupload(@RequestParam("mpfile") MultipartFile file, HttpServletRequest request) {

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
			path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/hotelimg");

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
		String return_path = "resources/hotelimg/" + full_na;
		System.out.println(return_path);

		Map<String, String> map = new HashMap<String, String>();

		map.put("path", return_path);

		return map;
	}
}
