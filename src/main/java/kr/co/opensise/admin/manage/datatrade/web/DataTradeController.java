package kr.co.opensise.admin.manage.datatrade.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manage/dataTrade")
public class DataTradeController {
	
	@RequestMapping("/dataTrade")
	public String dataTrade() {
		return "manage/dataTrade";
	}

}
