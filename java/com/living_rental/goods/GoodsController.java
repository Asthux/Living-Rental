package com.living_rental.goods;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.living_rental.goods.service.goodsService;

@Controller
public class GoodsController {
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	@Autowired goodsService service;
	
	@RequestMapping(value = "registProc")
	public String regist(MultipartHttpServletRequest req) {
		service.registProc(req);
		return "forward:home?formpath=goodsListProc";
	}
	
	@RequestMapping(value = "goodsListProc")
	public String goodsList(Model model) {
		service.goodsListProc(model);
		return "forward:goodsList";
	}
	
	@RequestMapping(value = "goodsViewProc")
	public String goodsView(String gdsNum, Model model) {
		service.goodsViewProc(gdsNum, model);
		return "forward:home?formpath=goodsView";
	}
	
	@RequestMapping(value = "goodsModifyProc")
	public String goodsModifyProc(String gdsNum, MultipartHttpServletRequest req) {
		service.goodsModifyProc(gdsNum, req);
		return "forward:home?formpath=goodsListProc";
	}
	
	@RequestMapping(value = "goodsDeleteProc")
	public String goodsDeleteProc(int gdsNum) {
		service.goodsDeleteProc(gdsNum);
		return "forward:home?formpath=goodsListProc";
	}

}
