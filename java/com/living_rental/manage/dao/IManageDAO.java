package com.living_rental.manage.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.living_rental.manage.dto.AllDTO;
import com.living_rental.manage.dto.LoginDTO;
import com.living_rental.manage.dto.MemberDTO;
import com.living_rental.manage.dto.PostcodeDTO;


@Repository
public interface IManageDAO {
	public int IsExistId(String id);
	public void insertLogin(LoginDTO login);
	public void insertMember(MemberDTO member);
	public void insertPost(PostcodeDTO post);

	public int memberCount();
	
	public ArrayList<MemberDTO> memberList(
			@Param("b")int begin, @Param("e")int end, 
			@Param("sel")String select, @Param("search")String search
			);


	public MemberDTO userInfo(String id);
	public PostcodeDTO userAddr(String id);
	public LoginDTO userPassword(String id);
	public void memberModifyProc(AllDTO all);
	public void updateLogin(LoginDTO login);
	public void updateMember(MemberDTO member);
	public void updatePost(PostcodeDTO post);
	public void deleteProc(String modifyId);
}

