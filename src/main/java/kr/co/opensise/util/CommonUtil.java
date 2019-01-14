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
        
           addr = getLatLng(getJSONData(url));
        return addr;


		
	}
	
	
	public static String coord2Addr(Map<String, Double> latLng) throws IOException {
		
		Double x = latLng.get("lng");
		Double y = latLng.get("lat");
		
		String url = "https://dapi.kakao.com/v2/local/geo/coord2address.json?x="+x+"&y="+y+"&input_coord=WGS84";
		
		String dong = getAddr(getJSONData(url));
		
		return dong; 
	}

	
	public static String getJSONData(String apiUrl) throws IOException {
		String jsonString = new String();
		String buf;
		URL url = new URL(apiUrl);
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		String auth = "KakaoAK f24a67aa2e49241ac5bbbc232c3a893c";
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

	private static Map<String, String> getLatLng(String jsonString) throws IndexOutOfBoundsException, NullPointerException{
		  
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
	
	private static String getAddr(String jsonString) {
		
		JsonParser jsonParser = new JsonParser();
		
		JsonObject jsonObject = (JsonObject) jsonParser.parse(jsonString);
		
		JsonArray documents = (JsonArray) jsonObject.get("documents");
		
		if(documents== null) {
			throw new NullPointerException();
		}
		  
		if(documents.size() < 1) {
			throw new IndexOutOfBoundsException();
		}
		
		String dong = documents.get(0).getAsJsonObject().get("address").getAsJsonObject().get("region_3depth_name").toString();
		
		return dong;
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
	
	
	/*************************************************  
	* Method   : getFileExt 
	* 작성자 :  whdgn
	* 변경이력 :  2018. 12. 19.
	* @param fileName
	* @return  
	* Method 설명 : 파일명에서  확장자 추출
	**************************************************/
	public static String getFileExt(String fileName) {
		//확장가가 있을경우 .을 포함한 확장자 값을 리턴
		//확장자가 없을경우 "" 리턴(white space)
		
			
		int dotIndex = fileName.lastIndexOf(".");
		
		if(dotIndex == -1) {
			return "";
		} else {
			return fileName.substring(dotIndex);
		}	
	}
	
	public static String getNonWhiteSpace(String string) {
		String result = string.replaceAll("\\s", "");
		
		return result;
	}
}