package kr.co.opensise.user.main.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/auction")
public class AuctionController {

	private Logger log = LoggerFactory.getLogger(AuctionController.class);
	
	@RequestMapping(value="/auction", method=RequestMethod.GET)
	public String auction(Model model) {
		
		return "auction";
	}
	
}































