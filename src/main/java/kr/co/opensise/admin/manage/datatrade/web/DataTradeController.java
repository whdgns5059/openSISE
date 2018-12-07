package kr.co.opensise.admin.manage.datatrade.web;

import java.io.BufferedInputStream;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.google.code.geocoder.model.LatLng;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
import kr.co.opensise.admin.manage.datatrade.service.DataTradeServiceInf;
import kr.co.opensise.admin.manage.datatrade.util.DataTradeControllerUtil;
import kr.co.opensise.util.CommonUtil;


@Controller
@RequestMapping("/manage/dataTrade")
public class DataTradeController {
		
	private Logger log = LoggerFactory.getLogger(DataTradeController.class);
	
	@Resource(name="dataTradeService")
	private DataTradeServiceInf dataTradeService;
	

	
	
	
	@RequestMapping("/dataTrade")
	public String dataTrade() {
		return "manage/dataTrade";
	}

	@RequestMapping("/insertData")
	public String insertData(@RequestPart("tradeData") MultipartFile part
			,Model model) {
		int totalArticleVoResult = 0;
		int totalDealVoResult = 0;
		
		try {
			
			//buffedinputStream으로 속도 상승
			BufferedInputStream bis = new BufferedInputStream(part.getInputStream());
		
			XSSFWorkbook wb = new XSSFWorkbook(bis);
			XSSFSheet sheet = wb.getSheetAt(0);
			
			//9번째 행에서 파일 구분 가져오기
			XSSFRow divisionRow = sheet.getRow(8);
			XSSFCell divisionCell = divisionRow.getCell(0);
			
			//1. 파일의 실거래 구분을 확인
			String division = divisionCell.toString();
		
			//행의 갯수
			int rows = sheet.getPhysicalNumberOfRows();
			
			//2. 반복문을 이용해  실거래 구분에 따라서 
			//셀에서 필요한 정보를 ArticleVo, DealVo에 각각담아야함 
			//담긴 리스트를 LIST에 담음
			List<ArticleVo> articleList = new ArrayList<>();
			List<DealVo> dealList = new ArrayList<>();
			
			for(int i = 17; i <= rows ; i++  ) {

				XSSFRow row = sheet.getRow(i);
				
				DataTradeControllerUtil dataUtil = new DataTradeControllerUtil();

				Map<String, Object> setVoMap = dataUtil.setVoMap(division, row);
				
				ArticleVo articleVo = (ArticleVo) setVoMap.get("articleVo");
				DealVo dealVo = (DealVo) setVoMap.get("dealVo");
				
				//도로명이 null이 아닌것만 리스트에 넣음
				if(articleVo.getArtcl_rd() != null && articleVo != null) {

					articleList.add(articleVo);
					dealList.add(dealVo);
					
					log.info("articleVo ==> {}", ((ArticleVo)setVoMap.get("articleVo")).toString());
					log.info("dealVo ==> {}", ((DealVo)setVoMap.get("dealVo")).toString());

				}
				
			}
			
			//4. 담은 Vo들을 List에 담고 insert한다..
			int insertArticleListResult = dataTradeService.insertArticleList(articleList);
			int insertDealListResult = dataTradeService.insertDealList(dealList);
			
			totalArticleVoResult += insertArticleListResult;
			totalDealVoResult += insertDealListResult;
			
			log.info("insertResultArticleVo >>> {}", insertArticleListResult);
			log.info("insertResultDealVo    >>> {}", insertDealListResult);
			
			wb.close();
			bis.close();
			
			
		} catch (Exception e) { 
			e.printStackTrace();
		}
		
		
		log.info("**********************************");
		log.info(">> 좌표 입력하기 << ");
		log.info("**********************************");
		//모든 실거래 인서트를 마치고 좌표가 null인 
		//주소들만 가져와서 좌표를 입력해 준다
		
		//1. 좌표가 없는 article list 가져오기
		List<ArticleVo> coordNullArticleList = dataTradeService.selectCoordNullArticle();
		int updateCoordResult = 0;
		//2. 해당 리스트에 좌표 입력
		for(ArticleVo articleVo : coordNullArticleList) {
			
			DataTradeControllerUtil dataUtil= new DataTradeControllerUtil();
			
			String location = dataUtil.getLocation(articleVo);
		
			String lat = "";
			String lng = "";
			
			log.info("location >>>>>>> {} ", location);
			
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
			updateCoordResult += dataTradeService.updataLatLngArticle(articleVo);
			
		}
		
		log.info("updateCoordResult >>> {}", updateCoordResult);
		
		return "redirect:/manage/dataTrade/dataTrade";
				
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}




























