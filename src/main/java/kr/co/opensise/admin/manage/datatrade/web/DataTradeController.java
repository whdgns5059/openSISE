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
	private final String NT = "실거래 구분 : 상업업무용(매매)";
	
	
	
	@RequestMapping("/dataTrade")
	public String dataTrade() {
		return "manage/dataTrade";
	}

	@RequestMapping("/insertData")
	public String insertData(@RequestPart("tradeData") MultipartFile part
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
		
		
		return "redirect:/manage/dataTrade/dataTrade";
				
	}
	
	
	
	/**
	 * @param division
	 * @param row
	 * @return Map<String, Obejct>
	 * articleVo, dealVo를 해당 row의 데이터를 division에 맞게 저장하는 로직이다.
	 * 아파트매매, 오피스텔 전월세 등의 데이터에 맞게 저장함
	 *
	 */
	private Map<String, Object> setVo(String division, XSSFRow row) {
		
		ArticleVo articleVo = new ArticleVo();
		DealVo dealVo = new DealVo();
		Map<String, Object> setVoMap = new HashMap<>();
		
		if(division.equals(AT)){
			//아파트(매매), 건물코드 apt
						
			//주소 파싱
			String siGunGu = row.getCell(0).toString();
			String[] sigunguArr = splitSiGunGu(siGunGu);
			String zip = row.getCell(1).toString();

			//articleVo 넣기..
			//article의 주소 복합키
			articleVo.setArtcl_gu(sigunguArr[1]);
			articleVo.setArtcl_dong(sigunguArr[2]);
			articleVo.setArtcl_zip(zip);
						
			articleVo.setArtcl_bc("apt");
			articleVo.setArtcl_complx(row.getCell(4).toString());
			articleVo.setArtcl_const_y(row.getCell(10).toString());
			articleVo.setArtcl_rd(row.getCell(11).toString());
			
			String rd_detail = row.getCell(2).toString() + " "+ row.getCell(3).toString();
			articleVo.setArtcl_rd_detail(rd_detail);
			

			//주소 - 좌표 변환
			String lat = "";
			String lng = "";
			try {
				Map<String, String> coordMap = CommonUtil.addr2Coord(siGunGu + " " + zip);
				
				lat = coordMap.get("lat");
				lng = coordMap.get("lng");
				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			articleVo.setArtcl_lat(lat);
			articleVo.setArtcl_lng(lng);
			
			
			
			//dealVo 넣기..
			//주소 외래키 입력
			dealVo.setDl_gu(sigunguArr[1]);
			dealVo.setDl_dong(sigunguArr[2]);
			dealVo.setDl_zip(zip);
			
			dealVo.setDl_ty("매매");
			double price = CommonUtil.delComma(row.getCell(8).toString().trim());
			dealVo.setDl_price(price);
			
			float excv_area = Float.parseFloat(row.getCell(5).toString());
			dealVo.setDl_excv_area(excv_area);
			dealVo.setDl_flr(row.getCell(9).toString());
			dealVo.setDl_cont_ym(row.getCell(6).toString());
			dealVo.setDl_cont_d(row.getCell(7).toString());
			
			setVoMap.put("articleVo", articleVo);
			setVoMap.put("dealVo", dealVo);
			
		}else if(division.equals(RT)) {
			//연립다세대(매매) 건물코드 multip
			
			//주소 파싱
			String siGunGu = row.getCell(0).toString();
			String[] sigunguArr = splitSiGunGu(siGunGu);
			String zip = row.getCell(1).toString();

			//articleVo 넣기..
			//article의 주소 복합키
			articleVo.setArtcl_gu(sigunguArr[1]);
			articleVo.setArtcl_dong(sigunguArr[2]);
			articleVo.setArtcl_zip(zip);
						
			articleVo.setArtcl_bc("multip");
			articleVo.setArtcl_nm(row.getCell(4).toString());
			articleVo.setArtcl_const_y(row.getCell(11).toString());
			articleVo.setArtcl_rd(row.getCell(12).toString());
			
			String rd_detail = row.getCell(2).toString() + " " + row.getCell(3).toString();
			articleVo.setArtcl_rd_detail(rd_detail);
			
			//주소 - 좌표 변환
			String lat = "";
			String lng = "";
			try {
				Map<String, String> coordMap = CommonUtil.addr2Coord(siGunGu + " " + zip);
				
				lat = coordMap.get("lat");
				lng = coordMap.get("lng");
				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			articleVo.setArtcl_lat(lat);
			articleVo.setArtcl_lng(lng);
			
			
			//dealVo 넣기..
			//주소 외래키 입력
			dealVo.setDl_gu(sigunguArr[1]);
			dealVo.setDl_dong(sigunguArr[2]);
			dealVo.setDl_zip(zip);
			
			//거래구분 수동입력
			dealVo.setDl_ty("매매");
			double price = CommonUtil.delComma(row.getCell(9).toString().trim());
			dealVo.setDl_price(price);
			
			float excv_area = Float.parseFloat(row.getCell(5).toString());
			dealVo.setDl_excv_area(excv_area);
			dealVo.setDl_flr(row.getCell(10).toString());
			dealVo.setDl_cont_ym(row.getCell(7).toString());
			dealVo.setDl_cont_d(row.getCell(8).toString());
			
			setVoMap.put("articleVo", articleVo);
			setVoMap.put("dealVo", dealVo);
			
			
		}else if(division.equals(ST)) {
			//단독다가구(매매) 건물코드 단독2, 다가구3

			//주소 파싱
			String siGunGu = row.getCell(0).toString();
			String[] sigunguArr = splitSiGunGu(siGunGu);
			String zip = row.getCell(1).toString();
			
			//articleVo 넣기..
			//article의 주소 복합키
			articleVo.setArtcl_gu(sigunguArr[1]);
			articleVo.setArtcl_dong(sigunguArr[2]);
			articleVo.setArtcl_zip(zip);
			
			String articl_bc = row.getCell(2).toString().equals("단독") ? "single" : "multi";
			articleVo.setArtcl_bc(articl_bc);
			articleVo.setArtcl_const_y(row.getCell(9).toString());
			articleVo.setArtcl_rd(row.getCell(10).toString());
			
			//주소 - 좌표 변환(동까지만 변환)
			String lat = "";
			String lng = "";
			try {
				Map<String, String> coordMap = CommonUtil.addr2Coord(siGunGu);
				
				lat = coordMap.get("lat");
				lng = coordMap.get("lng");
				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			articleVo.setArtcl_lat(lat);
			articleVo.setArtcl_lng(lng);
			
			//dealVo 넣기
			//dealVo의 외래키
			dealVo.setDl_gu(sigunguArr[1]);
			dealVo.setDl_dong(sigunguArr[2]);
			dealVo.setDl_zip(zip);
			
			//거래구분 수동입력 
			dealVo.setDl_ty("매매");
			double price = CommonUtil.delComma(row.getCell(8).toString().trim());
			dealVo.setDl_price(price);
			
			float excv_area = Float.parseFloat(row.getCell(5).toString());
			dealVo.setDl_excv_area(excv_area);
			dealVo.setDl_cont_ym(row.getCell(6).toString());
			dealVo.setDl_cont_d(row.getCell(7).toString());
			
			setVoMap.put("articleVo", articleVo);
			setVoMap.put("dealVo", dealVo);
			
			
			
		}else if(division.equals(OT)) {
			//오피스텔(매매) 건물코드 office
			
			//주소 파싱
			String siGunGu = row.getCell(0).toString();
			String[] sigunguArr = splitSiGunGu(siGunGu);
			String zip = row.getCell(1).toString();

			//articleVo 넣기..
			//article의 주소 복합키
			articleVo.setArtcl_gu(sigunguArr[1]);
			articleVo.setArtcl_dong(sigunguArr[2]);
			articleVo.setArtcl_zip(zip);
						
			articleVo.setArtcl_bc("office");
			articleVo.setArtcl_complx(row.getCell(4).toString());
			articleVo.setArtcl_const_y(row.getCell(10).toString());
			articleVo.setArtcl_rd(row.getCell(11).toString());
			
			String rd_detail = row.getCell(2).toString() + " "+ row.getCell(3).toString();
			articleVo.setArtcl_rd_detail(rd_detail);
			
			//주소 - 좌표 변환
			String lat = "";
			String lng = "";
			try {
				Map<String, String> coordMap = CommonUtil.addr2Coord(siGunGu + " " + zip);
				
				lat = coordMap.get("lat");
				lng = coordMap.get("lng");
				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			articleVo.setArtcl_lat(lat);
			articleVo.setArtcl_lng(lng);
			
			
			//dealVo 넣기..
			//주소 외래키 입력
			dealVo.setDl_gu(sigunguArr[1]);
			dealVo.setDl_dong(sigunguArr[2]);
			dealVo.setDl_zip(zip);
			
			dealVo.setDl_ty("매매");
			double price = CommonUtil.delComma(row.getCell(8).toString().trim());
			dealVo.setDl_price(price);
			
			float excv_area = Float.parseFloat(row.getCell(5).toString());
			dealVo.setDl_excv_area(excv_area);
			dealVo.setDl_flr(row.getCell(9).toString());
			dealVo.setDl_cont_ym(row.getCell(6).toString());
			dealVo.setDl_cont_d(row.getCell(7).toString());
			
			setVoMap.put("articleVo", articleVo);
			setVoMap.put("dealVo", dealVo);
			
		}else if(division.equals(AR)) {
			//아파트(전월세) 건물코드 apt
			
			//주소 파싱
			String siGunGu = row.getCell(0).toString();
			String[] sigunguArr = splitSiGunGu(siGunGu);
			String zip = row.getCell(1).toString();

			//articleVo 넣기..
			//article의 주소 복합키
			articleVo.setArtcl_gu(sigunguArr[1]);
			articleVo.setArtcl_dong(sigunguArr[2]);
			articleVo.setArtcl_zip(zip);
			
			//도로명 주소
			articleVo.setArtcl_rd(row.getCell(13).toString());
			String rd_detail = row.getCell(2).toString() + " " + row.getCell(3).toString();
			articleVo.setArtcl_rd_detail(rd_detail);
			
			//건물유형코드, 단지명, 건축년도
			articleVo.setArtcl_bc("apt");
			articleVo.setArtcl_complx(row.getCell(4).toString());
			articleVo.setArtcl_const_y(row.getCell(12).toString());
			
			//주소 - 좌표 변환
			String lat = "";
			String lng = "";
			try {
				Map<String, String> coordMap = CommonUtil.addr2Coord(siGunGu + " " + zip);
				
				lat = coordMap.get("lat");
				lng = coordMap.get("lng");
				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			articleVo.setArtcl_lat(lat);
			articleVo.setArtcl_lng(lng);
			
			//dealVo
			//주소 외래키
			dealVo.setDl_gu(sigunguArr[1]);
			dealVo.setDl_dong(sigunguArr[2]);
			dealVo.setDl_zip(zip);
			
			//거래유형, 보증금, 월세, 계약년월, 계약일
			dealVo.setDl_ty(row.getCell(5).toString());
			
			double depo = CommonUtil.delComma(row.getCell(9).toString());
			double rnt = CommonUtil.delComma(row.getCell(10).toString());
			dealVo.setDl_depos(depo);
			dealVo.setDl_rnt(rnt);
			dealVo.setDl_cont_ym(row.getCell(7).toString());
			dealVo.setDl_cont_d(row.getCell(8).toString());
			
			//층, 전용면적
			dealVo.setDl_flr(row.getCell(11).toString());
			float excv_area = Float.parseFloat(row.getCell(6).toString());
			dealVo.setDl_excv_area(excv_area);
			
			setVoMap.put("articleVo", articleVo);
			setVoMap.put("dealVo", dealVo);
			
		}else if(division.equals(RR)) {
			//연립다세대(전월세) 건물코드 multip
			
			//주소 파싱
			String siGunGu = row.getCell(0).toString();
			String[] sigunguArr = splitSiGunGu(siGunGu);
			String zip = row.getCell(1).toString();

			//articleVo 넣기..
			//article의 주소 복합키
			articleVo.setArtcl_gu(sigunguArr[1]);
			articleVo.setArtcl_dong(sigunguArr[2]);
			articleVo.setArtcl_zip(zip);
			
			//도로명 주소
			articleVo.setArtcl_rd(row.getCell(13).toString());
			String rd_detail = row.getCell(2).toString() + " " + row.getCell(3).toString();
			articleVo.setArtcl_rd_detail(rd_detail);
			
			//건물유형코드, 단지명, 건축년도
			articleVo.setArtcl_bc("multip");
			articleVo.setArtcl_nm(row.getCell(4).toString());
			articleVo.setArtcl_const_y(row.getCell(12).toString());
			
			//주소 - 좌표 변환
			String lat = "";
			String lng = "";
			try {
				Map<String, String> coordMap = CommonUtil.addr2Coord(siGunGu + " " + zip);
				
				lat = coordMap.get("lat");
				lng = coordMap.get("lng");
				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			articleVo.setArtcl_lat(lat);
			articleVo.setArtcl_lng(lng);
			
			//dealVo
			//주소 외래키
			dealVo.setDl_gu(sigunguArr[1]);
			dealVo.setDl_dong(sigunguArr[2]);
			dealVo.setDl_zip(zip);
			
			//거래유형, 보증금, 월세, 계약년월, 계약일
			dealVo.setDl_ty(row.getCell(5).toString());
			
			double depo = CommonUtil.delComma(row.getCell(9).toString());
			double rnt = CommonUtil.delComma(row.getCell(10).toString());
			dealVo.setDl_depos(depo);
			dealVo.setDl_rnt(rnt);
			dealVo.setDl_cont_ym(row.getCell(7).toString());
			dealVo.setDl_cont_d(row.getCell(8).toString());
			
			//층, 전용면적
			dealVo.setDl_flr(row.getCell(11).toString());
			float excv_area = Float.parseFloat(row.getCell(6).toString());
			dealVo.setDl_excv_area(excv_area);
			
			setVoMap.put("articleVo", articleVo);
			setVoMap.put("dealVo", dealVo);


		}else if(division.equals(SR)) {
			//단독다가구(전월세) 건물코드 다가구 multip
			
			//주소 파싱
			String siGunGu = row.getCell(0).toString();
			String[] sigunguArr = splitSiGunGu(siGunGu);
			String zip = row.getCell(1).toString();

			//articleVo 넣기..
			//article의 주소 복합키
			articleVo.setArtcl_gu(sigunguArr[1]);
			articleVo.setArtcl_dong(sigunguArr[2]);
			articleVo.setArtcl_zip(zip);
			
			//도로명 주소
			articleVo.setArtcl_rd(row.getCell(10).toString());
			
			//건물유형코드, 건축년도
			articleVo.setArtcl_bc("multi");
			articleVo.setArtcl_const_y(row.getCell(9).toString());
			
			//주소 - 좌표 변환(동까지만 변환)
			String lat = "";
			String lng = "";
			try {
				Map<String, String> coordMap = CommonUtil.addr2Coord(siGunGu);
				
				lat = coordMap.get("lat");
				lng = coordMap.get("lng");
				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			articleVo.setArtcl_lat(lat);
			articleVo.setArtcl_lng(lng);
			
			//dealVo
			//주소 외래키
			dealVo.setDl_gu(sigunguArr[1]);
			dealVo.setDl_dong(sigunguArr[2]);
			dealVo.setDl_zip(zip);
			
			//거래유형, 보증금, 월세, 계약년월, 계약일
			dealVo.setDl_ty(row.getCell(4).toString());
			
			double depo = CommonUtil.delComma(row.getCell(7).toString());
			double rnt = CommonUtil.delComma(row.getCell(8).toString());
			dealVo.setDl_depos(depo);
			dealVo.setDl_rnt(rnt);
			dealVo.setDl_cont_ym(row.getCell(5).toString());
			dealVo.setDl_cont_d(row.getCell(6).toString());
			
			//전용면적
			float excv_area = Float.parseFloat(row.getCell(3).toString());
			dealVo.setDl_excv_area(excv_area);
			
			setVoMap.put("articleVo", articleVo);
			setVoMap.put("dealVo", dealVo);
			
		}else if(division.equals(OR)) {
			//오피스텔(전월세) 건물코드 office
			
			//주소 파싱
			String siGunGu = row.getCell(0).toString();
			String[] sigunguArr = splitSiGunGu(siGunGu);
			String zip = row.getCell(1).toString();

			//articleVo 넣기..
			//article의 주소 복합키
			articleVo.setArtcl_gu(sigunguArr[1]);
			articleVo.setArtcl_dong(sigunguArr[2]);
			articleVo.setArtcl_zip(zip);
			
			//도로명 주소
			articleVo.setArtcl_rd(row.getCell(13).toString());
			String rd_detail = row.getCell(2).toString() + " " + row.getCell(3).toString();
			articleVo.setArtcl_rd_detail(rd_detail);
			
			//건물유형코드, 단지명, 건축년도
			articleVo.setArtcl_bc("office");
			articleVo.setArtcl_complx(row.getCell(4).toString());
			articleVo.setArtcl_const_y(row.getCell(12).toString());
			
			//주소 - 좌표 변환
			String lat = "";
			String lng = "";
			try {
				Map<String, String> coordMap = CommonUtil.addr2Coord(siGunGu + " " + zip);
				
				lat = coordMap.get("lat");
				lng = coordMap.get("lng");
				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			articleVo.setArtcl_lat(lat);
			articleVo.setArtcl_lng(lng);
			
			//dealVo
			//주소 외래키
			dealVo.setDl_gu(sigunguArr[1]);
			dealVo.setDl_dong(sigunguArr[2]);
			dealVo.setDl_zip(zip);
			
			//거래유형, 보증금, 월세, 계약년월, 계약일
			dealVo.setDl_ty(row.getCell(5).toString());
			
			double depo = CommonUtil.delComma(row.getCell(9).toString());
			double rnt = CommonUtil.delComma(row.getCell(10).toString());
			dealVo.setDl_depos(depo);
			dealVo.setDl_rnt(rnt);
			dealVo.setDl_cont_ym(row.getCell(7).toString());
			dealVo.setDl_cont_d(row.getCell(8).toString());
			
			//층, 전용면적
			dealVo.setDl_flr(row.getCell(11).toString());
			float excv_area = Float.parseFloat(row.getCell(6).toString());
			dealVo.setDl_excv_area(excv_area);
			
			setVoMap.put("articleVo", articleVo);
			setVoMap.put("dealVo", dealVo);

		}else if(division.equals(NT)) {
			//상가 건물코드 6
			
			//주소 파싱
			String siGunGu = row.getCell(0).toString();
			String[] sigunguArr = splitSiGunGu(siGunGu);
			String zip = row.getCell(2).toString();

			//articleVo 넣기..
			//article의 주소 복합키
			articleVo.setArtcl_gu(sigunguArr[1]);
			articleVo.setArtcl_dong(sigunguArr[2]);
			articleVo.setArtcl_zip(zip);
			
			//도로명 주소
			articleVo.setArtcl_rd(row.getCell(3).toString());
			
			//건물 코드, 유형, 용도지역, 주용도,
			articleVo.setArtcl_bc("store");
			articleVo.setArtcl_ty(row.getCell(1).toString());
			articleVo.setArtcl_prps_pls(row.getCell(5).toString());
			articleVo.setArtcl_mn_prps(row.getCell(4).toString());
			
			//건축년도
			articleVo.setArtcl_const_y(row.getCell(11).toString());
			
			//주소 - 좌표 변환(동까지만 변환)
			String lat = "";
			String lng = "";
			try {
				Map<String, String> coordMap = CommonUtil.addr2Coord(siGunGu);
				
				lat = coordMap.get("lat");
				lng = coordMap.get("lng");
				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			articleVo.setArtcl_lat(lat);
			articleVo.setArtcl_lng(lng);
			
			//dealVO
			//주소 외래키
			dealVo.setDl_gu(sigunguArr[1]);
			dealVo.setDl_dong(sigunguArr[2]);
			dealVo.setDl_zip(zip);
			
			//거래유형(매매), 거래금액, 계약년월, 계약일
			dealVo.setDl_ty("매매");
			double price = CommonUtil.delComma(row.getCell(9).toString());
			dealVo.setDl_price(price);
			dealVo.setDl_cont_ym(row.getCell(11).toString());
			dealVo.setDl_cont_d(row.getCell(12).toString());
			
			//층, 전용면적
			dealVo.setDl_flr(row.getCell(10).toString());
			float excv_area = Float.parseFloat(row.getCell(7).toString());
			dealVo.setDl_excv_area(excv_area);
			
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

	
	private String[] splitSiGunGu(String siGunGu) {
	
		String[] result = siGunGu.split(" ");
		
		return result;
	}
	
	
	
}




























