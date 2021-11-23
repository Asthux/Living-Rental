package com.living_rental;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@RequestMapping(value = "/")
	public String home(Model model) {
		model.addAttribute("formpath", "goodsListProc");
		return "home";
	}
	
	@RequestMapping(value = "/home")
	public String index(Model model, @RequestParam String formpath) {

		model.addAttribute("formpath", formpath);

		logger.warn("formpath : " + formpath);
		return "home";
	}
	
	@RequestMapping(value = "/login")
	public String login() {
		return "member/loginForm";
	}
	
	@RequestMapping(value = "/member")
	public String member() {
		return "member/memberForm";
	}

	@RequestMapping(value = "/goodsList")
	public String productList() {
		return "goods/goodsListForm";
	}
	
	@RequestMapping(value = "/goodsRegist")
	public String goodsRegist() {
		return "goods/goodsRegistForm";
	}
	
	@RequestMapping(value = "/goodsView")
	public String goodsView() {
		return "goods/goodsViewForm";
	}
	
	@RequestMapping(value = "/basket")
	public String basket() {
		return "order/basketForm";
	}

}
