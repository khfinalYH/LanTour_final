package com.lan.tour.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TTSController {

		@RequestMapping("/tts.do")
		public String airportSearch() {
			return "tts";
		}
}
