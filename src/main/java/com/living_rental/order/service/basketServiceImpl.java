package com.living_rental.order.service;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.living_rental.goods.dto.goodsDTO;
import com.living_rental.order.dao.basketDAO;
import com.living_rental.order.dto.basketDTO;


@Service
public class basketServiceImpl implements basketService {
	private static final Logger logger = LoggerFactory.getLogger(basketServiceImpl.class);
	@Autowired HttpSession session;
	@Autowired basketDAO mapper;

	@Override
	public String basketProc(String gdsNum) {
		
		String id = (String)session.getAttribute("id");
		int num = Integer.parseInt(gdsNum);
	
		/* 제품 번호로 디비에서 정보 가져오기 */
		goodsDTO goods = mapper.selectProc(num);
		
		basketDTO check = mapper.basketCheckProc(num);
		if(check == null || goods.getGdsNum() != check.getGdsNum()) {
			basketDTO basket = new basketDTO();
			
			basket.setId(id);
			basket.setGdsNum(goods.getGdsNum());
			basket.setGdsName(goods.getGdsName());
			basket.setGdsPrice(goods.getGdsPrice());
			basket.setGdsThumb(goods.getGdsThumb());
		
			mapper.basketProc(basket);
			
			return "'상품을 장바구니에 담았습니다.'";
		}
		
		if(goods.getGdsNum() == check.getGdsNum()) {
			return "'이미 장바구니에 담은 상품입니다.'";
		}
		return "";
	}

	
	
	

}
