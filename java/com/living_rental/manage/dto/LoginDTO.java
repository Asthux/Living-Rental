package com.living_rental.manage.dto;
public class LoginDTO {
	private String id;
	private String pw;
	private String pwOk;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPw() {
		return pw;
	}
	public void setPwOk(String pwOk) {
		this.pwOk = pwOk;
	}
	public String getPwOk() {
		return pwOk;
	}

}
