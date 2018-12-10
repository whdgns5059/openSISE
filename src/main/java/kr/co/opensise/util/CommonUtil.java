package kr.co.opensise.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;



public class CommonUtil {
	
	private static Logger log = LoggerFactory.getLogger(CommonUtil.class);
	
	
	/*******************************************
	 * @param location
	 * @return Map<String, String>
	 * @throws Exception 
	 * @throws NullPointerException 
	 * @throws IOException 
	 * @throws IndexOutOfBoundsException 
	 * @throws UnsupportedEncodingException
	 * location에 해당되는 lat,lng를 map으로 리턴한다
	 * 해당 메서드는 kakao REST API를 이용함
	 ******************************************/
	public static Map<String, String> addr2Coord(String location) throws NullPointerException, IndexOutOfBoundsException, IOException{
		
        String url = null;
		try {
			url = "https://dapi.kakao.com/v2/local/search/address.json?query="+ URLEncoder.encode(location, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
        Map<String, String> addr = null;
        
           addr = getRegionAddress(getJSONData(url));
        return addr;


		
	}
	
	public static String getJSONData(String apiUrl) throws IOException {
		String jsonString = new String();
		String buf;
		URL url = new URL(apiUrl);
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		String auth = "KakaoAK 5b0c1d183ff30c68efea262ca7f8e7ab";
		conn.setRequestMethod("GET");
		conn.setRequestProperty("X-Requested-With", "curl");
		conn.setRequestProperty("Authorization", auth);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(
				conn.getInputStream(), "UTF-8"));
		while ((buf = br.readLine()) != null) {
			jsonString += buf;
		}
		return jsonString;
	}

	private static Map<String, String> getRegionAddress(String jsonString) throws IndexOutOfBoundsException, NullPointerException{
		  
		  	JsonParser jsonParser = new JsonParser();
		  	
		  	JsonObject jsonObject = (JsonObject) jsonParser.parse(jsonString);
		  	
		  	JsonArray documentsObject = (JsonArray) jsonObject.get("documents");
		  	
		  	Map<String, String> resultMap = new HashMap<String, String>();
		  	
		  	if(documentsObject == null) {
		  		throw new NullPointerException();
		  	}
		  	
		  	if(documentsObject.size() < 1) {
		  		throw new IndexOutOfBoundsException();
		  	}
		  	
		  	String lng = documentsObject.get(0).getAsJsonObject().get("x").getAsString();
		  	String lat = documentsObject.get(0).getAsJsonObject().get("y").getAsString();
		  	
		  	resultMap.put("lat", lat);
		  	resultMap.put("lng", lng);
		  	
	        return resultMap;
	    }
	
	
	
	/*******************************************
	 * @param data
	 * @return double
	 * 콤마가 존재하는 숫자 문자열을 콤마가 없는 문자로 변환해준다
	 ******************************************/
	public static double delComma(String data) {
		String removeData = data.replaceAll(",", "").trim();
		return Double.parseDouble(removeData);
	}
	
}
