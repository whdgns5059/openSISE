package kr.co.opensise.user.local.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.opensise.admin.manage.dataetc.model.StationVo;
import kr.co.opensise.user.local.service.StationServiceInf;

@Controller
@RequestMapping("/localStation")
public class StationController {

	@Resource(name="stationService")
	private StationServiceInf stationService;
	
	@RequestMapping("/selectStationList")
	public String selectStaionList(StationVo sttnVo, Model model) {
		
		List<StationVo> stationList =  stationService.selectStationList(sttnVo);
	
		model.addAttribute("stationList", stationList);
		
		return "user/localAjax/stationList";
	}
	
	
}
