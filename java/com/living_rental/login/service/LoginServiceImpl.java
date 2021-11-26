package com.living_rental.login.service;

import com.living_rental.login.dao.ILoginDAO;
import com.living_rental.manage.dto.LoginDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
public class LoginServiceImpl implements ILoginService{
    final static Logger logger = LoggerFactory.getLogger(ILoginService.class);
    @Autowired
    ILoginDAO loginDao;
    @Autowired
    HttpSession session;

    @Override
    public boolean loginProc(LoginDTO login) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        LoginDTO check = loginDao.loginProc(login);
        if(check == null)
            return false;
        if(encoder.matches(login.getPw(), check.getPw())) {
            logger.warn("success");
            session.setAttribute("id", login.getId());
            return true;
        }
        return false;
    }
}
