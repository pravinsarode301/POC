/**
 * 
 */
package com.shetkari_bazzar.dto;

/**
 * @author PravTej
 *
 */
public class LoginDTO {

	private int userId;
	private String username;
	private String password;
	private String role;
	private String specialAuthPassword;
	private boolean loginStatus;
	private String randompass;
	private String welcomeName;
 	
	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return the role
	 */
	public String getRole() {
		return role;
	}
	/**
	 * @param role the role to set
	 */
	public void setRole(String role) {
		this.role = role;
	}
	/**
	 * @return the specialAuthPassword
	 */
	public String getSpecialAuthPassword() {
		return specialAuthPassword;
	}
	/**
	 * @param specialAuthPassword the specialAuthPassword to set
	 */
	public void setSpecialAuthPassword(String specialAuthPassword) {
		this.specialAuthPassword = specialAuthPassword;
	}
	/**
	 * @return the loginStatus
	 */
	public boolean isLoginStatus() {
		return loginStatus;
	}
	/**
	 * @param loginStatus the loginStatus to set
	 */
	public void setLoginStatus(boolean loginStatus) {
		this.loginStatus = loginStatus;
	}
	/**
	 * @return the randompass
	 */
	public String getRandompass() {
		return randompass;
	}
	/**
	 * @param randompass the randompass to set
	 */
	public void setRandompass(String randompass) {
		this.randompass = randompass;
	}
	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}
	/**
	 * @return the welcomeName
	 */
	public String getWelcomeName() {
		return welcomeName;
	}
	/**
	 * @param welcomeName the welcomeName to set
	 */
	public void setWelcomeName(String welcomeName) {
		this.welcomeName = welcomeName;
	}
	
	
	
	
	
	
	
	
}
