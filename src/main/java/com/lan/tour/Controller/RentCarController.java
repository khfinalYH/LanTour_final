package com.lan.tour.Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

public class RentCarController {

	public static void main(String[] args) throws IOException {

		String strUrl = "http://api.data.go.kr/openapi/tn_pubr_public_car_rental_api";
		strUrl += "?serviceKey=ycEFiYcdm4Rmzb0Ghr%2FvOIQEhPbcHO5HhztZMrksr1GP%2FRuf4uus9ogb4SJairtnLSYmxMuWn65moOzT%2FN4EuQ%3D%3D";
		strUrl += "&type=xml";
		strUrl += "&s_page=0";
		strUrl += "&s_list=1";
		strUrl += "&instt_nm=aaa";
		URL url = new URL(strUrl);
		URLConnection urlConnection = url.openConnection();
		HttpURLConnection connection = null;
		
		if(urlConnection instanceof HttpURLConnection){
		    connection = (HttpURLConnection) urlConnection;
		}else{
			System.out.println("error");
		    return;
		}
		
		BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
		String urlString = "";
		String current;
		
		while((current = in.readLine()) != null){
		    urlString += current+"\n";
		}
		System.out.println(urlString);
	}
	
}
