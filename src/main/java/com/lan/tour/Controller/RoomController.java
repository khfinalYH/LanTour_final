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

import com.lan.tour.model.biz.RoomBiz;
import com.lan.tour.model.dto.RoomDto;

@Controller
public class RoomController {

	@Autowired
	private RoomBiz biz;

	@RequestMapping("/roominsert.do")
	public String roominsert(int hotel_no, Model model) {
		model.addAttribute("hotel_no", hotel_no);
		return "roominsert";
	}

	@RequestMapping("/roominsertres.do")
	public String roominsertres(RoomDto dto) {
		if (biz.insert(dto) > 0) {
			return "redirect:hoteldetail.do?hotel_no=" + dto.getHotel_no();
		}
		return "redirect:roominsert.do?hotel_no=" + dto.getHotel_no();
	}

	@ResponseBody
	@RequestMapping("/roomupload.do")
	public Map<String, String> roomupload(@RequestParam("mpfile") MultipartFile file, HttpServletRequest request) {
		String name = file.getOriginalFilename();
		String path = "";

		InputStream inputStream = null;
		OutputStream outputStream = null;

		try {
			inputStream = file.getInputStream();

			path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/roomimg");
			File roomimg = new File(path);
			if (!roomimg.exists()) {
				roomimg.mkdirs();
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
		String return_path = "resources/roomimg/" + name;
		System.out.println(return_path);

		Map<String, String> map = new HashMap<String, String>();

		map.put("path", return_path);
		
		return map;
	}
}
