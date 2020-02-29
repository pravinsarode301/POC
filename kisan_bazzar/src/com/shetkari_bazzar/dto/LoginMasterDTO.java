/**
 * 
 */
package com.shetkari_bazzar.dto;

/**
 * @author PravTej
 *
 */
public class LoginMasterDTO {

	private int userId;
	private String username;
	private String welcomeName;
	private String password;
	private String user_role;
	private String special_auth_password;
	private String random_password;
	private int returnIntStatus;
	
	
	
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
	 * @return the user_role
	 */
	public String getUser_role() {
		return user_role;
	}
	/**
	 * @param user_role the user_role to set
	 */
	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}
	/**
	 * @return the special_auth_password
	 */
	public String getSpecial_auth_password() {
		return special_auth_password;
	}
	/**
	 * @param special_auth_password the special_auth_password to set
	 */
	public void setSpecial_auth_password(String special_auth_password) {
		
		
		
		this.special_auth_password = special_auth_password;
	}
	/**
	 * @return the random_password
	 */
	public String getRandom_password() {
		return random_password;
	}
	/**
	 * @param random_password the random_password to set
	 */
	public void setRandom_password(String random_password) {
		this.random_password = random_password;
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
	 * @return the returnIntStatus
	 */
	public int getReturnIntStatus() {
		return returnIntStatus;
	}
	/**
	 * @param returnIntStatus the returnIntStatus to set
	 */
	public void setReturnIntStatus(int returnIntStatus) {
		this.returnIntStatus = returnIntStatus;
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
