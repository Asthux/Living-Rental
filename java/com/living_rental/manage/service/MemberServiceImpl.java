package com.living_rental.manage.service;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


import com.living_rental.manage.config.PageConfig;
import com.living_rental.manage.dao.IManageDAO;
import com.living_rental.manage.dto.AllDTO;
import com.living_rental.manage.dto.LoginDTO;
import com.living_rental.manage.dto.MemberDTO;
import com.living_rental.manage.dto.PostcodeDTO;

@Service
public class MemberServiceImpl implements IMemberService{
	
	

	
	@Autowired
	IManageDAO dao;

	@Override
	public String IsExistId(String id) {
		int count = dao.IsExistId(id);
		if(count == 0)
			return "사용 가능한 아이디입니다.";
		return "중복 아이디입니다.";
	}

	@Override
	public String memberProc(MemberDTO member, PostcodeDTO post) {
		Boolean check = (Boolean)session.getAttribute("authState");
		if(check == null) {
			return "이메일 인증 후 가입 할 수 있습니다.";
		}
		LoginDTO login = member;
		if(login.getId() == "" || login.getPw() == "")
			return "필수 정보입니다.";
		if(dao.IsExistId(login.getId()) > 0)
			return  "중복 아이디입니다.";

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(login.getPw());
		login.setPw(securePw);

		dao.insertLogin(login);
		if("m".equals(member.getGender()) ||  "w".equals(member.getGender()) || 
				member.getBirth() != null || member.getName() != null || member.getPhone() != null || member.getEmail() != null)
			dao.insertMember(member);
		if(! "".equals(post.getZipcode())) {
			dao.insertPost(post);
		}
		session.removeAttribute("authState");
		return "가입 완료";
	}


	final static Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Autowired HttpSession session;
	@Autowired MailService mailService;
	@Override
	public void sendAuth(String email) {
		String authNum = (String)session.getAttribute("authNum");
		if(authNum == null) {
			Random r = new Random();
			String randNum = String.format("%06d", r.nextInt(1000000));
			session.setAttribute("authNum", randNum);
			session.setMaxInactiveInterval(180);
			mailService.sendMail(email, "[인증번호]", randNum);
			logger.warn(randNum);

		}else
			logger.warn("인증번호는 생성되어 있음.");
	}

	@Override
	public String authConfirm(String inputAuthNum) {
		String sessionAuthNum = (String)session.getAttribute("authNum");
		if(sessionAuthNum == null)
			return "인증 번호를 생성하세요.";
		if(inputAuthNum == "")
			return "인증 번호를 입력하세요.";
		if(inputAuthNum.equals(sessionAuthNum)) {
			session.setAttribute("authState", true);
			return "인증 완료";
		}
		return "인증 실패";
	}


	@Override
	public void memberList(Model model, int currentPage, String select, String search) {
		int pageBlock = 5;
		int totalCount = dao.memberCount();
		int end = currentPage * pageBlock;
		int begin = end+1 - pageBlock;
		ArrayList<MemberDTO> list = dao.memberList(begin, end, select, search);
		model.addAttribute("list", list);

		String url = "/living_rental/memberListProc?currentPage=";
		model.addAttribute("page", PageConfig.getNavi(currentPage, pageBlock, totalCount, url));
	}



	@Override
	public AllDTO userInfo(String id) {

		MemberDTO member = dao.userInfo(id);
		PostcodeDTO post = dao.userAddr(id);
		AllDTO all = new AllDTO();
		if(member != null ) {
			all.setId(member.getId());
			all.setEmail(member.getEmail());
			all.setGender(member.getGender());
			all.setName(member.getName());
			all.setBirth(member.getBirth());
			all.setPhone(member.getPhone());
		}
		if(post != null) {
			all.setZipcode(post.getZipcode());
			all.setAddr1(post.getAddr1());
			all.setAddr2(post.getAddr2());
		}
		return all;
	}



	@Value("${ADMIN:admin}") String adminAccount;

	@Override
	public void memberModifyProc(AllDTO all) {
		BCryptPasswordEncoder encode = new BCryptPasswordEncoder();
		AllDTO oldData = (AllDTO)session.getAttribute("modifyAll");
		all.setId(oldData.getId());

		if(all.getPw() != "") {
			String securePw = encode.encode(all.getPw());
			LoginDTO login = all;
			login.setPw(securePw);
			dao.updateLogin(login);
		}

		if(all.getEmail() != "" && all.getEmail().equals(oldData.getEmail())== false ||
				all.getBirth() !="" && all.getBirth().equals(oldData.getBirth())== false ||
				all.getPhone() !="" && all.getPhone().equals(oldData.getPhone())== false) {
			MemberDTO member = all;
			dao.updateMember(member);
		}

		if(all.getZipcode() != "" && all.getZipcode().equals(oldData.getZipcode()) == false) {
			PostcodeDTO post = new PostcodeDTO();
			post.setId(all.getId());
			post.setZipcode(all.getZipcode());
			post.setAddr1(all.getAddr1());
			post.setAddr2(all.getAddr2());
			dao.updatePost(post);
		}
		String sessionId = (String)session.getAttribute("id");
		
		session.removeAttribute("modifyId");
		if(adminAccount.equals(sessionId) == false)
			session.invalidate();
	}

	public LoginDTO passwordCheck(LoginDTO check) {
		if(check.getPw().equals(check.getPwOk()) == false)
			return null;

		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();

		
		LoginDTO login = dao.userPassword(check.getId());
		if(login == null || bpe.matches(check.getPw(), login.getPw()) == false)
			return null;
		return login;
	}

	@Override
	public boolean deleteAndCheckProc(LoginDTO check) {
		String sessionId = (String)session.getAttribute("id");
		check.setId(sessionId);

		LoginDTO login = passwordCheck(check) ;
		if(login == null) 
			return false;
		
		String modifyId = (String)session.getAttribute("modifyId");
		dao.deleteProc(modifyId);

		session.removeAttribute("modifyId");
		if(adminAccount.equals(sessionId) == false)
			session.invalidate();
		return true;
	}

	@Override
	public boolean modifyCheckProc(LoginDTO check) {
		String sessionId = (String)session.getAttribute("id");
		check.setId(sessionId);
		LoginDTO login = passwordCheck(check) ;
		if(login == null) 
			return false;	
		String modifyId = (String)session.getAttribute("modifyId");
		AllDTO all = userInfo(modifyId);
		all.setPw(login.getPw());
		session.setAttribute("modifyAll", all); 
		return true;
	}

}
