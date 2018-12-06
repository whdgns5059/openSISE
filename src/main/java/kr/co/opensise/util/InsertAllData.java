package kr.co.opensise.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import kr.co.opensise.admin.manage.datatrade.dao.DataTradeDaoInf;
import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
import kr.co.opensise.admin.manage.datatrade.service.DataTradeServiceInf;
import kr.co.opensise.admin.manage.datatrade.util.DataTradeControllerUtil;

@Service
public class InsertAllData{

	private Logger log = LoggerFactory.getLogger(InsertAllData.class);
	
	private final String AT = "실거래 구분 : 아파트(매매)"; 
	private final String RT = "실거래 구분 : 연립다세대(매매)";
	private final String ST = "실거래 구분 : 단독다가구(매매)";
	private final String OT = "실거래 구분 : 오피스텔(매매)";
	private final String AR = "실거래 구분 : 아파트(전월세)";
	private final String RR = "실거래 구분 : 연립다세대(전월세)";
	private final String SR = "실거래 구분 : 단독다가구(전월세)";
	private final String OR = "실거래 구분 : 오피스텔(전월세)";
	private final String NT = "실거래 구분 : 상업업무용(매매)";
	
	@Resource(name="dataTradeDao")
	private DataTradeDaoInf dataTradeDao;
	
	/*******************************************
	 * 해당 폴더 밑의 모든 실거래 데이터를 읽어 DB에 입력하는 로직
	 * 데이터 분량에 따라 시간이 오래걸림 1000건에 1분 내외
	 * @throws IOException 
	 ******************************************/
	public void insertAllDataTrade(String root) throws IOException {
		
		File directory = new File(root);
		
		File[] listOfFile = directory.listFiles();
		
		for(File file : listOfFile) {
			
			if(file.isDirectory()) {
				
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e1) {
					e1.printStackTrace();
				}
				log.info("***************************************************");
				log.info("IsDirectory! read >> {}", file.getCanonicalPath().toString());
				log.info("***************************************************");
				
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e1) {
					e1.printStackTrace();
				}	
				
				try {
					insertAllDataTrade(file.getCanonicalPath().toString());

				} catch (IOException e) {
					e.printStackTrace();
				}
				


			} else if ( file.isFile()) {
				
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e1) {
					e1.printStackTrace();
				}
				
				log.info("***************************************************");
				log.info("isFile! read >> {} ", file.getName());
				log.info("***************************************************");
				
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e1) {
					e1.printStackTrace();
				}
				
				FileInputStream fis = new FileInputStream(file);
				BufferedInputStream bis = new BufferedInputStream(fis);
				
				XSSFWorkbook wb = new XSSFWorkbook(bis);
				XSSFSheet sheet = wb.getSheetAt(0);
				
				//9번째 행에서 파일 구분 가져오기
				XSSFRow divisionRow = sheet.getRow(8);
				XSSFCell divisionCell = divisionRow.getCell(0);
				String division = divisionCell.toString();
				//1. 파일의 실거래 구분을 확인
			
				//행의 갯수
				int rows = sheet.getPhysicalNumberOfRows();
				
				//2. 반복문을 이용해  실거래 구분에 따라서 
				//셀에서 필요한 정보를 ArticleVo, DealVo에 각각담아야함 
				//담긴 리스트를 LIST에 담음
				List<ArticleVo> articleList = new ArrayList<>();
				List<DealVo> dealList = new ArrayList<>();
				
				for(int i = 17; i <= rows ; i++  ) {
					

					XSSFRow row = sheet.getRow(i);
					
					Map<String, Object> setVoMap = null;
					
					if(division.equals(AT)) {
						setVoMap = DataTradeControllerUtil.setVo(row, 0, 1, 11, 2, 3, 4, -1, 10, "apt", -1,	-1, -1, -1, 8, -1, -1, 5, 9, 6, 7);
					}else if(division.equals(RT)) {
						setVoMap = DataTradeControllerUtil.setVo(row, 0, 1, 12, 2, 3, -1, 4, 11, "multip", -1, -1, -1, -1,9, -1, -1, 5, 10, 7, 8);
					}else if(division.equals(ST)) {
						setVoMap = DataTradeControllerUtil.setVo(row, 0, -1, 10, -1, -1, -1, -1, 9, "single", -1, -1, -1, -1,8, -1, -1, 4, -1, 6, 7);
					}else if(division.equals(OT)) {
						setVoMap = DataTradeControllerUtil.setVo(row, 0, 1, 11, 2, 3, 4, -1, 10, "office", -1,	-1, -1, -1, 8, -1, -1, 5, 9, 6, 7);
					}else if(division.equals(AR)) {
						setVoMap = DataTradeControllerUtil.setVo(row, 0, 1, 13, 2, 3, 4, -1, 12, "apt", -1, -1, -1, 5, -1, 9, 10, 6, 11, 7, 8);
					}else if(division.equals(RR)) {
						setVoMap = DataTradeControllerUtil.setVo(row, 0, 1, 13, 2, 3, -1, 4, 12, "multip", -1, -1, -1, 5, -1, 9, 10, 6, 11, 7, 8);
					}else if(division.equals(SR)) {
						setVoMap = DataTradeControllerUtil.setVo(row, 0, -1, 10, -1, -1, -1, -1, 9, "single", -1, -1, -1, 4, -1, 7, 8, 3, -1, 5, 6);
					}else if(division.equals(OR)) {
						setVoMap = DataTradeControllerUtil.setVo(row, 0, 1, 13, 2, 3, 4, -1, 12, "apt", -1, -1, -1, 5, -1, 9, 10, 6, 11, 7, 8);
					}else if(division.equals(NT)) {
						setVoMap = DataTradeControllerUtil.setVo(row, 0, -1, 3, -1, -1, -1, -1, 14, "store", 4, 5, 1, -1, 9, -1, -1, 7, 10, 11, 12);
					}
					
										
					if(setVoMap != null) {
						ArticleVo articleVo = (ArticleVo) setVoMap.get("articleVo");
						DealVo dealVo = (DealVo) setVoMap.get("dealVo");
						
						articleList.add(articleVo);
						dealList.add(dealVo);
						
						log.info("articleVo ==> {}", ((ArticleVo)setVoMap.get("articleVo")).toString());
						log.info("dealVo ==> {}", ((DealVo)setVoMap.get("dealVo")).toString());
					}
					
				}
				
				//4. 담은 Vo들을 List에 담고 insert한다..
				int insertArticleListResult = 0;
				int insertDealListResult = 0;
				
				insertArticleListResult = dataTradeDao.insertArticleList(articleList);
				insertDealListResult = dataTradeDao.insertDealList(dealList);
				
				
				
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e1) {
					e1.printStackTrace();
				}		
				log.info("***************************************************");
				log.info("insertArticle ::: {}", insertArticleListResult);
				log.info("insertDeal ::: {}", insertDealListResult);
				log.info("***************************************************");
				
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e1) {
					e1.printStackTrace();
				}		
				
				
			}
			
			log.info("**********************************");
			log.info(">> 좌표 입력하기 << ");
			log.info("**********************************");
			//모든 실거래 인서트를 마치고 좌표가 null인 
			//주소들만 가져와서 좌표를 입력해 준다
			
			//1. 좌표가 없는 article list 가져오기
			List<ArticleVo> coordNullArticleList = dataTradeDao.selectCoordNullArticle();
			
			//2. 해당 리스트에 좌표 입력
			for(ArticleVo articleVo : coordNullArticleList) {
				
				String location = DataTradeControllerUtil.getLocation(articleVo);
			
				String lat = "";
				String lng = "";

				try {

					Map<String, String> latlngMap = CommonUtil.addr2Coord(location);
					lat = latlngMap.get("lat");
					lng = latlngMap.get("lng");

				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				
				articleVo.setArtcl_lat(lat);
				articleVo.setArtcl_lng(lng);
				
				log.info("좌표변경 : {}", articleVo.toString());
				
				//3. 좌표 업데이트. 
				dataTradeDao.updataLatLngArticle(articleVo);
				
				
			}
		}
		
		log.info("***************************************");
		log.info("              종료!!");
		log.info("***************************************");
		
		
		
	}
		
	
}
