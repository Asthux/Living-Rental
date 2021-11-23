package com.living_rental.goods.dto;

/*
SQL> create table goods(
  2  gdsNum number,
  3  gdsName varchar2(30),
  4  cateName varchar2(20),
  5  gdsPrice varchar2(30),
  6  gdsThumb varchar2(200),
  7  gdsImg varchar2(200),
  8  primary key(gdsNum));
*/
public class goodsDTO {
	private int gdsNum;
	private String gdsName;
	private String gdsPrice;
	private String gdsThumb;
	private String gdsImg;
	private String cateName;
	
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGodsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	public String getGdsName() {
		return gdsName;
	}
	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}
	public String getGdsPrice() {
		return gdsPrice;
	}
	public void setGdsPrice(String gdsPrice) {
		this.gdsPrice = gdsPrice;
	}
	public String getGdsThumb() {
		return gdsThumb;
	}
	public void setGdsThumb(String gdsThumb) {
		this.gdsThumb = gdsThumb;
	}
	public String getGdsImg() {
		return gdsImg;
	}
	public void setGdsImg(String gdsImg) {
		this.gdsImg = gdsImg;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	
}
