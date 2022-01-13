package com.living_rental.login;

import com.living_rental.login.service.ILoginService;
import com.living_rental.manage.dto.LoginDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    ILoginService loginService;

    @RequestMapping(value = "loginProc")
    public String loginProc(LoginDTO login, Model model) {
        boolean result = loginService.loginProc(login);
        if(result == true) {
            return "forward:home?formpath=goodsListProc";
        }
        model.addAttribute("msg", "아이디/비밀번호를 확인하세요.");

        return "forward:home?formpath=login";
    }

    @RequestMapping(value = "/logout")
    public String logout(Model model, HttpSession session) {
        session.invalidate();
        model.addAttribute("msg", "로그아웃");
        return "forward:home?formpath=goodsListProc";
    }
}
