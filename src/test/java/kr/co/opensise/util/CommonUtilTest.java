package kr.co.opensise.util;

import static org.junit.Assert.*;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.code.geocoder.model.LatLng;

import kr.co.opensise.setup.ControllerSetup;


public class CommonUtilTest {
	
	private Logger log = LoggerFactory.getLogger(CommonUtilTest.class);
	
	@Test
	public void geoCodingTest() {
		
		/***given***/
		String location = "경기도 성남시 분당구 삼평동";
		
		/***when***/
		LatLng latLng = CommonUtil.geoCoding(location);
		
		log.debug("Lat ->> {}", latLng.getLat());
		log.debug("Lng ->> {}", latLng.getLng());
		

		/***then***/
		assertTrue(true);
		
	}
	
	
	@Test
	public void delCommaTest() {
		/***given***/
		String data = "8,200";
		/***when***/
		double result = CommonUtil.delComma(data);

		/***then***/
		assertEquals(8200, result);
	}

}
