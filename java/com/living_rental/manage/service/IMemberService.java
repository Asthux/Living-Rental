package com.living_rental.manage.service;



import org.springframework.ui.Model;


import com.living_rental.manage.dto.AllDTO;
import com.living_rental.manage.dto.LoginDTO;
import com.living_rental.manage.dto.MemberDTO;
import com.living_rental.manage.dto.PostcodeDTO;



public interface IMemberService {

	public String IsExistId(String id);
	
	public String memberProc(MemberDTO member, PostcodeDTO post);
	
	
	public void sendAuth(String email);
	
	public String authConfirm(String authNum);
	
	
	public void memberList(Model model, int currentPage, String select, String search);

	public MemberDTO userInfo(String id);


	public boolean deleteAndCheckProc(LoginDTO check);
	
	
	public boolean modifyCheckProc(LoginDTO check);
	
	public void memberModifyProc(AllDTO all);
}
