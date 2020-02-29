package com.hotel.Service;


public class LoginformGetterSetter {
	
	private String user_name;
	private String user_type;
	private String user_password;
	private int roll_id;
	private String user_email;
	private String assignedRoll;
	
	public String getAssignedRoll() {
		return assignedRoll;
	}
	public void setAssignedRoll(String assignedRoll) {
		this.assignedRoll = assignedRoll;
	}
	public int getRoll_id() {
		return roll_id;
	}
	public void setRoll_id(int rollId) {
		roll_id = rollId;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	
	public String getUser_email(){
		return user_email;
	}
	public void setUser_email(String user_email){
		this.user_email = user_email;
		
	}

}
