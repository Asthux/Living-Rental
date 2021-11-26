package com.living_rental.order.dao;

import org.springframework.stereotype.Repository;

import com.living_rental.goods.dto.goodsDTO;
import com.living_rental.order.dto.basketDTO;


@Repository
public interface basketDAO {
	public void basketProc(basketDTO basket);
	
	public goodsDTO selectProc(int num);
	
	public basketDTO basketCheckProc(int num);
}
