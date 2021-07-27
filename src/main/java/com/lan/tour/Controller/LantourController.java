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
import com.lan.tour.model.biz.ReservationBiz;
import com.lan.tour.model.biz.ReviewBiz;
import com.lan.tour.model.dto.LantourDto;
import com.lan.tour.model.dto.LantourPagingDto;
import com.lan.tour.model.dto.ReservationDto;

@Controller
public class LantourController {

	@Autowired
	private LantourBiz biz;
	
	@Autowired
	private ReservationBiz Rbiz;

	@Autowired
	private ReviewBiz Rbiz2;
	

	@RequestMapping("/lantourlist_category.do")
	public String selectKeywordList(Model model, LantourPagingDto dto) {

		
		int count = 0;
		
		String category = dto.getCategory();
		String keyword = dto.getKeyword();
		int curPage = dto.getCurPage();
		
		if (category == null || category.equals("")) {
			count = biz.countTotal();
			System.out.println(count);
			LantourPagingDto dtoN = new LantourPagingDto(count, curPage);
			
			model.addAttribute("list", biz.selectList(dtoN));
			model.addAttribute("dto", dtoN);
		} else if (category.equals("l_t")) {
			count = biz.countT(keyword);
			LantourPagingDto dtoN = new LantourPagingDto(count, curPage, keyword, category);
			
			model.addAttribute("list", biz.selectTitleList(dtoN));
			model.addAttribute("dto", dtoN);
			
		} else if (category.equals("l_c")) {
			count = biz.countC(keyword);
			LantourPagingDto dtoN = new LantourPagingDto(count, curPage, keyword, category);
			
			model.addAttribute("list", biz.selectContentList(dtoN));
			model.addAttribute("dto", dtoN);
			
		
		}
		
		return "lantour";
	}
	
	@RequestMapping("/lantourlist.do")
	public String lantourList(Model model, 
			@RequestParam(defaultValue="1") int curPage,
            @RequestParam(defaultValue="") String category,
            @RequestParam(defaultValue="") String keyword) {
		System.out.println("start");
		int count = 0;
		
		count = biz.countTotal();
		System.out.println(count);
		LantourPagingDto dto = new LantourPagingDto(count, curPage, category, keyword);
		int start = dto.getPageBegin();
        int end =  dto.getPageEnd();
			
		model.addAttribute("list", biz.listAll(category, keyword, start, end));//search_option, keyword, start, end
		model.addAttribute("dto", dto);
		model.addAttribute("count", count);
		model.addAttribute("category", category);
		model.addAttribute("keyword", keyword);
		model.addAttribute("scorelist", Rbiz2.scoreList("lantour"));
		return "lantour";
	}
	
	@RequestMapping("/lantourinsert.do")
	public String lantourinsert() {
		return "lantourinsert";
		
	}
	
	@RequestMapping("/lantourinsertres.do")
	public String lantourinsertres(LantourDto dto, String[] lantour_date) {
		StringBuilder sb = new StringBuilder();
		for(String date : lantour_date) {
			sb.append(date+"/");
		}
		System.out.println(sb.toString());
		dto.setLantour_date(sb.toString());
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
		System.out.println("updatedto:"+dto.getLantour_no() );
		System.out.println("updatedto:"+dto.getLantour_content() );
		System.out.println("updatedto:"+dto.getLantour_image() );   
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
	
	@ResponseBody
	@RequestMapping("/guestCheck.do")
	public String guestCheck(String member_no, String lantour_no) {

		int lantour_no1 = Integer.parseInt(lantour_no);
		int member_no1 = Integer.parseInt(member_no);
		ReservationDto dto = new ReservationDto(lantour_no1, member_no1);

		ReservationDto res = Rbiz.selectOne(dto);
		if (res == null) {
			return "redirect:lantourlist.do";
		}
		String payYN = res.getReservation_pay();
		

		return payYN;
	}
}
