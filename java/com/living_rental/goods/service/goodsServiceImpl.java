package com.living_rental.goods.service;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.living_rental.goods.dao.goodsDAO;
import com.living_rental.goods.dto.goodsDTO;

@Service
public class goodsServiceImpl implements goodsService {	
	private static final Logger logger = LoggerFactory.getLogger(goodsServiceImpl.class);
	@Autowired goodsDAO mapper;
	
	@Override
	public void registProc(MultipartHttpServletRequest req) {
		String name = req.getParameter("gdsName");
		String category = req.getParameter("cateName");
		String price = req.getParameter("gdsPrice");
		
		goodsDTO goods = new goodsDTO();
		goods.setGdsName(name);
		goods.setCateName(category);
		goods.setGdsPrice(price);
		
		MultipartFile thumbFile = req.getFile("gdsThumb");
		if(thumbFile.getSize() != 0) {
			String thumbName = thumbFile.getOriginalFilename();
			goods.setGdsThumb(thumbName);
			
			File thumbSave = new File(goodsService.FILE_LOCATION + "\\" + thumbName);
			try {
				thumbFile.transferTo(thumbSave);
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
		else {
			goods.setGdsThumb("이미지 없음");
		}
		
		
		MultipartFile imgFile = req.getFile("gdsImg");
		if(imgFile.getSize() != 0) {
			String imgName = imgFile.getOriginalFilename();
			goods.setGdsImg(imgName);
				
			File imgSave = new File(goodsService.FILE_LOCATION + "\\" + imgName);
			try {
				imgFile.transferTo(imgSave);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		else {
			goods.setGdsImg("이미지 없음");
		}
		mapper.registProc(goods);
	}
	
	@Override
	public void goodsListProc(Model model) {
		ArrayList<goodsDTO> goodsList = mapper.goodsListProc();
		model.addAttribute("goodsList", goodsList);
	}

	@Override
	public void goodsViewProc(String gdsNum, Model model) {
		int no = Integer.parseInt(gdsNum);
		goodsDTO goods = mapper.goodsViewProc(no);
		model.addAttribute("goods", goods);
	}
	
	
	
}
