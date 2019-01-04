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
	
	static String caDesc;		
	static String id;			
	static String auctionInfo;	
	static String auctionDate;	
	static String regDate;		
	static String addr0;		
	static String addr1;		
	static String addr2;		
	static String addr;		
	static String itemType;	
	static String addrInfo;	
	static String valueMin;	
	static String value;		
	static String auctionLoc;	
	static String remarks;		
	static String auctionTel;	
	
	static Logger log = LoggerFactory.getLogger(AuctionJson.class);

	public static List<AuctionVo> getAuctionList() throws NullPointerException, IndexOutOfBoundsException, IOException{

		String url = null;
		
		try {
			// 대전광역시 최근 30개 내역만 출력
			url = "http://100dream.net:8888/api/courtauction?addr0="+ URLEncoder.encode("대전광역시", "UTF-8") + "&pageSize=30";
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
		JsonArray dataArray = (JsonArray) jsonObject.get("result");

		// 예외처리
		if(dataArray == null) {
			log.info("NULL 입니다");
			throw new NullPointerException();
		}

		if(dataArray.size() < 1) {
			log.info("정보가 없어요");
			throw new IndexOutOfBoundsException();
		}

		List<AuctionVo> aucVoList = new ArrayList<AuctionVo>();
		AuctionVo aucVo = null;
		for(int i=0 ; i<dataArray.size() ; i++) {
			
			// json 데이터 받아오기
			caDesc		= dataArray.get(i).getAsJsonObject().get("caDesc").getAsString();
			id			= dataArray.get(i).getAsJsonObject().get("id").getAsString();
			auctionInfo = dataArray.get(i).getAsJsonObject().get("auctionInfo").getAsString();
			auctionDate = dataArray.get(i).getAsJsonObject().get("auctionDate").getAsString();
			regDate		= dataArray.get(i).getAsJsonObject().get("regDate").getAsString();
			addr0		= dataArray.get(i).getAsJsonObject().get("addr0").getAsString();
			addr1		= dataArray.get(i).getAsJsonObject().get("addr1").getAsString();
			addr2		= dataArray.get(i).getAsJsonObject().get("addr2").getAsString();
			addr		= dataArray.get(i).getAsJsonObject().get("addr").getAsString();
			itemType	= dataArray.get(i).getAsJsonObject().get("itemType").getAsString();
			addrInfo	= dataArray.get(i).getAsJsonObject().get("addrInfo").getAsString();
			valueMin	= dataArray.get(i).getAsJsonObject().get("valueMin").getAsString();
			value		= dataArray.get(i).getAsJsonObject().get("value").getAsString();
			auctionLoc	= dataArray.get(i).getAsJsonObject().get("auctionLoc").getAsString();
			remarks		= dataArray.get(i).getAsJsonObject().get("remarks").getAsString();
			auctionTel	= dataArray.get(i).getAsJsonObject().get("auctionTel").getAsString();
			
			// vo에 저장
			aucVo = new AuctionVo(caDesc, caDesc, auctionInfo, auctionDate, regDate, 
					addr0, addr1, addr2, addr, itemType, addrInfo, valueMin, value, 
					auctionLoc, remarks, auctionTel);
			
			// vo 리스트에 저장
			aucVoList.add(aucVo);
			
		}
		
		return aucVoList;
	}


//	{
//	"msg":"ok",
//	"result":[
//	          {
//	        	  "status":"신건",
//	        	  "auctionDate":"2019-01-08",
//	        	  "auctionInfo":"경매4계",
//	        	  "addr0":"대전광역시",
//	        	  "addr2":"모암로24번길",
//	        	  "court":"대전지방법원",
//	        	  "addr1":"중구",
//	        	  "itemNo":1,
//	        	  "regDate":"2018-12-25",
//	        	  "caDesc":"대전지방법원 2018타경8767",
//	        	  "addrInfo":"[집합건물 시멘트벽돌및벽돌조 37.09㎡ 공유자 성보경 지분 2분의1, 성봉진 지분 2분의 1 전부]",
//	        	  "caNo":"2018타경8767",
//	        	  "auctionTel":"470-1804",
//	        	  "itemType":"다세대",
//	        	  "valueMin":51000000,
//	        	  "updDate":"2018-12-25",
//	        	  "id":8851880,
//	        	  "addr":"대전광역시 중구 모암로24번길 70, 2층202호",
//	        	  "value":51000000,
//	        	  "auctionLoc":"제106호 법정",
//	        	  "remarks":""
//	          },
//	          {
//	        	  "status":"신건",
//	        	  "auctionDate":"2019-01-08",
//	        	  "auctionInfo":"경매4계",
//	        	  "addr0":"대전광역시",
//	        	  "addr2":"태평동",
//	        	  "court":"대전지방법원",
//	        	  "addr1":"중구",
//	        	  "itemNo":1,
//	        	  "regDate":"2018-12-25",
//	        	  "caDesc":"대전지방법원 2018타경7764",
//	        	  "addrInfo":"[집합건물 철근콘크리트조 59.34㎡]",
//	        	  "caNo":"2018타경7764",
//	        	  "auctionTel":"470-1804",
//	        	  "itemType":"다세대",
//	        	  "valueMin":76000000,
//	        	  "updDate":"2018-12-25",
//	        	  "id":8851878,
//	        	  "addr":"대전광역시 중구 태평동 342-5 청남빌라 가동 4층401호",
//	        	  "value":76000000,
//	        	  "auctionLoc":"제106호 법정",
//	        	  "remarks":""
//	          }
//	        ]
//	 }

}















