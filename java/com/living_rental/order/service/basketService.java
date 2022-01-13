package com.living_rental.order.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface basketService {
	/* 제품 번호로 검색 */
	public String basketRegistProc(String gdsNum);
	
	public void basketListProc(Model model, HttpSession session);
	
	public void basketDeleteProc(String gdsNum);
}
