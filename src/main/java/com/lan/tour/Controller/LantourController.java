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

import com.lan.tour.model.biz.LantourBiz;
import com.lan.tour.model.dto.LantourDto;



@Controller
public class LantourController {

	@Autowired
	private LantourBiz biz;
	
	@RequestMapping("/lantourlist.do")
	public String lantourlist(Model model) {
		model.addAttribute("list", biz.selectList());
		return "lantour";
	}
	
	@RequestMapping("/lantourinsert.do")
	public String lantourinsert() {
		return "lantourinsert";
		
	}
	
	
	@RequestMapping("/lantourinsertres.do")
	public String lantourinsertres(LantourDto dto) {
		System.out.println(dto);
		
		if (biz.insert(dto) > 0) {
			return "redirect:lantourlist.do";
		}
		return "redirect:lantourinsert.do";
		
	}

	@RequestMapping("/lantourdetail.do")
	public String lantourdetail(Model model, int lantour_no) {
		
		model.addAttribute("dto", biz.selectOne(lantour_no));
		
		return "lantourdetail";
	}
	
	@RequestMapping("/lantourupdate.do")
	public String updateform(Model model, int lantour_no) {
		model.addAttribute("dto", biz.selectOne(lantour_no));

		return "lantourupdate";
	}
	@RequestMapping("/lantourupdateres.do")
	public String updateres(LantourDto dto) {
		if (biz.update(dto) > 0) {
			return "redirect:lantourdetail.do?lantour_no=" + dto.getLantour_no();
		}

		return "redirect:lantourupdate.do?lantour_no=" + dto.getLantour_no();
	}
	
	@RequestMapping("/lantourdelete.do")
	public String lantourdelete(int lantour_no) {
		
		if(biz.delete(lantour_no) > 0) {
			return "redirect:lantourlist.do";
		}
		
		return "redirect:lantourdetail";
	}
	
	@ResponseBody
	@RequestMapping("/lantourupload.do")
	public Map<String, String> lantourupload(@RequestParam("mpfile") MultipartFile file, HttpServletRequest request) {

		String name = file.getOriginalFilename();
		String path = "";

		System.out.println(name);

		InputStream inputStream = null;
		OutputStream outputStream = null;
		try {
			inputStream = file.getInputStream();
			path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/lantourimg");

			File lantourimg = new File(path);
			if (!lantourimg.exists()) {
				lantourimg.mkdirs();
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
		String return_path = "resources/lantourimg/" + name;
		System.out.println(return_path);

		Map<String, String> map = new HashMap<String, String>();

		map.put("path", return_path);

		return map;
	}
	
	@RequestMapping("/updateRtcAddr.do")
	public void updateRtcAddr(String room_id, int lantour_no) {
		String lantour_rtc = "https://localhost:3000/" + room_id;
		LantourDto dto = new LantourDto(lantour_no, lantour_rtc);
		dto.setLantour_rtc(lantour_rtc);
		dto.setLantour_no(lantour_no);
		biz.rtcupdate(dto);
	}
}
