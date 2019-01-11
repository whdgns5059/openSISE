package kr.co.opensise.admin.manage.dataetc.web;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kr.co.opensise.admin.manage.dataetc.model.BusVo;
import kr.co.opensise.admin.manage.dataetc.model.HumanStatisticVo;
import kr.co.opensise.admin.manage.dataetc.model.InstiAttrVo;
import kr.co.opensise.admin.manage.dataetc.model.InstiVo;
import kr.co.opensise.admin.manage.dataetc.model.MarketVo;
import kr.co.opensise.admin.manage.dataetc.model.RouteVo;
import kr.co.opensise.admin.manage.dataetc.model.StationVo;
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
	public String dataEtc(Model model) {
		List<InstiVo> instiList = dataEtcService.selectInsti();
		model.addAttribute("instiList", instiList);
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
			
			
			if(insertHumanList>0) {
				model.addAttribute("success", human_statisticList.size());
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("success", 0);
			return "redirect:/manage/dataEtc/dataEtc";
		}
		
		
		return "redirect:/manage/dataEtc/dataEtc";
	}
	
	private String[] splitSiGunGu(String siGunGu) {
		
		String[] result = siGunGu.split(" ");
		
		return result;
	}
	
	//물가정보
	@RequestMapping("/insertMarketData")
	public String insertMarketData(@RequestPart("marketData") MultipartFile part, Model model,HttpServletResponse response) {
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
						marketDetailVo.setMkd_classf(mk_classf);
						
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
							log.info("mkd_price : {}", mkd_price);
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
						mk_dong.replaceAll(" ", "");
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
					log.info("marketDetailList : {}", marketDetailList);
				}
				
			}
			
			//insert
			int insertMarketList = 0;
			int insertMarketDetailList = 0;
			
			//list로 옮기기
			marketList.addAll(marketSet);
			
			//기존에 존재하는 MarketList와 중복되지 않도록 처리하기
			List<MarketVo> marketListdb = dataEtcService.marketList();
			
			//중복되면 지워주기
			marketList.removeAll(marketListdb);
			
		
			
			
			if(marketList.size()!=0) {
				for(MarketVo mVo : marketList) {
					
					mVo.getMk_nm().replaceAll("\\s", "");
					mVo.getMk_classf().replaceAll("\\s", "");
					mVo.getMk_dong().replaceAll("\\s", "");
					
					log.info("mVo : {}",mVo.toString());
					dataEtcService.insertMarketOne(mVo);
				}
			}
			
			insertMarketDetailList = dataEtcService.insertMarketDetail(marketDetailList);
		
			model.addAttribute("insertMarketListCnt", insertMarketList);	
			model.addAttribute("insertMarketDetailListCnt", insertMarketDetailList);
			
			
			if(insertMarketDetailList>0) {
				model.addAttribute("success", marketDetailList.size());
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("success", 0);
			return "redirect:/manage/dataEtc/dataEtc";
		}
		
		return "redirect:/manage/dataEtc/dataEtc";
	}
	
	//교통정보
	@RequestMapping("/insertStationData")
	public String insertStation(Model model) {
//		BufferedReader br = null;
		BufferedReader brA = null;
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();// Document를 생성할 Factory
		factory.setNamespaceAware(true);
		
		
		try {
			
			Set<RouteVo> routeSet = new HashSet<RouteVo>();
			
			//dBNLwu8%2BaX3uGBpD%2FtOpZAI2tJl9bMq5x3MKWtrr8HWmZCdq5pSfKWP4LYXCyJCssITHaCHvkux7SHCv7v8H7A%3D%3D : 다영
			//Gtm3470Ghm%2BbyAlbB3JGPbzbRpLu6l74x%2Fa1qprKSiQL6nrZaIF7UC0wPVPUgS7L4qnhGv0KTESkdKG4jQ57cQ%3D%3D :종훈
			//RT1lHlWUhjho%2FbTmTxIJL4vFER1%2BRzgKGsI1dLvVMCspNNUpTxjfzvhfjSEZ75nE9AHoSPUN3fdIJQ3cZzwAOw%3D%3D:나
			//openApi 호출(전체노선 기본정보 조회)
			String urlAll = "http://openapitraffic.daejeon.go.kr/"
						+"api/rest/busRouteInfo/getRouteInfoAll"
						+"?serviceKey=dBNLwu8%2BaX3uGBpD%2FtOpZAI2tJl9bMq5x3MKWtrr8HWmZCdq5pSfKWP4LYXCyJCssITHaCHvkux7SHCv7v8H7A%3D%3D&reqPage=1";
			
			URL urlA= new URL(urlAll);
			HttpURLConnection httpUrlConnectionA = (HttpURLConnection) urlA.openConnection();
			
			//응답읽기
			brA= new BufferedReader(new InputStreamReader(httpUrlConnectionA.getInputStream(), "UTF-8"));
			String resultA = "";
			String lineA;
			
			while((lineA = brA.readLine())!=null) {
				resultA = resultA + lineA.trim()+"\n"; //result = url로 xml을 읽은 값
			}
			log.info("resultA : {}", resultA);
			
			//===============================================================================
			InputStream isA = new ByteArrayInputStream(resultA.getBytes());// 서버로 부터 받은 string 형태의 xml데이터를 InputStream에 담는다.

			DocumentBuilder builderA = factory.newDocumentBuilder();// Builder 객체를 생성
			Document docA = builderA.parse(isA); //Document오브젝트 취득
			Element orderA = docA.getDocumentElement(); //자식 노드 취득
			
			//각노드의 리스트 취득
			NodeList itemsA = orderA.getElementsByTagName("itemList");
			
			List<BusVo> busList=new ArrayList<BusVo>();
			List<RouteVo> routeList = new ArrayList<RouteVo>();
			List<StationVo> stationList = new ArrayList<StationVo>();
			
			//전체 버스 정보의 itemList만큼 반복---> 각 태그이름별로 노드리스트 만들기
			for(int i=0;i<itemsA.getLength();i++) {
				// Get element 
			    Element element = (Element)itemsA.item(i);
			    
			    
//			    getRoute(factory, element, busList, routeList, stationList);
				BufferedReader br;
				
				
				//노선 ID
				NodeList route_cdList  = element.getElementsByTagName("ROUTE_CD");
				
				//route_no 노선명칭
				NodeList route_noList = element.getElementsByTagName("ROUTE_NO");
				
				
				//route_tp 노선유형(1:급행 2: 간선, 3:지선, 4외곽, 5마을)
				NodeList route_tpList = element.getElementsByTagName("ROUTE_TP");
				
				//bus_cd의 갯수만큼 반복하며 busVo만들기
				for (int j = 0; j < route_cdList.getLength(); j++) {

					BusVo busVo = new BusVo();
					
					
					//노선 ID
					Element eventEle = (Element) route_cdList.item(j);
					Node butstop = eventEle.getFirstChild();
					String route_cd = butstop.getNodeValue();
					busVo.setBus_cd(route_cd);
					
					log.info("route_cd : {}", route_cd);
					
					//route_no 노선명칭
					Element eventEle_no = (Element) route_noList.item(j);
					Node butstop_no = eventEle_no.getFirstChild();
					String route_cd_no = butstop_no.getNodeValue();
					busVo.setBus_no(route_cd_no);
					log.info("route_cd_no : {}", route_cd_no);
					
					//route_tp 노선유형(1:급행 2: 간선, 3:지선, 4외곽, 5마을, 6첨단)
					Element eventEle_tp = (Element) route_tpList.item(j);
					Node butstop_tp = eventEle_tp.getFirstChild();
					String route_cd_tp = butstop_tp.getNodeValue();
					busVo.setBus_tp(route_cd_tp);
					log.info("route_cd_tp : {}", route_cd_tp);
					
					busList.add(busVo);
					
					//각 버스(bus_cd(route_cd))에 해당하는 정류소 정보 호출
					//openApi 호출(노선별 경유 정류소 정보)
					String urlRoute = "http://openapitraffic.daejeon.go.kr/"
									+"api/rest/busRouteInfo/getStaionByRoute"
									+"?busRouteId="+route_cd+"&serviceKey=dBNLwu8%2BaX3uGBpD%2FtOpZAI2tJl9bMq5x3MKWtrr8HWmZCdq5pSfKWP4LYXCyJCssITHaCHvkux7SHCv7v8H7A%3D%3D";
					
					URL urlR = new URL(urlRoute);
					HttpURLConnection httpUrlConnection = (HttpURLConnection) urlR.openConnection();
					
					//응답읽기
					br= new BufferedReader(new InputStreamReader(httpUrlConnection.getInputStream(), "UTF-8"));
					String result = "";
					String line;
					
					while((line = br.readLine())!=null) {
						result = result + line.trim()+"\n"; //result = url로 xml을 읽은 값
					}
//					log.info("restApi : {}", result);
					
					//xml 파싱하기
					InputStream is = new ByteArrayInputStream(result.getBytes());// 서버로 부터 받은 string 형태의 xml데이터를 InputStream에 담는다.

					DocumentBuilder builder = factory.newDocumentBuilder();// Builder 객체를 생성
					Document doc = builder.parse(is); //Document오브젝트 취득
					Element order = doc.getDocumentElement(); //자식 노드 취득
					
					//각노드의 리스트 취득
					NodeList items = order.getElementsByTagName("itemList");
					
					//버스 정류소의 갯수 만큼 반복하며 정보가져오기
					for(int k=0;k<items.getLength();k++) {
						//BUSSTOP_NM, bus_node_id, gps_lati, gps_long
						StationVo stationVo = new StationVo();
						// Get element 
					    Element elementR = (Element)items.item(k);
					    
					    //버스정류장명, 
						String busstop_nm = getStationValue(elementR,"BUSSTOP_NM");
						stationVo.setSttn_nm(busstop_nm);
						log.info("busstop_nm : {}", busstop_nm);
						
						//버스 정류장 ID
						String bus_node_id = getStationValue(elementR,"BUS_NODE_ID");
						stationVo.setSttn_id(bus_node_id);
						log.info("bus_node_id : {}", bus_node_id);

						
						//위도
						String gps_lati = getStationValue(elementR,"GPS_LATI");
						stationVo.setSttn_lat(gps_lati);
						log.info("gps_lati : {}", gps_lati);
						
						
						//경도
						String gps_long = getStationValue(elementR,"GPS_LONG");
						stationVo.setSttn_lng(gps_long);
						log.info("gps_long : {}", gps_long);
							
						
						RouteVo routeVo = new RouteVo();
						routeVo.setRt_cd(route_cd);
						routeVo.setRt_id(bus_node_id);
						routeSet.add(routeVo);
						
						stationList.add(stationVo);
						
						
					}
					//===============================================================================
					
				}
				
			}
			//insert
			
			int insertRoute=0;
			int insertStation=0;
			int insertBus = 0;
			insertBus = dataEtcService.insertBus(busList);
			
			insertStation = dataEtcService.insertStation(stationList);
			
			routeList.addAll(routeSet);
			insertRoute = dataEtcService.insertRoute(routeList);
			
			
			
			model.addAttribute("busList", busList);
			model.addAttribute("routeList", routeList);
			model.addAttribute("stationList", stationList);
			
			//===============================================================================
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/manage/dataEtc/dataEtc";
	}
	
	private String getStationValue(Element elementR,String tagName) {
		NodeList busstopList = elementR.getElementsByTagName(tagName);

		Element eventEleR = (Element) busstopList.item(0);
		Node butstopR = eventEleR.getFirstChild();
		String busstop= butstopR.getNodeValue();
		
		return busstop;
		
	}

	//시설관리
	
	//시설추가
	@RequestMapping(value="/insertInsti", method = RequestMethod.POST)
	public String insertInsti(@RequestParam("insti") String insti) {
		
		try {
			List<InstiVo> instiList = dataEtcService.selectInsti();
			
			InstiVo instiVo = new InstiVo();
			int cnt=0;
			for(int i=0;i<instiList.size();i++) {
				if(insti.equals(instiList.get(i).getInsti_nm())){
					cnt++;
				}else {
					continue;
				}
			}
			if(cnt<=0) {
				instiVo.setInsti_nm(insti);
				
				int insertInsti = dataEtcService.insertInsti(instiVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/manage/dataEtc/dataEtc";
	}
	
	//시설속성추가
	@RequestMapping("/insertIattr")
	public String insertIattr(InstiAttrVo instiAttrVo,Model model,@RequestParam("iattr_insti") String iattr_instiS) {
		
		try {
			//시설속성 insert
			int insertIattr = dataEtcService.insertInstiattr(instiAttrVo);
			
			//시설번호 가져오기
			if(iattr_instiS != "0") {
				int iattr_insti = Integer.parseInt(iattr_instiS);
				//시설 속성 테이블에서 제목부분리트스(중복제거)
				List<InstiAttrVo> insti_attrList = dataEtcService.selectInsti_attr(iattr_insti);
				//시설 속성 테이블에서 body부분 리스트
				List<InstiAttrVo> instiAttrList = dataEtcService.selectInstiAttr(iattr_insti);
				
				model.addAttribute("insti_attrList", insti_attrList);
				model.addAttribute("instiAttrList", instiAttrList);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return "redirect:/manage/dataEtc/dataEtc";
	}
	
	@RequestMapping("/selectInsti")
	public String selectInsti(@RequestParam("instiHere") Integer iattr_insti,Model model,HttpServletRequest request) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("utf-8");
		
		if(!(iattr_insti.equals("분류"))) {
			log.info("iattr_inst {}", iattr_insti);
			
			//시설 속성 테이블에서 제목부분리트스(중복제거)
			List<InstiAttrVo> insti_attrList = dataEtcService.selectInsti_attr(iattr_insti);
			//시설 속성 테이블에서 body부분 리스트
			List<InstiAttrVo> instiAttrList = dataEtcService.selectInstiAttr(iattr_insti);
			//
//			for(int i=0;i<instiAttrList.size();i++) {
//				log.info("level : {} ", instiAttrList.get(i).get(i).getLevel());
//			}
			//
			model.addAttribute("insti_attrList", insti_attrList);
			model.addAttribute("instiAttrList", instiAttrList);
		}
		
		List<InstiVo> instiList = dataEtcService.selectInsti();
		
		model.addAttribute("instiList", instiList);
		model.addAttribute("iattr_insti", iattr_insti);
		
		return "manage/dataEtc";
	}
	
	@RequestMapping("/deletInstiAttr")
	public String deletInstiAttr(Model model, @RequestParam("instiHere") Integer iattr_insti,
				@RequestParam("checked") String iattrNo) {
		
		String[] checkedDelete = iattrNo.split(",");
		
		int[] iattr_no = new int[checkedDelete.length]; 
		for(int i=0;i<checkedDelete.length;i++) {
			iattr_no[i] = Integer.parseInt(checkedDelete[i]);
			log.info("iattr_no : {}", iattr_no[i]);
			dataEtcService.deleteInstiattr(iattr_no[i]);
		}
		List<InstiAttrVo> insti_attrList = dataEtcService.selectInsti_attr(iattr_insti);
		List<InstiAttrVo> instiAttrList = dataEtcService.selectInstiAttr(iattr_insti);
		
		model.addAttribute("insti_attrList", insti_attrList);
		model.addAttribute("instiAttrList", instiAttrList);
		
		return "admin/manage/dataEtcAjax/dataEtcAjax";
	}
}
