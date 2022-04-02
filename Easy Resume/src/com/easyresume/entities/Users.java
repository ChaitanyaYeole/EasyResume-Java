package com.easyresume.entities;
import java.sql.*;
public class Users {
	
	private int id;
	private String name;
	private String email;
	private String password;
	private Timestamp signup_date;
	
	public Users(int id, String name, String email, String password, Timestamp signup_date) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.signup_date = signup_date;
	}

	public Users(String name, String email, String password) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
	}

	public Users() {
		super();
	}

	//getters and setters
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Timestamp getSignup_date() {
		return signup_date;
	}

	public void setSignup_date(Timestamp signup_date) {
		this.signup_date = signup_date;
	}
	
	
	
	
	
	
}
