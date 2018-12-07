package kr.co.opensise.admin.manage.dataetc.web;

import java.io.BufferedInputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellType;
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

import kr.co.opensise.admin.manage.dataetc.model.HumanStatisticVo;
import kr.co.opensise.admin.manage.dataetc.model.MarketVo;
import kr.co.opensise.admin.manage.dataetc.model.MarketDetailVo;
import kr.co.opensise.admin.manage.dataetc.service.DataEtcService;
import kr.co.opensise.admin.manage.dataetc.service.DataEtcServiceInf;

@Controller
@RequestMapping("/manage/dataEtc")
public class DataEtcController {
	
	private Logger log = LoggerFactory.getLogger(DataEtcController.class);
	
	@Resource(name="dataEtcService")
	private DataEtcServiceInf dataEtcService;
	
	@RequestMapping("/dataEtc")
	public String dataEtc() {
		return "manage/dataEtc";
	}

	//인구통계
	@RequestMapping("/insertDataEtc")
	public String insertDateEtc(@RequestPart("etcData") MultipartFile part, Model model) {
		try {
			//buffedinputStream으로 속도 상승
			BufferedInputStream bis = new BufferedInputStream(part.getInputStream());
		
			HSSFWorkbook wb = new HSSFWorkbook(bis);
			HSSFSheet sheet = wb.getSheetAt(0);
			
			//행의 갯수
			int rows = sheet.getPhysicalNumberOfRows();
			
			//조사시기
			HSSFRow hs_dateRow = sheet.getRow(0);
			HSSFCell hs_dateCell = hs_dateRow.getCell(0);
			String date = hs_dateCell.toString();
			log.warn("date {}", date);
			
			int yyyyidx = date.indexOf("년");
			int MMidx = date.indexOf("월");
			
			String yyyy = date.substring(yyyyidx-4, yyyyidx);
			log.info("yyyy : {}",yyyy);
			String MM = date.substring(MMidx-2, MMidx);
			log.info("MM : {}",MM);
			if(MM.equals(" 1") || MM.equals(" 2") || MM.equals(" 3") || MM.equals(" 4") ||
					 MM.equals(" 5") || MM.equals(" 6") || MM.equals(" 7") || MM.equals(" 8") || MM.equals(" 9")) {
				MM = "0"+MM.substring(1);
			}
			System.out.println("MM : " +MM);
			String hs_date = yyyy + MM;
			
//			Date hs_date = new SimpleDateFormat("yyyy/MM").parse(dateC);
			
			//반복문을 이용해 성별,연령별,동별,시기별 셀 정보를 human_statisticVo에 담고 list에 넣기
			List<HumanStatisticVo> human_statisticList = new ArrayList<HumanStatisticVo>();
			
			for(int i=6;i<rows;i++) {
				HSSFRow row = sheet.getRow(i);
				
				if(row==null) {
					continue;
				}
				
				//주소 파싱
				String siGunGu = row.getCell(0).toString();
				if(siGunGu.equals("")) {
					break;
				}
				String[] sigunguArr = splitSiGunGu(siGunGu);
				int idx = sigunguArr[2].indexOf("(");
				String sigungu="";
				if(idx !=0) {
					sigungu = sigunguArr[2].substring(0, idx);
				}
				
				//셀의 갯수
				int cells = row.getPhysicalNumberOfCells();

				//연령대
				int start=0;
				int end=4;
				
				for(int columnindex=26; columnindex<47;columnindex++) {
					//셀의 값
					HSSFCell cell=row.getCell(columnindex);
					
					//Human_statisticVo에 넣기
					HumanStatisticVo human_statisticVo = new HumanStatisticVo();
					
					if(sigungu!="") {
						//동
						human_statisticVo.setHs_dong(sigungu);
						//성별(0:남자,1:여자)
						human_statisticVo.setHs_gndr("0");
						//연령대
						if(start<100) {
							human_statisticVo.setHs_age_grp(start+"~"+end+"세");
						}else {
							human_statisticVo.setHs_age_grp(start+"세이상");
						}
						//인구수
						human_statisticVo.setHs_hm_no((int)(cell.getNumericCellValue()));
						//조사시기
						human_statisticVo.setHs_date(hs_date);
						
						//list에 추가
						human_statisticList.add(human_statisticVo);
						
						start += 5;
						end += 5;
					}
				}
				//연령대 다시 시작
				start = 0;
				end = 4;
				
				for(int columnindex=49; columnindex<cells;columnindex++) {
					//셀의 값
					HSSFCell cell=row.getCell(columnindex);
					
					//Human_statisticVo에 넣기
					HumanStatisticVo human_statisticVo = new HumanStatisticVo();
					if(sigungu!="") {
						//동
						human_statisticVo.setHs_dong(sigungu);
						//성별(0:남자,1:여자)
						human_statisticVo.setHs_gndr("1");
						//연령대
						if(start<100) {
							human_statisticVo.setHs_age_grp(start+"~"+end+"세");
						}else {
							human_statisticVo.setHs_age_grp(start+"세이상");
						}
						//인구수
						human_statisticVo.setHs_hm_no((int)(cell.getNumericCellValue()));
						//조사시기
						human_statisticVo.setHs_date(hs_date);
						
						//list에 추가
						human_statisticList.add(human_statisticVo);
						
						start += 5;
						end += 5;
					}
				}
				
			}
			log.info("human_s --> {}",human_statisticList);
			//insert
			int insertHumanList = 0;
			
			insertHumanList = dataEtcService.insertHuman_statistic(human_statisticList);
		
			model.addAttribute("human_statisticList", human_statisticList);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/manage/dataEtc/dataEtc";
	}
	
	private String[] splitSiGunGu(String siGunGu) {
		
		String[] result = siGunGu.split(" ");
		
		return result;
	}
	
	//물가정보
	@RequestMapping("/insertMarketData")
	public String insertMarketData(@RequestPart("marketData") MultipartFile part, Model model) {
		try {
			//buffedinputStream으로 속도 상승
			BufferedInputStream bis = new BufferedInputStream(part.getInputStream());
		
			XSSFWorkbook wb = new XSSFWorkbook(bis);

			int sheets = wb.getNumberOfSheets();
			log.info("sheets : {}",sheets);
			
			//Hashset
			Set<MarketVo> marketSet = new HashSet<MarketVo>();
			
			//List
			List<MarketVo> marketList = new ArrayList<MarketVo>();
			List<MarketDetailVo> marketDetailList = new ArrayList<MarketDetailVo>();
			
			
			
			
			//각 sheet별
			for(int sht=0;sht<sheets;sht++) {
				XSSFSheet sheet = wb.getSheetAt(sht);
				
				String mk_classf = "";
				
				//시장분류
				if(sht==0 || sht==3) {
					XSSFRow mk_classfRow = sheet.getRow(2);
					XSSFCell mk_classfCell = mk_classfRow.getCell(4);
					mk_classf = mk_classfCell.toString();
					log.info("mk_classf : {}", mk_classf);
				}else if(sht==1) {
					XSSFRow mk_classfRow = sheet.getRow(2);
					XSSFCell mk_classfCell = mk_classfRow.getCell(5);
					mk_classf = mk_classfCell.toString();
					log.info("mk_classf : {}", mk_classf);
				}else if(sht==2) {
					mk_classf = "대형마트";
					log.info("mk_classf : {}", mk_classf);
				}
				
				
				
				
				
				//조사일시
				XSSFRow mkd_dateRow = sheet.getRow(1);
				XSSFCell mkd_dateCell = mkd_dateRow.getCell(1);
				String mkd_date= mkd_dateCell.toString();
				log.info("mkd_date : {}", mkd_date);
				
				String[] mkd_dateArr = mkd_date.split("\\.");
				
				String yyyy = mkd_dateArr[0].substring(1);
				log.info("yyyy : {}",yyyy);
				
				int MMidx= mkd_dateArr[1].indexOf("월");
				String MM = mkd_dateArr[1].substring(2, MMidx);
				log.info("MM : {}", MM);
				
				if(MM.equals("1") || MM.equals("2") || MM.equals("3") || MM.equals("4") ||
						 MM.equals("5") || MM.equals("6") || MM.equals("7") || MM.equals("8") || MM.equals("9")) {
					MM = "0"+MM;
				}
				
				mkd_date = yyyy + MM;
				log.info("mkd_dateC : {}", mkd_date);
				
				
				
				//행의 갯수
				int rows = sheet.getPhysicalNumberOfRows();
				int lastrow = sheet.getLastRowNum();
				log.info("rows : {}", rows);
//				log.info("lastrow : {}", lastrow);
				
				
				//row처리
				for(int row=5;row<rows;row++) {
					
					//셀의 수 
					XSSFRow mk_Row = sheet.getRow(5);
					int mk_cells = mk_Row.getPhysicalNumberOfCells();
//					log.info("mk_cell : {}", mk_cells);
					
					for(int cells=5;cells<mk_cells;cells++) {
						//Vo
						MarketVo marketVo = new MarketVo();
						MarketDetailVo marketDetailVo = new MarketDetailVo();
						
						//시장분류Vo에 담기
						marketVo.setMk_classf(mk_classf);
						
						//조사일시 vo에 담기
						marketDetailVo.setMkd_date(mkd_date);
						
						XSSFRow mk_row = sheet.getRow(row);
						
						//가격
						String mk_price="";
						int mkd_price = 0;
						XSSFCell mk_priceCell = mk_row.getCell(cells);
						mk_priceCell.setCellType(CellType.NUMERIC);
						if(mk_priceCell==null) {
							continue;
						}else {
							
//							log.info("=======================");
//							log.info(cells + " mk_price :{}", mk_priceCell.getNumericCellValue());
//							log.info("=======================");
							mkd_price = (int) mk_priceCell.getNumericCellValue();
//							log.info("mkd_price : {}", mkd_price);
						}
						
						
						
						//가격 vo에 담기
						marketDetailVo.setMkd_price(mkd_price);
						
						//시장명
						XSSFRow mk_nmRow = sheet.getRow(4);
						XSSFCell mk_nmCell = mk_nmRow.getCell(cells);
						if(mk_nmCell==null) {
							continue;
						}
						String mk_nm = mk_nmCell.toString().replaceAll("\n", " ");
//						log.info("mk_nm :{}",mk_nm);
						
						//시장명 vo에 담기
						marketVo.setMk_nm(mk_nm);
						marketDetailVo.setMkd_mk(mk_nm);
						
						//동
						XSSFRow mk_dongRow = sheet.getRow(3);
						XSSFCell mk_dongCell = mk_dongRow.getCell(cells);
						if(mk_dongCell.toString().equals("")) {
							mk_dongCell = mk_dongRow.getCell(cells-1);
						}
						String mk_dong = mk_dongCell.toString();
//						log.info("mk_dong : {}", mk_dong);
						
						//동 vo에 담기
						marketVo.setMk_dong(mk_dong);
						marketDetailVo.setMkd_mk_dong(mk_dong);
						
						//품목분류
						String mkd_prod = "";
						XSSFRow mkd_prodRow = sheet.getRow(row);
						XSSFCell mkd_prodCell = mkd_prodRow.getCell(1);
						if(mkd_prodCell==null) {
							continue;
						}else {
							if(mkd_prodCell.toString().equals("")) {
								mkd_prodRow=sheet.getRow(row-1);
								mkd_prodCell = mkd_prodRow.getCell(1);
							}
							mkd_prod = mkd_prodCell.toString();
//							log.info("mk_prod : {}", mkd_prod);
						}
						
						//품목분류 vo에 담기
						marketDetailVo.setMkd_prod(mkd_prod);
						
						//품목상세
						String mkd_prodDetail = "";
						XSSFRow mkd_prodDetailRow = sheet.getRow(row);
						XSSFCell mkd_prodDetailCell = mkd_prodDetailRow.getCell(2);
						if(mkd_prodCell.toString().equals(sheet.getRow(row-1).getCell(1).toString())) {
							mkd_prodDetailRow=sheet.getRow(row);
						}
						if(mkd_prodDetailCell==null) {
							continue;
						}else {
							mkd_prodDetail = mkd_prodDetailCell.toString();
							
//							log.info("mkd_prodDetail : {}", mkd_prodDetail);
						}
						
						//품목상세 vo에 넣기
						marketDetailVo.setMkd_prod_detail(mkd_prodDetail);
						
						//각 vo를 set에 담기(중복제거)
						marketSet.add(marketVo);
						//list에 담기
						marketDetailList.add(marketDetailVo);
						
					}
					
					
//					log.info("marketList : {}", marketList);
//					log.info("marketDetailList : {}", marketDetailList);
				}
				
			}
			
			//insert
			int insertMarketList = 0;
			int insertMarketDetailList = 0;
			
			//list로 옮기기
			marketList.addAll(marketSet);
			
			insertMarketList = dataEtcService.insertMarket(marketList);
			insertMarketDetailList = dataEtcService.insertMarketDetail(marketDetailList);
		
			model.addAttribute("insertMarketList", insertMarketList);	
			model.addAttribute("insertMarketDetailList", insertMarketDetailList);	
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/manage/dataEtc/dataEtc";
	}
}
