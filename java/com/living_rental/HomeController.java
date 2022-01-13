package com.living_rental;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.living_rental.board.dto.BoardDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
	public String index(Model model, @RequestParam String formpath,
						@RequestParam(required = false) String modifyId, HttpSession session) {

		model.addAttribute("formpath", formpath);

		if( ("modifyCheck".equals(formpath) || "memberDelete".equals(formpath))
				&& session.getAttribute("modifyId") == null) {
			session.setAttribute("modifyId", modifyId);
			logger.warn("modifyId : " + modifyId);
		}
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
	@RequestMapping(value = "/memberDelete")
	public String memberDelete() {
		return "member/deleteForm";
	}
	@RequestMapping(value = "/modifyCheck")
	public String modifyCheck() {
		return "member/modifyCheckForm";
	}
	@RequestMapping(value = "/memberModify")
	public String memberUpdate() {
		return "member/memberModifyForm";
	}
	@RequestMapping(value = "/memberList")
	public String memberList() {
		return "member/memberListForm";
	}
	@RequestMapping(value = "/userInfo")
	public String userInfo() {
		return "member/userInfoForm";
	}
	@Autowired HttpSession session;
	public String checkSession(String url) {
		String id = (String)session.getAttribute("id");
		if(id == null)
			return "member/loginForm";
		return url;
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

	@RequestMapping(value = "/goodsModify")
	public String goodsModify() {
		return "goods/goodsViewForm";
	}

	@RequestMapping(value = "/basket")
	public String basket() {
		return "order/basketForm";
	}

	@RequestMapping(value = "/board")
	public String board() {
		return "board/boardForm";
	}

	@RequestMapping(value = "/view")
	public String view() {
		String url = checkSession("board/viewForm");
		return url;
	}
	@RequestMapping(value = "/write")
	public String write() {
		String url = checkSession("board/writeForm");
		return url;
	}

	@RequestMapping(value = "modify")
	public String modify(Model model, BoardDTO board) {
		String url = checkSession("board/modifyForm");
		model.addAttribute("board", board); //modifyForm.jsp에서 출력할 데이터
		return url;
	}

	@RequestMapping(value = "delete")
	public String delete(Model model, String proc, HttpServletRequest req) {
		String url = checkSession("board/deleteForm");
		if(proc == null) {
			return "forward:boardProc";
		}

		if(proc.equals("deleteProc")) {
			model.addAttribute("no", req.getParameter("no"));
		}else {
			model.addAttribute("checks", req.getParameterValues("checks"));
		}

		model.addAttribute("proc", proc);
		return url;
	}
}
