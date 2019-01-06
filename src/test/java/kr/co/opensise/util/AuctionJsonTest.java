package kr.co.opensise.util;

import static org.junit.Assert.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.co.opensise.user.main.model.AuctionVo;

public class AuctionJsonTest {
	
	private Logger log = LoggerFactory.getLogger(AuctionJsonTest.class);
	
	@Test
	public void getJSONDataTest() throws UnsupportedEncodingException, IOException {
		/***Given***/
		String url = null;
		try {
			url = "http://100dream.net:8888/api/courtauction?addr0="+ URLEncoder.encode("대전광역시", "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		/***When***/
		String jsonString = null;
		try {
			jsonString = AuctionJson.getJSONData(url);
		}catch(Exception e) {
			e.printStackTrace();
		}

		/***Then***/
		log.info("json 결과값 {}",jsonString);
		
	}
	
	@Test
	public void getDataVoTest() {
		/***Given***/
		String url = null;
		try {
			url = "http://100dream.net:8888/api/courtauction?addr0="+ URLEncoder.encode("대전광역시", "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String jsonString = null;
		try {
			jsonString = AuctionJson.getJSONData(url);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		/***When***/
		List<AuctionVo> aucVoList = AuctionJson.getDataVo(jsonString);
		
		/***Then***/
		for(AuctionVo aucVo : aucVoList) {
			
			//log.info(aucVo.getCaseNum());
		}
		 
	}
	

}

















