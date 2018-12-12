package kr.co.opensise.admin.manage.datatrade.util;

import java.util.HashMap;
import java.util.Map;

import org.apache.poi.xssf.usermodel.XSSFRow;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
import kr.co.opensise.util.CommonUtil;

public class DataTradeControllerUtil {
	
	private final String AT = "실거래 구분 : 아파트(매매)"; 
	private final String RT = "실거래 구분 : 연립다세대(매매)";
	private final String ST = "실거래 구분 : 단독다가구(매매)";
	private final String OT = "실거래 구분 : 오피스텔(매매)";
	private final String AR = "실거래 구분 : 아파트(전월세)";
	private final String RR = "실거래 구분 : 연립다세대(전월세)";
	private final String SR = "실거래 구분 : 단독다가구(전월세)";
	private final String OR = "실거래 구분 : 오피스텔(전월세)";
	private final String NT = "실거래 구분 : 상업업무용(매매)";

	
	
	public Map<String, Object> setVoMap(String division, XSSFRow row) {
		
		 Map<String, Object> setVoMap = null;
		
		if(division.equals(AT)) {
			setVoMap = setVo(row, 0, 1, 11, 2, 3, 4, -1, 10, "apt", -1,	-1, -1, -1, 8, -1, -1, 5, 9, 6, 7);
		}else if(division.equals(RT)) {
			setVoMap = setVo(row, 0, 1, 12, 2, 3, -1, 4, 11, "multip", -1, -1, -1, -1,9, -1, -1, 5, 10, 7, 8);
		}else if(division.equals(ST)) {
			setVoMap = setVo(row, 0, -1, 10, -1, -1, -1, -1, 9, "single", -1, -1, -1, -1,8, -1, -1, 4, -1, 6, 7);
		}else if(division.equals(OT)) {
			setVoMap = setVo(row, 0, 1, 11, 2, 3, 4, -1, 10, "office", -1,	-1, -1, -1, 8, -1, -1, 5, 9, 6, 7);
		}else if(division.equals(AR)) {
			setVoMap = setVo(row, 0, 1, 13, 2, 3, 4, -1, 12, "apt", -1, -1, -1, 5, -1, 9, 10, 6, 11, 7, 8);
		}else if(division.equals(RR)) {
			setVoMap = setVo(row, 0, 1, 13, 2, 3, -1, 4, 12, "multip", -1, -1, -1, 5, -1, 9, 10, 6, 11, 7, 8);
		}else if(division.equals(SR)) {
			setVoMap = setVo(row, 0, -1, 10, -1, -1, -1, -1, 9, "single", -1, -1, -1, 4, -1, 7, 8, 3, -1, 5, 6);
		}else if(division.equals(OR)) {
			setVoMap = setVo(row, 0, 1, 13, 2, 3, 4, -1, 12, "apt", -1, -1, -1, 5, -1, 9, 10, 6, 11, 7, 8);
		}else if(division.equals(NT)) {
			setVoMap = setVo(row, 0, -1, 3, -1, -1, -1, -1, 14, "store", 4, 5, 1, -1, 9, -1, -1, 7, 10, 11, 12);
		}else {
			return null;
		}
		return setVoMap;
	}
	
	
	/*******************************************
	 * @param row 엑셀의 row
	 * @param ar_sigungu 시군구
	 * @param ar_zip 지번
	 * @param ar_rd 도로명
	 * @param ar_rd_detail1 도로명상세1
	 * @param ar_rd_detail2 도로명상세2
	 * @param ar_complex 단지명
	 * @param ar_nm 건물명
	 * @param ar_const_y 건축년도
	 * @param ar_bc 건물 분류
	 * @param ar_prps_pls 용도지역
	 * @param ar_mn_prps 주용도
	 * @param ar_build_ty 건물유형(상가)
	 * @param dl_ty 거래유형
	 * @param dl_price 매매가
	 * @param dl_depos 보증금
	 * @param dl_rnt 월세
	 * @param dl_excv_area 전용면적
	 * @param dl_flr 층
	 * @param dl_cont_ym 계약년월
	 * @param dl_cont_d 계약일
	 * @return key : articleVo,  dealVo
	 * 
	 ******************************************/
	public Map<String, Object> setVo(XSSFRow row,
			int ar_sigungu, int ar_zip, int ar_rd, 
			int ar_rd_detail1, int ar_rd_detail2, 
			int ar_complex, int ar_nm, int ar_const_y, String ar_bc, 
			int ar_prps_pls, int ar_mn_prps, int ar_build_ty,
			int dl_ty, int dl_price, int dl_depos, int dl_rnt, 
			int dl_excv_area, int dl_flr, int dl_cont_ym, int dl_cont_d){

		
		ArticleVo articleVo = new ArticleVo();
		DealVo dealVo = new DealVo();
		Map<String, Object> setVoMap = new HashMap<>();
		
		
		//articleVo입력..
		
		// 구, 동 입력, dealVo도 같이 입력
		
		if(row == null) {
			return null;
		}
		
		if(row.getCell(ar_sigungu) == null ) {
			return null;
		}
		
		String sigungu = row.getCell(ar_sigungu).toString();
		String[] sigunguArr = splitSiGunGu(sigungu);
		
		articleVo.setArtcl_gu(sigunguArr[1]);
		articleVo.setArtcl_dong(sigunguArr[2]);
		dealVo.setDl_gu(sigunguArr[1]);
		dealVo.setDl_dong(sigunguArr[2]);
		//번지 입력
		if(ar_zip != -1) {
			
			String zip = row.getCell(ar_zip).toString();
			articleVo.setArtcl_zip(zip);
			dealVo.setDl_zip(zip);
			
		}else if(ar_zip == -1) {
			
			articleVo.setArtcl_zip("*");
			
		}
		
		//도로명 넣기 dealVo도 같이
		String rd = row.getCell(ar_rd).toString();
		articleVo.setArtcl_rd(rd);
		dealVo.setDl_rd(rd);
		
		//도로명 상세
		if(ar_rd_detail1 != -1 && ar_rd_detail2 == -1) {
			
			String rd_detail = row.getCell(ar_rd_detail1).toString() 
							+ " " + row.getCell(ar_rd_detail2);
			
			articleVo.setArtcl_rd_detail(rd_detail);

		}
		
		//건물 분류
		if(ar_bc.equals("single")) {
			String ty = row.getCell(2).toString().equals("단독") ? "single" : "multi";
			articleVo.setArtcl_bc(ty);
		}else {
			articleVo.setArtcl_bc(ar_bc);
		}
		
		//건물 단지명, 이름
		if(ar_complex != -1) {
			String complex = row.getCell(ar_complex).toString();
			articleVo.setArtcl_complx(complex);
		}
		
		if(ar_nm != -1) {
			String nm = row.getCell(ar_nm).toString();
			articleVo.setArtcl_nm(nm);
		}
		
		//건축년도
		if(ar_const_y != -1) {
			String const_y = row.getCell(ar_const_y).toString();
			articleVo.setArtcl_const_y(const_y);
		}
		
			
		if(ar_build_ty != -1) {
			articleVo.setArtcl_ty(row.getCell(ar_build_ty).toString());
			articleVo.setArtcl_prps_pls(row.getCell(ar_prps_pls).toString());
			articleVo.setArtcl_mn_prps(row.getCell(ar_mn_prps).toString());
		}
		
				
		
		
		//dealVo 입력..
		//외래키는 위에서 이미 입력되었음
		
		//거래구분
		if(dl_ty != -1) {
			dealVo.setDl_ty(row.getCell(dl_ty).toString());
		} else {
			dealVo.setDl_ty("매매");
		}

		//면적
		if(dl_excv_area != -1) {
			String excv_area = row.getCell(dl_excv_area).toString();
			Float excv_areaF = Float.parseFloat(excv_area);
			dealVo.setDl_excv_area(excv_areaF);
		}
		
		//매매금, 보증금, 월세
		if(dl_price != -1) {
			double price = CommonUtil.delComma(row.getCell(dl_price).toString());
			dealVo.setDl_price(price);
		}
		if(dl_depos != -1) {
			double depos = CommonUtil.delComma(row.getCell(dl_depos).toString());
			dealVo.setDl_depos(depos);
		}
		if(dl_rnt != -1) {
			double rnt = CommonUtil.delComma(row.getCell(dl_rnt).toString());
			dealVo.setDl_rnt(rnt);
		}
		
		//계약 년월
		if(dl_cont_ym != -1) {
			dealVo.setDl_cont_ym(row.getCell(dl_cont_ym).toString());
		}
		if(dl_cont_d != -1) {
			String cont_d = row.getCell(dl_cont_d).toString();
			if(cont_d.equals("1~10")) {
				cont_d = "0" + cont_d;
			}
			dealVo.setDl_cont_d(cont_d);
		}
		
		//계약 층수
		if(dl_flr != -1) {
			dealVo.setDl_flr(row.getCell(dl_flr).toString());
		}
		
		setVoMap.put("articleVo", articleVo);
		setVoMap.put("dealVo", dealVo);
		
		
		return setVoMap;
	}
	
	public String getLocation(ArticleVo articleVo) {
		
		String gu = articleVo.getArtcl_gu();
		String dong = articleVo.getArtcl_dong();
		String zip = articleVo.getArtcl_zip();
		String rd = articleVo.getArtcl_rd();
		StringBuffer sb = new StringBuffer();
		
		if(zip.equals("*")) {
			sb.append("대전");
			sb.append(" ");
			sb.append(gu);
			sb.append(" ");
			sb.append(rd);
		}else {
			sb.append(gu);
			sb.append(' ');
			sb.append(dong);
			sb.append(' ');
			sb.append(zip);
		}
		
		String location = sb.toString();
		
		return location;
	}
	
	
	public static String[] splitSiGunGu(String siGunGu) {
		
		String[] result = siGunGu.split(" ");
		
		return result;
	}

}
