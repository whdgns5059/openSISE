package kr.co.opensise.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonPrimitive;

import kr.co.opensise.user.main.model.AuctionVo;

public class AuctionJson {
	
	static Logger log = LoggerFactory.getLogger(AuctionJson.class);

	public static List<AuctionVo> getAuctionList(String startdt) throws NullPointerException, IndexOutOfBoundsException, IOException{

		String url = null;
		startdt = "2018-12-26";
		try {
			url = "http://api.work6.kr/courtauction?court="+ URLEncoder.encode("대전지방법원", "UTF-8") + "&startdt="+startdt;
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		List<AuctionVo> aucVoList = getDataVo(getJSONData(url));
		
		return aucVoList;
	}
	
	/**
	* Method : getJSONData
	* 작성자 : Bella
	* 변경이력 :
	* @param apiUrl
	* @return
	* @throws IOException
	* Method 설명 : 데이터 가져오기
	*/
	public static String getJSONData(String apiUrl) throws IOException {
		String jsonString = new String();
		String buf;
		URL url = new URL(apiUrl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		while ((buf = br.readLine()) != null) {
			jsonString += buf;
		}
		return jsonString;
	}

	/**
	* Method : getDataVo
	* 작성자 : Bella
	* 변경이력 :
	* @param jsonString
	* @return
	* @throws IndexOutOfBoundsException
	* @throws NullPointerException
	* Method 설명 : 데이터를 경매Vo에 정리
	*/
	public static List<AuctionVo> getDataVo(String jsonString) throws IndexOutOfBoundsException, NullPointerException{

		JsonParser jsonParser = new JsonParser();

		JsonObject jsonObject = (JsonObject) jsonParser.parse(jsonString);
		JsonObject dataObject = (JsonObject) jsonObject.get("data");
		JsonObject inObject = (JsonObject) dataObject.get("data");

		for(int i=1 ; i<3 ; i++) {
			log.info("파싱 결과"+i+"는 {}",dataObject.get(""+i));
		}
		
		//JsonArray documentsObject = (JsonArray) jsonObject.get("data");

		
//		if(documentsObject == null) {
//			log.info("NULL 입니다");
//			throw new NullPointerException();
//		}
//
//		if(documentsObject.size() < 1) {
//			log.info("정보가 없어요");
//			throw new IndexOutOfBoundsException();
//		}

		
//		String lat = documentsObject.get(0).getAsJsonObject().get("y").getAsString();
//		String caseNum = documentsObject.get(0).getAsJsonObject().getAsString();
//		log.info("caseNum은 {}",caseNum);
//		String bldClassf
//		String addr
//		String bldInfo
//		String valuePrice
//		String minPrice

		List<AuctionVo> aucVoList = new ArrayList<AuctionVo>();
		
		AuctionVo aucVo = new AuctionVo();
		//aucVo.setCaseNum(caseNum);

		return aucVoList;
	}


//	{ "court":"서울동부지방법원", 
//	"startdt":"2018-07-26", 
//	"enddt":"2018-08-09", 
//	"data":{ 
//		"1":[ 
//		      "서울동부지방법원", // 관할 법원 
//		      "2015타경9077", // 사건번호 
//		      "1", // 동 사건번호 물건 번호 
//		      "아파트", // 용도 
//		      [ 
//		        [ 
//			      "서울특별시 강동구 성내동 443-21 갑지하이린아파트 601호", // 소재지 및 내역 
//			      "[집합건물 철근콘크리트조 124.78㎡]" 
//			    ] 
//		      ], 
//		      "", // 비고
//		      [ 
//		        "702,000,000", // 감정평가액 
//		        "702,000,000" // 최저매각가격 
//		      ], 
//		      { 
//				"0":"경매2계", // 담당계 
//				"1":"신건" // 진행상태 
//		      } 
//		],
//	}
//}


}















