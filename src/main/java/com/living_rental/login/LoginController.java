package com.living_rental.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.living_rental.login.dto.LoginDTO;
import com.living_rental.login.service.ILoginService;

@Controller
public class LoginController {
	@Autowired ILoginService loginservice;
	
	@RequestMapping(value = "loginProc")
	public String loginProc(LoginDTO login) {
		boolean result = loginservice.LoginProc(login);
		if(result == true) {
			return "forward:home?formpath=goodsListProc";
		}
		return "forward:home?formpath=login";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "forward:home?formpath=goodsListProc";
	}
}
