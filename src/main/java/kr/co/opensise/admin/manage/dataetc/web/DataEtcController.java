package kr.co.opensise.admin.manage.dataetc.web;

import java.io.BufferedInputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
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

import kr.co.opensise.admin.manage.dataetc.model.Human_statisticVo;
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
			List<Human_statisticVo> human_statisticList = new ArrayList<Human_statisticVo>();
			
			for(int i=6;i<rows;i++) {
				HSSFRow row = sheet.getRow(i);
				
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
					Human_statisticVo human_statisticVo = new Human_statisticVo();
					
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
					Human_statisticVo human_statisticVo = new Human_statisticVo();
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
			
			for(int sht=0;sht<sheets;sht++) {
				XSSFSheet sheet = wb.getSheetAt(sht);
				
				//행의 갯수
				int rows = sheet.getPhysicalNumberOfRows();
				log.info("rows : {}", rows);
				
				//시장분류
				if(sht==0 || sht==3) {
					XSSFRow mk_nmRow = sheet.getRow(2);
					XSSFCell mk_nmCell = mk_nmRow.getCell(4);
					String mk_nm = mk_nmCell.toString();
					log.info("mk_nm : {}", mk_nm);
				}else if(sht==1) {
					XSSFRow mk_nmRow = sheet.getRow(2);
					XSSFCell mk_nmCell = mk_nmRow.getCell(5);
					String mk_nm = mk_nmCell.toString();
					log.info("mk_nm : {}", mk_nm);
				}else if(sht==2) {
					String mk_nm = "대형마트";
					log.info("mk_nm : {}", mk_nm);
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
				
				//시장명
				XSSFRow mk_nmRow = sheet.getRow(4);
				int mk_nmcells = mk_nmRow.getPhysicalNumberOfCells();
				log.info("mi_nmCells : {}" , mk_nmcells);
				
				for(int i=5;i<mk_nmcells;i++) {
					String[] mk_nmArr = new String[mk_nmcells];
					XSSFCell mk_nmCell = mk_nmRow.getCell(i);
					mk_nmArr[i] =mk_nmCell.toString().replaceAll("\n", " ");
					log.info("mk_nm : {}", mk_nmArr[i]);
				}
				
				//동
				XSSFRow mk_dongRow = sheet.getRow(3);
				int mk_dongcells = mk_nmRow.getPhysicalNumberOfCells();
				for(int i=5;i<mk_dongcells;i++) {
					String[] mk_dongArr = new String[mk_dongcells];
					XSSFCell mk_dongCell = mk_dongRow.getCell(i);
					if(mk_dongCell.toString().equals("")) {
						mk_dongCell = mk_dongRow.getCell(i-1);
					}
					mk_dongArr[i] =mk_dongCell.toString();
					log.info("mk_dong : {}", mk_dongArr[i]);
				}
				
				
				for(int i=5;i<rows;i++) {
					XSSFRow row = sheet.getRow(i);
					
					//품목분류
					String[] mkd_prodArr = new String[rows];
					XSSFCell mkd_prodCell = row.getCell(1);
					mkd_prodArr[i] = mkd_prodCell.toString();
					log.info("mkd_prod : {}", mkd_prodArr[i]);
					
					
					//품목상세
					
					//가격
					
				}
			}
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/manage/dataEtc/dataEtc";
	}
}
