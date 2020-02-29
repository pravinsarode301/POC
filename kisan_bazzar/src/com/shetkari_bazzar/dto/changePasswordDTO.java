/**
 * 
 */
package com.shetkari_bazzar.dto;

/**
 * @author PravTej
 *
 */
public class changePasswordDTO {
private String oldPassword;
private String newPassword;
private String reNewPassword;
private String UserName;
/**
 * @return the oldPassword
 */
public String getOldPassword() {
	return oldPassword;
}
/**
 * @param oldPassword the oldPassword to set
 */
public void setOldPassword(String oldPassword) {
	this.oldPassword = oldPassword;
}
/**
 * @return the newPassword
 */
public String getNewPassword() {
	return newPassword;
}
/**
 * @param newPassword the newPassword to set
 */
public void setNewPassword(String newPassword) {
	this.newPassword = newPassword;
}
/**
 * @return the reNewPassword
 */
public String getReNewPassword() {
	return reNewPassword;
}
/**
 * @param reNewPassword the reNewPassword to set
 */
public void setReNewPassword(String reNewPassword) {
	this.reNewPassword = reNewPassword;
}
/**
 * @return the userName
 */
public String getUserName() {
	return UserName;
}
/**
 * @param userName the userName to set
 */
public void setUserName(String userName) {
	UserName = userName;
}

	



}
