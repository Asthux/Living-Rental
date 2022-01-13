package com.living_rental.board.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.living_rental.board.dao.IBoardDAO;
import com.living_rental.board.dto.BoardDTO;
import com.living_rental.manage.config.PageConfig;
import com.living_rental.manage.dto.LoginDTO;
import com.living_rental.manage.service.MemberServiceImpl;


@Service
public class BoardServiceImpl implements IBoardService{
	@Autowired IBoardDAO mapper;
	@Value("${ADMIN:admin}") String adminAccount;
	@Override
	public void writeProc(MultipartHttpServletRequest req) {
		String id = (String)session.getAttribute("id");
		String satify= req.getParameter("satisfy");
		String title = req.getParameter("title");
		String content= req.getParameter("content");
		
		
		BoardDTO board = new BoardDTO();
		board.setId(id);	board.setSatisfy(satify);	board.setTitle(title);
		board.setContent(content);		board.setHit(0);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		board.setWriteDate(sdf.format(date));
		
		MultipartFile file = req.getFile("fileName");
		if(file.getSize() != 0) {
			Calendar cal = Calendar.getInstance();
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			String fileName = sdf.format(cal.getTime()) + file.getOriginalFilename();
			board.setFileName(fileName);
			File save = new File(IBoardService.FILE_LOCATION + "\\" + fileName);
			try {
				file.transferTo(save);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}else {
			board.setFileName("파일 없음");
		}
		mapper.writeProc(board);
	}

	@Override
	public void boardProc(Model model, int currentPage, String search, String select, HttpServletRequest req) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("select", select);
		
		int totalCount = mapper.boardCount(map);
		int pageBlock = 10;
		int end = currentPage * pageBlock;
		int begin = end+1 - pageBlock;

		ArrayList<BoardDTO> boardList = mapper.boardProc(begin, end, select, search);
		model.addAttribute("boardList", boardList);

		String url = req.getContextPath() + "/boardProc?";
		if(select != null) {
			url+="select="+select+"&";
			url+="search="+search+"&";	
		}
			url+="currentPage=";
		model.addAttribute("page", PageConfig.getNavi(currentPage, pageBlock, totalCount, url));
	}

	@Override
	public void viewProc(int no, Model model) {
		BoardDTO board = mapper.viewProc(no);
		model.addAttribute("board", board);
	}
	
	@Override
	public void upHit(int no) {
		mapper.upHit(no);
	}
	@Autowired HttpSession session;
	
	@Override
	public boolean modifyProc(BoardDTO board) {
		
		int result = mapper.modifyProc(board);
		if(result == 0)
			return false;
		return true;
	}
	
	@Autowired MemberServiceImpl memberService;
	
	private boolean pwcheck(String pw, String pwOk) {
		if(pw == "" || pw == null)
			return false;
	
		// 회원DB에서 게시글 작성자의 PW와 입력 패스워드 비교 
		LoginDTO check = new LoginDTO();
		check.setId((String)session.getAttribute("id"));
		check.setPw(pw);
		check.setPwOk(pwOk);
		check = memberService.passwordCheck(check);
		if(check == null)
			return false;
		
		return true;
	}
	
	private void deleteImage(String fileName) {
		File deleteFile = new File(FILE_LOCATION+"/"+fileName);
		deleteFile.delete();
	}

	@Override
	public boolean deleteProc(String pw, String pwOk, String n) {
		boolean check = pwcheck(pw, pwOk);
		if(check == false)
			return false;
		
		int no = Integer.parseInt(n);
		
		String fileName = mapper.getFileName(no);
		int result = mapper.deleteProc(no);
		if(result == 0)
			return false;
		deleteImage(fileName);
		return true;
	}
	
	@Override
	public boolean deletes(String pw, String pwOk, String[] checks) {
		boolean check = pwcheck(pw, pwOk);
		if(check == false)
			return false;
		if(checks == null) 
			return false;
		
		for(String n : checks) {
			int no = Integer.parseInt(n);
			String fileName = mapper.getFileName(no);
			mapper.deleteProc(no);
			deleteImage(fileName);
		}

		return true;
	}


}
