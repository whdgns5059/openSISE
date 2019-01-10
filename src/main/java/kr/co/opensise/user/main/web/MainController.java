package kr.co.opensise.user.main.web;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.drew.imaging.ImageMetadataReader;
import com.drew.imaging.ImageProcessingException;
import com.drew.lang.GeoLocation;
import com.drew.metadata.Metadata;
import com.drew.metadata.exif.GpsDirectory;

import kr.co.opensise.user.main.model.BuildingSaleVo;
import kr.co.opensise.user.main.model.FilterVo;
import kr.co.opensise.user.main.service.MainServiceInf;
import kr.co.opensise.util.CommonUtil;


@Controller
@RequestMapping("/main")
public class MainController {
	Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Resource(name = "mainService")
	MainServiceInf mainService;
	
	/**  
	* Method   : main 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @return  
	* Method 설명 : 건물분류와 검색명을 가지고 매물 검색   
	*/
	@RequestMapping("/main")
	public String main(Model model, FilterVo filterVo) {
		//매물리스트 검색 결과를 담을 리스트 
		List<BuildingSaleVo> buildSaleList = null;
		logger.info("buildng : "+ filterVo.getBuilding());
		if(filterVo.getBuilding().equals("house")) {
			logger.info("house input");
			buildSaleList = mainService.buildingSingleSaleList(filterVo);
		}else {
			buildSaleList = mainService.buildingSaleList(filterVo);
		}
		//파라미터를 바탕으로  db에 검색 (파라미터 : 건물분류, 검색명)
		model.addAttribute("buildingSaleList", buildSaleList);
		model.addAttribute("buildingSaleListSize", buildSaleList.size());
		model.addAttribute("searchName", filterVo.getSearchName());
		model.addAttribute("building",filterVo.getBuilding());
		model.addAttribute("dlType",filterVo.getDl_ty());
		return "main";
	}
	
	@RequestMapping("/mainAjax")
	public String mainAjax(Model model, FilterVo filterVo) {
		List<BuildingSaleVo> buildFilterList = null;
		
		logger.info("filterVo.getDlpirce : " + filterVo.getDl_price1());
		logger.info("filterVo.getDlpirce : " + filterVo.getDl_price2());
		logger.info("filterVo.getDlRnt : " + filterVo.getDl_rnt1());
		logger.info("filterVo.getDlRnt : " + filterVo.getDl_rnt2());
		logger.info("filterVo.getDl_ty : " + filterVo.getDl_ty());
		
		if(filterVo.getBuilding().equals("all")) {
			buildFilterList = mainService.buildingSingleFilterList(filterVo);
		}else {
			buildFilterList = mainService.buildingFilterList(filterVo);
		}
		//파라미터를 바탕으로  db에 검색 (파라미터 : 건물분류, 검색명)
		model.addAttribute("buildingSaleList", buildFilterList);
		model.addAttribute("buildingSaleListSize", buildFilterList.size());
		model.addAttribute("building",filterVo.getBuilding());
		model.addAttribute("dlType",filterVo.getDl_ty());
		return "user/mainAjax/rightList";
	}
	
	
	/*************************************************  
	* Method   : searchCam 
	* 작성자 :  whdgn
	* 변경이력 :  2018. 12. 29.
	* @param part
	* @param filterVo
	* @param request
	* @return
	* @throws IOException  
	* Method 설명 :  사진으로 검색
	* 사진에서 좌표를 추출, 해당 좌표로 동명을 찾고
	* 그 값을 파라미터로 하여 main으로 리다이렉트 한다
	**************************************************/
	@RequestMapping("/searchCam")
	public String searchCam(@RequestPart("search_cam") MultipartFile part, FilterVo filterVo, HttpServletRequest request, Model model) throws IOException {
		
		String path = request.getServletContext().getRealPath("/reviewImg");
			
		String uuidName = UUID.randomUUID().toString();
		
		File file = new File(path + File.pathSeparator + uuidName);
		
		try {
			part.transferTo(file);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		
		Metadata metadata = null;
		try {
			metadata = ImageMetadataReader.readMetadata(file);
		} catch (ImageProcessingException | IOException e1) {
			e1.printStackTrace();
		}
		
		if(metadata == null) {
			return  "user/mainAjax/wrong_request";
		}
		
		
		GpsDirectory gpsDirec = metadata.getFirstDirectoryOfType(GpsDirectory.class);
	
		if(gpsDirec != null) {

			GeoLocation geoLoc = gpsDirec.getGeoLocation();
		
			double lat = geoLoc.getLatitude();
			double lng = geoLoc.getLongitude();
			
			Map<String, Double> latlng = new HashMap<String, Double>();
			latlng.put("lat", lat);
			latlng.put("lng", lng);
		
			String dong = CommonUtil.coord2Addr(latlng);
			String searchName = dong.substring(1, dong.length()-1);
			
			
			//main/main 으로 보내야 하는 파라미터
			//searchName,  building, dl_ty = 매매
			
			String building = filterVo.getBuilding();
			String dl_ty = filterVo.getDl_ty();
			
			return "redirect:/main/main?searchName="+URLEncoder.encode(searchName, "UTF-8")+"&building="+building+"&dl_ty="+URLEncoder.encode(dl_ty, "UTF-8");
			
		}else {
			
			return  "user/mainAjax/wrong_request";
			
		}
		
		
	}
	
	@RequestMapping(value="priceAjax", method = {RequestMethod.POST})
	public String priceAjax(FilterVo filterVo, Model model) {
		FilterVo filter = mainService.miniMaxPriceSerach(filterVo);
		model.addAttribute("price", filter);
		
		return "jsonView";
	}
	
	
	
	

}
