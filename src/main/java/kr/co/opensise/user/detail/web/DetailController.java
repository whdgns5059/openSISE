package kr.co.opensise.user.detail.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;

@Controller
@RequestMapping("/detail")
public class DetailController {
	
	@RequestMapping("/detail")
	public String detail(ArticleVo articleVo) {
		
		
		
		return "detail";
	}

}
