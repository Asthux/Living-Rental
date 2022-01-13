package com.living_rental.goods.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.living_rental.goods.dto.goodsDTO;

@Repository
public interface goodsDAO {
	public void registProc(goodsDTO goods);
	
	public ArrayList<goodsDTO> goodsListProc();
	
	public goodsDTO goodsViewProc(int num);
	
	public void goodsModifyProc(goodsDTO goods);
	
	public void goodsDeleteProc(int num);
}