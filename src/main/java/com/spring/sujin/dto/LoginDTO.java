/*
 	userno int AI PK 
	id varchar(45) 
	password varchar(45) 
	name varchar(45)
 */

package com.spring.sujin.dto;

public class LoginDTO {
	private int userno;
	private String id;
	private String password;
	private String name;
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "LoginDTO [userno=" + userno + ", id=" + id + ", password=" + password + ", name=" + name + "]";
	}
	
	
}
