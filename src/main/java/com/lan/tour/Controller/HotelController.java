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
import com.lan.tour.model.dto.HotelDto;

@Controller
public class HotelController {

	@Autowired
	private HotelBiz biz;

	@RequestMapping("/hotellist.do")
	public String hotellist(Model model) {
		model.addAttribute("list", biz.selectList());
		return "hotel";
	}

	@RequestMapping("/hotelinsert.do")
	public String hotelinsert() {
		return "hotelinsert";
	}

	@RequestMapping("/insertres.do")
	public String hotelinsertres(HotelDto dto) {
		System.out.println(dto);

		if (biz.insert(dto) > 0) {
			return "redirect:hotellist.do";
		}
		return "redirect:hotelinsert.do";
	}
	
	@RequestMapping("/hoteldetail.do")
	public String hoteldetail(Model model ,int hotel_no) {
		model.addAttribute("dto", biz.selectOne(hotel_no));
		
		return "hoteldetail";
	}

	@ResponseBody
	@RequestMapping("/hotelupload.do")
	public Map<String , String> hotelupload(@RequestParam("mpfile") MultipartFile file, HttpServletRequest request) {

		String name = file.getOriginalFilename();
		String path = "";
		
		System.out.println(name);
		
		InputStream inputStream = null;
		OutputStream outputStream = null;
		try {
			inputStream = file.getInputStream();
			path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/hotelimg");

			File hotelimg = new File(path);
			if (!hotelimg.exists()) {
				hotelimg.mkdirs();
			}

			File newFile = new File(path + "/" + name);
			if (!newFile.exists()) {
				newFile.createNewFile();
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
		String return_path =  "resources/hotelimg/" + name;
		System.out.println(return_path);
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("path", return_path);
		
		return map;
	}
}
