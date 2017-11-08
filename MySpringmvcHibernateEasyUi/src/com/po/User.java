package com.po;

import org.springframework.stereotype.Component;

@Component
public class User implements java.io.Serializable {

	private Integer id;
	private String username;
	private String password;

	public User() {
	}

	public User(String username, String pwd) {
		this.username = username;
		this.password = pwd;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}