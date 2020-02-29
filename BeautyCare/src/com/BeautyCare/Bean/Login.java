package com.BeautyCare.Bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * @author pravtej
 *
 */

@Entity
@Table(name = "LOGIN_TABLE")
public class Login {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "LOGIN_ID")
	private int id;
	@Column(name = "USER_NAME")
	private String username;
	@Column(name = "PASSWORD") 
	private String password;
	
	@Transient
	private String rePassword;
	
	@Column(name = "ROLE")
	@Enumerated(EnumType.STRING)
	private userType role;

	public enum userType {

		ROLE_USER, ROLE_ADMIN;

	}
	
	
	public Login() {
		// TODO Auto-generated constructor stub
	}


	public Login(int id, String username, String password, userType role) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		
		this.role = role;
	}

	
	
	
	

	public Login(int id, String username, String password, String rePassword, userType role) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.rePassword = rePassword;
		this.role = role;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getUsername() {
		return username;
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


	public userType getRole() {
		return role;
	}


	public void setRole(userType role) {
		this.role = role;
	}


	public String getRePassword() {
		return rePassword;
	}


	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}
	
	
	
	
	
	
	
	
	
	
	
}
