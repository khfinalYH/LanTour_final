package com.lan.tour.Controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SpeechRecognition {
	

	
	@RequestMapping("/sppechR.do")
	public String airportSearch() {
		return "speech_recognition";
	}

}
