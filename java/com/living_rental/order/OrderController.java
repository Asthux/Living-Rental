package com.living_rental.order;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.living_rental.order.service.basketService;


@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired basketService service;

	@RequestMapping(value = "basketProc")
	public String basketProc(String gdsNum, Model model, HttpServletResponse response) {
		logger.warn("basketProc");
		String msg = service.basketProc(gdsNum);
		
		PrintWriter writer;
		try {
			response.setCharacterEncoding("UTF-8");
			writer = response.getWriter();
			writer.println("<script type='text/javascript'>");
			writer.println("alert("+msg+");");
			writer.println("</script>");
			writer.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "forward:goodsViewProc";
	}
}
