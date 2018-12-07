package kr.co.opensise.util;

import static org.junit.Assert.*;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;




public class CommonUtilTest {
	
	private Logger log = LoggerFactory.getLogger(CommonUtilTest.class);
	
	@Test
	public void geoCodingTest() {
		
		/***given***/
		String location = "대전서구 월평동 1212";
		
		/***when***/
		Map<String, String> result = null;
		result = CommonUtil.addr2Coord(location);
		
		String lat = result.get("lat");
		String lng = result.get("lng");
		
		log.info("lat : {}, lng: {}", lat, lng);;

		/***then***/
		assertTrue(true);
		
	}
	
	@Test
	public void getJSONdataTest() {
		
		
		/***given***/
		String location = "대전 서구 월평동 1212";
		String query = "";
		try {
			query = "https://dapi.kakao.com/v2/local/search/address.json?query="+ URLEncoder.encode(location, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		/***when***/
		String result = null;
		try {
			result = CommonUtil.getJSONData(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		log.info(result);
		

		/***then***/
		

	

		
	}
	
	
	@Test
	public void delCommaTest() {
		/***given***/
		String data = "8,200";
		/***when***/
		double result = CommonUtil.delComma(data);

		/***then***/
		assertTrue(8200 == result);
	}
	

}
