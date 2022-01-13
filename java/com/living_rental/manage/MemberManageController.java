package com.living_rental.manage;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.living_rental.manage.dto.AllDTO;
import com.living_rental.manage.dto.LoginDTO;
import com.living_rental.manage.service.IMemberService;

@Controller
public class MemberManageController {
	@Autowired IMemberService service;


	@RequestMapping(value = "memberListProc")
	public String memberList(Model model,
			@RequestParam(value = "currentPage", required=false, defaultValue = "1") int currentPage,
			String select, String search) {
		service.memberList(model, currentPage, select, search);

		return "forward:/home?formpath=memberList";
	}

	
	@RequestMapping(value = "userInfoProc")
	public String userInfoProc(String id, Model model, HttpSession session) {
		String sessionId = (String)session.getAttribute("id");
	
		if(sessionId.equals(id) || "admin".equals(sessionId)) {
			model.addAttribute("user", service.userInfo(id));
			return "forward:/home?formpath=userInfo";
		}
		return "forward:memberListProc";
	}

	 
	@RequestMapping(value = "modifyCheckProc")
	public String modifyCheckProc(LoginDTO check, Model model, HttpSession session) {
		boolean b = service.modifyCheckProc(check);
		if(b == false)
			return "forward:/home?formpath=modifyCheck";

		return "forward:/home?formpath=memberModify";
	}

	
	@RequestMapping(value = "memberModifyProc")
	public String memberModifyProc(AllDTO all, HttpSession session) {

		String modifyId = (String)session.getAttribute("modfyId");
		all.setId(modifyId);
		service.memberModifyProc(all);
		return "forward:memberListProc";
	}

	@RequestMapping(value = "deleteAndCheckProc")
	public String deleteAndCheckProc(LoginDTO check) {
		boolean b = service.deleteAndCheckProc(check);
		if(b == false)
			return "forward:/home?formpath=memberDelete";

		return "forward:memberListProc";
	}

	@RequestMapping(value = "sendSelect")
	@ResponseBody
	public void sendSelect(@RequestBody Map<String,String> map) {
		
	}
}
