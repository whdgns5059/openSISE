package kr.co.opensise.admin.manage.datatrade.web;

import java.io.BufferedInputStream;
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
import kr.co.opensise.util.CommonUtil;


@Controller
@RequestMapping("/manage/dataTrade")
public class DataTradeController {
		
	private Logger log = LoggerFactory.getLogger(DataTradeController.class);
	
	@Resource(name="dataTradeService")
	private DataTradeServiceInf dataTradeService;
	
	private final String AT = "실거래 구분 : 아파트(매매)"; 
	private final String RT = "실거래 구분 : 연립다세대(매매)";
	private final String ST = "실거래 구분 : 단독다가구(매매)";
	private final String OT = "실거래 구분 : 오피스텔(매매)";
	private final String AR = "실거래 구분 : 아파트(전월세)";
	private final String RR = "실거래 구분 : 연립다세대(전월세)";
	private final String SR = "실거래 구분 : 단독다가구(전월세)";
	private final String OR = "실거래 구분 : 오피스텔(전월세)";
	private final String NT = "실거래 구분 : 상업/업무용";
	
	
//	1	아파트
//	2	단독
//	3	다가구
//	4	연립다세대
//	5	오피스텔
//	6	상업
	
	@RequestMapping("/dataTrade")
	public String dataTrade() {
		return "manage/dataTrade";
	}

	@RequestMapping("/insertData")
	public String insertData(@RequestPart("tradeData") MultipartFile part, 
							@RequestParam("dataType") String dataType
							,Model model) {
	
		try {
			
			//buffedinputStream으로 속도 상승
			BufferedInputStream bis = new BufferedInputStream(part.getInputStream());
		
			XSSFWorkbook wb = new XSSFWorkbook(bis);
			
			XSSFSheet sheet = wb.getSheetAt(0);
			
		
			//9번째 행에서 파일 구분 가져오기
			XSSFRow divisionRow = sheet.getRow(8);
			XSSFCell divisionCell = divisionRow.getCell(0);
			
			
			//1. 파일의 실거래 구분을 확인
			String division = divisionValidation(divisionCell);
		
			//행의 갯수
			int rows = sheet.getPhysicalNumberOfRows();
			
			//2. 반복문을 이용해  실거래 구분에 따라서 
			//셀에서 필요한 정보를 ArticleVo, DealVo에 각각담아야함 
			//담긴 리스트를 LIST에 담음
			List<ArticleVo> articleList = new ArrayList<>();
			List<DealVo> dealList = new ArrayList<>();
			
			for(int i = 17; i <= rows ; i++  ) {
				

				XSSFRow row = sheet.getRow(i);
				
				Map<String, Object> setVoMap = setVo(division, row);
				
				ArticleVo articleVo = (ArticleVo) setVoMap.get("articleVo");
				DealVo dealVo = (DealVo) setVoMap.get("dealVo");

				articleList.add(articleVo);
				dealList.add(dealVo);
				
				log.info("articleVo ==> {}", ((ArticleVo)setVoMap.get("articleVo")).toString());
				log.info("dealVo ==> {}", ((DealVo)setVoMap.get("dealVo")).toString());
				
			}
			
			//4. 담은 Vo들을 List에 담고 insert한다..
			int insertArticleListResult = 0;
			int insertDealListResult = 0;
			
			try {
				insertArticleListResult = dataTradeService.insertArticleList(articleList);
			} catch (Exception e) { }
			insertDealListResult = dataTradeService.insertDealList(dealList);
			
			
			
			
			
			model.addAttribute("insertArticleListResult", insertArticleListResult);
			model.addAttribute("insertDealListResult", insertDealListResult);
			
			
		} catch (Exception e) { 
			e.printStackTrace();
		}
		
		
		return "manage/dataTrade";
				
	}
	
	private Map<String, Object> setVo(String division, XSSFRow row) {
		
		ArticleVo articleVo = new ArticleVo();
		DealVo dealVo = new DealVo();
		Map<String, Object> setVoMap = new HashMap<>();
		
		if(division.equals(AT)){
			
			//주소 파싱
			String siGunGu = row.getCell(0).toString();
			String[] sigunguArr = splitSiGunGu(siGunGu);
			String zip = row.getCell(1).toString();

			//articleVo 넣기..
			//article의 주소 복합키
			articleVo.setArtcl_gu(sigunguArr[1]);
			articleVo.setArtcl_dong(sigunguArr[2]);
			articleVo.setArtcl_zip(zip);
						
			articleVo.setArtcl_bc(1);
			articleVo.setArtcl_complx(row.getCell(4).toString());
			articleVo.setArtcl_const_y(row.getCell(10).toString());
			articleVo.setArtcl_rd(row.getCell(11).toString());
			
			String rd_detail = row.getCell(2).toString() + row.getCell(3).toString();
			articleVo.setArtcl_rd_detail(rd_detail);
			
			//주소 - 좌표 변환
//			String location = siGunGu + " " + zip;
//			LatLng latlng = GeoCodingUtil.geoCoding(location);
//			articleVo.setArtcl_lat(String.valueOf(latlng.getLat().floatValue()));
//			articleVo.setArtcl_lng(String.valueOf(latlng.getLng().floatValue()));
			
			
			//dealVo 넣기..
			//주소 외래키 입력
			dealVo.setDl_gu(sigunguArr[1]);
			dealVo.setDl_dong(sigunguArr[2]);
			dealVo.setDl_zip(zip);
			
			dealVo.setDl_ty("매매");
			int price = CommonUtil.delComma(row.getCell(8).toString().trim());
			dealVo.setDl_price(price);
			
			float excv_area = Float.parseFloat(row.getCell(5).toString());
			dealVo.setDl_excv_area(excv_area);
			dealVo.setDl_flr(row.getCell(9).toString());
			dealVo.setDl_cont_ym(row.getCell(6).toString());
			dealVo.setDl_cont_d(row.getCell(7).toString());
			
			setVoMap.put("articleVo", articleVo);
			setVoMap.put("dealVo", dealVo);
			
		}
		
		return setVoMap;
	}

	private String divisionValidation(XSSFCell divisionCell) {
		
		String division = divisionCell.toString();
		String result = "";

		if(division.equals(AT)) {
			result = AT;
		}else if(division.equals(RT)) {
			result = RT;
		}else if(division.equals(ST)) {
			result = ST;
		}else if(division.equals(OT)) {
			result = OT;
		}else if(division.equals(AR)) {
			result = AR;
		}else if(division.equals(RR)) {
			result = RR; 
		}else if(division.equals(SR)) {
			result = SR ;
		}else if(division.equals(OR)) {
			result = OR;
		}else if(division.equals(NT)) {
			result = NT;
		}
		
		return result;
	}
	
	/*
	private Map<String, Integer> divisionCellIndex(XSSFCell divisionCell) {
		
		String division = divisionCell.toString();
	
		Map<String, Integer> cellIndexMap = new HashMap<>(); 
		
		//TODO : 지번이 **이면 안넣어도됨
		
		if(division.equals(AT)) {
			
			cellIndexMap.put("sigungu", 0);
			cellIndexMap.put("zip", 1);
			cellIndexMap.put("rd_detail_1", 2);
			cellIndexMap.put("rd_detail_2", 3);
			cellIndexMap.put("complx", 4);
			cellIndexMap.put("excv_area", 5);
			cellIndexMap.put("cont_ym", 6);
			cellIndexMap.put("cont_d", 7);
			cellIndexMap.put("price", 8);
			cellIndexMap.put("floor", 9);
			cellIndexMap.put("const_y", 10);
			cellIndexMap.put("rd", 11);
			
		}else if(division.equals(RT)) {
			
			cellIndexMap.put("sigungu", 0);
			cellIndexMap.put("zip", 1);
			cellIndexMap.put("rd_detail_1", 2);
			cellIndexMap.put("rd_detail_2", 3);
			cellIndexMap.put("nm", 4);
			cellIndexMap.put("excv_area", 5);
			cellIndexMap.put("cont_ym", 6);
			cellIndexMap.put("cont_d", 7);
			cellIndexMap.put("price", 8);
			cellIndexMap.put("floor", 9);
			cellIndexMap.put("const_y", 10);
			cellIndexMap.put("rd", 11);
			
		}else if(division.equals(ST)) {
			
			cellIndexMap.put("sigungu", 0);
			cellIndexMap.put("zip", 1);
			cellIndexMap.put("classf", 2);
			cellIndexMap.put("excv_area", 5);
			cellIndexMap.put("cont_ym", 6);
			cellIndexMap.put("cont_d", 7);
			cellIndexMap.put("price", 8);
			cellIndexMap.put("const_y", 9);
			cellIndexMap.put("rd", 10);
			
		}else if(division.equals(OT)) {
			
			cellIndexMap.put("sigungu", 0);
			cellIndexMap.put("zip", 1);
			cellIndexMap.put("rd_detail_1", 2);
			cellIndexMap.put("rd_detail_2", 3);
			cellIndexMap.put("complx", 4);
			cellIndexMap.put("excv_area", 5);
			cellIndexMap.put("cont_ym", 6);
			cellIndexMap.put("cont_d", 7);
			cellIndexMap.put("price", 8);
			cellIndexMap.put("floor", 9);
			cellIndexMap.put("const_y", 10);
			cellIndexMap.put("rd", 11);

		}else if(division.equals(AR)) {
			
			cellIndexMap.put("sigungu", 0);
			cellIndexMap.put("zip", 1);
			cellIndexMap.put("rd_detail_1", 2);
			cellIndexMap.put("rd_detail_2", 3);
			cellIndexMap.put("complx", 4);
			cellIndexMap.put("dl_ty", 5);
			cellIndexMap.put("excv_area", 6);
			cellIndexMap.put("cont_ym", 7);
			cellIndexMap.put("cont_d", 8);
			cellIndexMap.put("depos", 9);
			cellIndexMap.put("rnt", 10);
			cellIndexMap.put("floor", 11);
			cellIndexMap.put("const_y", 12);
			cellIndexMap.put("rd", 13);

		}else if(division.equals(RR)) {
			
			cellIndexMap.put("sigungu", 0);
			cellIndexMap.put("zip", 1);
			cellIndexMap.put("rd_detail_1", 2);
			cellIndexMap.put("rd_detail_2", 3);
			cellIndexMap.put("complx", 4);
			cellIndexMap.put("dl_ty", 5);
			cellIndexMap.put("excv_area", 6);
			cellIndexMap.put("cont_ym", 7);
			cellIndexMap.put("cont_d", 8);
			cellIndexMap.put("depos", 9);
			cellIndexMap.put("rnt", 10);
			cellIndexMap.put("floor", 11);
			cellIndexMap.put("const_y", 12);
			cellIndexMap.put("rd", 13);

		}else if(division.equals(SR)) {
			
			cellIndexMap.put("sigungu", 0);
			cellIndexMap.put("zip", 1);
			cellIndexMap.put("excv_area", 3);
			cellIndexMap.put("dl_ty", 4);
			cellIndexMap.put("cont_ym", 5);
			cellIndexMap.put("cont_d", 6);
			cellIndexMap.put("depos", 7);
			cellIndexMap.put("rnt", 8);
			cellIndexMap.put("const_y", 9);
			cellIndexMap.put("rd", 10);

		}else if(division.equals(OR)) {

			cellIndexMap.put("sigungu", 0);
			cellIndexMap.put("zip", 1);
			cellIndexMap.put("rd_detail_1", 2);
			cellIndexMap.put("rd_detail_2", 3);
			cellIndexMap.put("complx", 4);
			cellIndexMap.put("dl_ty", 5);
			cellIndexMap.put("excv_area", 6);
			cellIndexMap.put("cont_ym", 7);
			cellIndexMap.put("cont_d", 8);
			cellIndexMap.put("depos", 9);
			cellIndexMap.put("rnt", 10);
			cellIndexMap.put("floor", 11);
			cellIndexMap.put("const_y", 12);
			cellIndexMap.put("rd", 13);

		}else if(division.equals(NT)) {
			
			cellIndexMap.put("sigungu", 0);
			cellIndexMap.put("artcle_ty", 1);
			cellIndexMap.put("zip", 2);
			cellIndexMap.put("rd", 3);
			cellIndexMap.put("prps_pls", 4);
			cellIndexMap.put("mn_prps", 5);
			cellIndexMap.put("excv_area", 7);
			cellIndexMap.put("price", 9);
			cellIndexMap.put("floor", 10);
			cellIndexMap.put("cont_ym", 11);
			cellIndexMap.put("cont_d", 12);
			cellIndexMap.put("const_y", 13);

		}else {
			
			return null;

		}
		
		return cellIndexMap;

	}
	*/
	
	private String[] splitSiGunGu(String siGunGu) {
	
		String[] result = siGunGu.split(" ");
		
		return result;
	}
	
	
	
}




























