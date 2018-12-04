package kr.co.opensise.admin.manage.dataetc.web;

import java.io.BufferedInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import kr.co.opensise.admin.manage.dataetc.model.Human_statisticVo;

@Controller
@RequestMapping("/manage/dataEtc")
public class DataEtcController {
	
	private Logger log = LoggerFactory.getLogger(DataEtcController.class);
	
	@RequestMapping("/dataEtc")
	public String dataEtc() {
		return "manage/dataEtc";
	}

	@RequestMapping("/insertDateEtc")
	public String insertDateEtc(@RequestPart("etcData") MultipartFile part) {
		try {
			//buffedinputStream으로 속도 상승
			BufferedInputStream bis = new BufferedInputStream(part.getInputStream());
		
			XSSFWorkbook wb = new XSSFWorkbook(bis);
			
			XSSFSheet sheet = wb.getSheetAt(0);
			
			//행의 갯수
			int rows = sheet.getPhysicalNumberOfRows();
			
			//조사시기
			XSSFRow hs_dateRow = sheet.getRow(0);
			XSSFCell hs_dateCell = hs_dateRow.getCell(0);
			String date = (hs_dateCell.toString()).substring(0, 9);
			Date hs_date = new SimpleDateFormat("yyyy년 MM월").parse(date);
			
			//반복문을 이용해 성별,연령별,동별,시기별 셀 정보를 human_statisticVo에 담고 list에 넣기
			List<Human_statisticVo> human_statisticList = new ArrayList<Human_statisticVo>();
			
			for(int i=6;i<rows;i++) {
				XSSFRow row = sheet.getRow(i);
				
				Human_statisticVo human_statisticVo = new Human_statisticVo();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "manage/dataEtc";
	}
}
