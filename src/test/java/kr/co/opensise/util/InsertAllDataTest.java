package kr.co.opensise.util;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Ignore;
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
	@Ignore
	public void insertAllDataTest() throws IOException {
		
		/***given***/
		/*
		String root = "C:\\Users\\nlbo\\Desktop\\실거래가\\201401";
		/*/
		String root = "D:\\A_TeachingMaterial\\7.LastProject\\TradeInfo\\누락";
		//*/
		
		/***when***/
		List<String> sidoWrongList = new ArrayList<>();
		sidoWrongList.addAll(insertAllData.insertAllDataTrade(root, sidoWrongList));
		
		
		log.info("******************************");
		log.info("시도구분이 틀린파일");
		log.info("******************************");
		
		for(String str : sidoWrongList) {
			log.info("{}", str);
		}
	
		/***then***/
		log.info("******************************");
		log.info("끝끝끝");
		log.info("끝끝끝");
		log.info("끝끝끝");
		log.info("******************************");
	}

}
