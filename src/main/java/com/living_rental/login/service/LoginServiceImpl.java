package com.living_rental.login.service;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.living_rental.login.dto.LoginDTO;


@Service
public class LoginServiceImpl implements ILoginService {
	final static Logger logger = LoggerFactory.getLogger(ILoginService.class);
	@Autowired HttpSession session;
	
	@Override
	public boolean LoginProc(LoginDTO login) {
		if(login.getId().equals("admin") && login.getPw().equals("1234")) {
			logger.warn("admin login");
			session.setAttribute("id", "admin");
			return true;
		}
		if(login.getId().equals("user1") && login.getPw().equals("1234")) {
			logger.warn("user1 login");
			session.setAttribute("id", "user1");
			return true;
		}
		return false;
	}

}
