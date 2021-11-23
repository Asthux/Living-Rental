package com.living_rental.order.dto;
/*
 SQL> create table basket(
	  2  id varchar2(20),
	  3  gdsNum int,
	  4  gdsName varchar2(30),
	  5	 gdsPrice varchar2(30),
	  6	 gdsThumb varchar2(200),
	  7  primary key (id),
	  8  foreign key (gdsNum) references goods (gdsNum));
*/

public class basketDTO {
	private String id;
	private int gdsNum;
	private String gdsName;
	private String gdsPrice;
	private String gdsThumb;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
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
	
}
