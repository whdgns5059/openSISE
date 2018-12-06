package kr.co.opensise.util;


import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.opensise.setup.RootSetup;

public class InsertAllDataTest extends RootSetup{

	private Logger log = LoggerFactory.getLogger(InsertAllDataTest.class);

	@Resource(name="insertAllData")
	private InsertAllData insertAllData;
	
	/*******************************************
	 * @throws IOException
	 * 실거래 데이터 전체 입력용 테스트 함수
	 * 해당경로 밑의 모든 실거래 데이터 엑셀 파일을 읽어 입력합니다.
	 ******************************************/
	@Test
	public void insertAllDataTest() throws IOException {
		/***given***/
		String root = "C:\\Users\\1003yd\\Desktop\\OpenSISE\\API\\실거래가 API\\2012";
		
		/***when***/
		Map<String, Integer> resultMap =insertAllData.insertAllDataTrade(root, 0, 0, 0);
	
		/***then***/
		log.info("******************************");
		log.info("totalArticleCnt >>> {}", resultMap.get("totalArticleCnt"));
		log.info("totalDealCnt >>> {}", resultMap.get("totalDealCnt"));
		log.info("totalCoordCnt >>> {}", resultMap.get("totalCoordCnt"));
		log.info("******************************");
	}
	
	

}
