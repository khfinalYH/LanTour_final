package com.lan.tour.Controller;


import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lan.tour.model.biz.HotelBiz;
import com.lan.tour.model.biz.LantourBiz;
import com.lan.tour.model.biz.MemberBiz;
import com.lan.tour.model.biz.ReservationBiz;
import com.lan.tour.model.biz.RoomBiz;
import com.lan.tour.model.dto.LantourDto;
import com.lan.tour.model.dto.MemberDto;
import com.lan.tour.model.dto.ReservationDto;

@Controller
public class ReservationController {

	@Autowired
	MemberBiz Mbiz;
	
	@Autowired
	HotelBiz Hbiz;

	@Autowired
	RoomBiz Roobiz;
	
	@Autowired
	LantourBiz Lbiz;
	
	@Autowired
	ReservationBiz Resbiz;
	
	
	@RequestMapping("reservation.do")
	public String reservation(Model model, String type, int no, int rno) {
		
		
		if(type.equals("lantour")) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			LantourDto Ldto = Lbiz.selectOne(no);
			if(Ldto.getLantour_date().indexOf(',')>0){
				for(int i = 0; i < Ldto.getLantour_date().split(",").length ; i++){
					map.put(Ldto.getLantour_date().split(",")[i], Resbiz.countDate(Ldto.getLantour_date().split(",")[i], no).size());
				}
			}
			model.addAttribute("map", map);
			model.addAttribute("lantourDto", Ldto);
			model.addAttribute("ResDto", Resbiz.selectList(type, no, 0));
		}else {
			model.addAttribute("ResDto", Resbiz.selectList(type, no, rno));
			model.addAttribute("Resbiz",Resbiz.selectList(type, no, rno));
			model.addAttribute("HotelDto", Hbiz.selectOne(no));
			model.addAttribute("RoomDto", Roobiz.selectOne(rno));
		}
		return "reservation_insert";
	}
	@RequestMapping("insertReservation.do")
	public String InertReservation(int no, int rno, int member_no, String reservation_date, String reservation_checkout_date,int reservation_price ) {
		
		ReservationDto dto = new ReservationDto(0, no, rno, no, member_no, reservation_date,reservation_checkout_date ,reservation_price, "N", null); 
		Resbiz.insert(dto);
		return "redirect:reservationdetail.do";
	}
	
	@RequestMapping("reservationdetail.do")
	public String reservationDetail(Model model, HttpSession session) {
		MemberDto Mdto =(MemberDto)session.getAttribute("login");
		int m_no = Mdto.getMember_no();
		ReservationDto resdto = Resbiz.selectList(m_no).get(0);
		if(resdto.getRoom_no()==0) {
			model.addAttribute("date", Resbiz.countDate(resdto.getReservation_date(),resdto.getLantour_no()).size());
			model.addAttribute("Ldto", Lbiz.selectOne(resdto.getLantour_no()));
		}else {
			model.addAttribute("Hdto", Hbiz.selectOne(resdto.getHotel_no()));
			model.addAttribute("Roodto", Roobiz.selectOne(resdto.getRoom_no()));
		}
		model.addAttribute("Resdto", resdto);
		return "reservation_detail";
	}
	@RequestMapping("reservation_detail_one.do")
	public String reservationDetailOne(Model model, HttpSession session, int no) {
		ReservationDto dto = Resbiz.selectOne(no);
		if(dto.getRoom_no()==0) {
			model.addAttribute("date", Resbiz.countDate(dto.getReservation_date(),dto.getLantour_no()).size());
			model.addAttribute("Ldto", Lbiz.selectOne(dto.getLantour_no()));
		}else {
			model.addAttribute("Hdto", Hbiz.selectOne(dto.getHotel_no()));
			model.addAttribute("Roodto", Roobiz.selectOne(dto.getRoom_no()));
			
		}
		model.addAttribute("Resdto", dto);
		return "reservation_detail";
	}
	
	@RequestMapping("reservation_pay.do")
	public String reservationPay(int no, String m_id) {
		ReservationDto dto = new ReservationDto();
		dto.setReservation_no(no);
		dto.setReservation_pay(m_id);
		if(Resbiz.updatepay(dto)>0) {
		return "redirect:reservation_detail_one.do?no="+no;
		}
		return "test";
	}	
	
	@RequestMapping("canclepay.do")
	public String canclepay(int no, String id) {
		String cancleurl = "https://api.iamport.kr/payments/cancel?_token="+getToken();
		
		String res = null;
		try {
			URL url = new URL(cancleurl);
			HttpsURLConnection httpsConn = (HttpsURLConnection) url.openConnection();
			String param = "merchant_uid="+id+"&reason="+"고객요청";
			httpsConn.setRequestMethod("POST");			
			httpsConn.setDoOutput(true);              //항상 갱신된내용을 가져옴.
	        DataOutputStream wr = new DataOutputStream(httpsConn.getOutputStream());
	        wr.writeBytes(param);
	        wr.flush();
	        wr.close();
	        Charset charset = Charset.forName("UTF-8");
	        BufferedReader in = new BufferedReader(new InputStreamReader(httpsConn.getInputStream(),charset));
	        String inputLine;
	        StringBuffer response = new StringBuffer();

	        while ((inputLine = in.readLine()) != null) {
	            response.append(inputLine);
	        }
	        in.close();
	        System.out.println(response.toString());
	        res = response.toString().split("\"status\":\"")[1].split("\",\"user_agent\":")[0];
		}catch (Exception e) {
			e.printStackTrace();
		}
		if(res.equals("cancelled")) {
			ReservationDto dto = new ReservationDto();
			dto.setReservation_no(no);
			dto.setReservation_pay(res);	
			Resbiz.updatepay(dto);
		}
		
		return "redirect:reservation_detail_one.do?no="+no;
	}
	public static String getToken() {
		String tokenurl = "https://api.iamport.kr/users/getToken";
		String imp_key = "4930579507136379";
		String imp_secret = "74K6QUViRgnmYkRY41kGk2B5nZW727Dacog2jckasIwr2oq7qKNLNoRaoNhqVVA7kR9D3uOvckXfJnma";
		
		String res = null;
		try {
			URL url = new URL(tokenurl);
			HttpsURLConnection httpsConn = (HttpsURLConnection) url.openConnection();
			String param = "imp_key="+imp_key+"&imp_secret="+imp_secret;
			httpsConn.setRequestMethod("POST");			
			httpsConn.setDoOutput(true);              //항상 갱신된내용을 가져옴.
	        DataOutputStream wr = new DataOutputStream(httpsConn.getOutputStream());
	        wr.writeBytes(param);
	        wr.flush();
	        wr.close();
	        Charset charset = Charset.forName("UTF-8");
	        BufferedReader in = new BufferedReader(new InputStreamReader(httpsConn.getInputStream(),charset));
	        String inputLine;
	        StringBuffer response = new StringBuffer();

	        while ((inputLine = in.readLine()) != null) {
	            response.append(inputLine);
	        }
	        in.close();
	        res = response.toString().split("\"access_token\":\"")[1].split("\",\"now\":")[0];
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@ResponseBody
	@RequestMapping("payments.do")
	public Map<String, String> payment(String imp_uid) {
		String status = "";
		try {
			String access_token = getToken();
	        String payurl = "https://api.iamport.kr/payments/"+imp_uid+"?_token="+access_token;
	        URL url = new URL(payurl);
			String param = "token="+access_token;
			HttpsURLConnection httpsConn = (HttpsURLConnection) url.openConnection();
			httpsConn.setRequestMethod("GET");
	        
	        int responseCode = httpsConn.getResponseCode();
	        Charset charset = Charset.forName("UTF-8");
	        BufferedReader in = new BufferedReader(new InputStreamReader(httpsConn.getInputStream(),charset));
	        StringBuffer response = new StringBuffer();
	        String inputLine;
	        
	        while ((inputLine = in.readLine()) != null) {
	            response.append(inputLine);
	        }
	        in.close();
	        // status (string): 결제상태. ready:미결제, paid:결제완료, cancelled:결제취소, failed:결제실패 = ['ready', 'paid', 'cancelled', 'failed']
	        status = response.toString().split("\"status\":\"")[1].split("\",\"user_agent\"")[0];
		}catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("status", status);
		return map;
	}
	
	
	
}
