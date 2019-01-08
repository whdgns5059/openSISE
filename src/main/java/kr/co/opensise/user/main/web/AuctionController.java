package kr.co.opensise.user.main.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.opensise.user.main.model.AuctionVo;
import kr.co.opensise.util.AuctionJson;

@Controller
@RequestMapping("/auction")
public class AuctionController {

	private Logger log = LoggerFactory.getLogger(AuctionController.class);
	
	
	@GetMapping(value="/auction")
	public String auction() {
		
		return "auction";
	}
	
	@ResponseBody
	@GetMapping(value="/aucListAjax", produces = "text/html; charset=utf8")
	public String aucListAjax() throws UnsupportedEncodingException {
		
		StringBuffer html = new StringBuffer();
		try {
			
			List<AuctionVo> aucVoList = AuctionJson.getAuctionList();

			// 경매 정보글 태그에 담아 뷰로 전달
			for(AuctionVo aucVo : aucVoList) {
				if(aucVo.getItemType().equals("중기") || aucVo.getItemType().equals("자동차")) {
					// 부동산이 아닌 정보에 대해서는 정보를 가져오지 않습니다.
				}else{
					String address = aucVo.getAddr().split(",")[0];
					
					html.append("<div class='auction'>");
					html.append("	<input type='hidden' value='" + address + "' class='addr' />");
					html.append("	<label class='clickDetail h4'>"+ aucVo.getAddr1() +"</label>");
					html.append("	<label style='float: right;margin-right: 20px;color:#808080;'>"+ aucVo.getItemType() +"</label><br/>");
					html.append("	<label>"+ aucVo.getAddr() +"</label><br/>");
					html.append("	<label>"+ aucVo.getAddrInfo() +"</label><br/>");
					html.append("	<label>최저매각 가격 : "+ aucVo.getValueMin() +"</label>");
					html.append("	<label style='float: right; margin-right: 20px;'>감정평가액 : "+ aucVo.getValue() +"</label><br/>");
					html.append("	<label>매각기일 : "+ aucVo.getAuctionDate() +"</label><br/>");
					html.append("</div>");
				}
			}
			
		} catch (NullPointerException e) {
			e.printStackTrace();
		} catch (IndexOutOfBoundsException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 인코딩
		String htmlWrite = html.toString();
		
		return htmlWrite;
	}
	
}































