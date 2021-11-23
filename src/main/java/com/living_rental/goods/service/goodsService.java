package com.living_rental.goods.service;


import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface goodsService {
	//업로드 이미지 저장 경로 : 프로젝트 안의 webapp\\resources\\upload
	String FILE_LOCATION = "E:\\eclipse\\springworkspace\\living_rental\\src\\main\\webapp\\resources\\upload";
	
	void registProc(MultipartHttpServletRequest req);
	
	void goodsListProc(Model model);
	
	void goodsViewProc(String gdsNum, Model model);
	
}
