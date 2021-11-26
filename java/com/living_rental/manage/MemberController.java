package com.living_rental.manage;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.living_rental.manage.dto.MemberDTO;
import com.living_rental.manage.dto.PostcodeDTO;
import com.living_rental.manage.service.IMemberService;


@Controller
public class MemberController {
	@Autowired IMemberService service;

	@RequestMapping(value = "isExistId", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, String> isExistId(@RequestBody Map<String, String> map) {
		String id = (String)map.get("id");
		String result = service.IsExistId(id);
		map.put("msg", result);
		return map;
	}

	@RequestMapping(value = "memberProc")
	public String memberProc(MemberDTO member, PostcodeDTO post, Model model) {
		String msg = service.memberProc(member, post);
		model.addAttribute("msg", msg);
		return "forward:/home?formpath=member";
	}

}

