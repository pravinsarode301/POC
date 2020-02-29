/**
 * 
 */
package com.shetkari_bazzar.dto;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Random;

import com.shetkari_bazzar.dao.EncryptionUtility;

/**
 * @author PravTej
 *
 */
/**
 * @author PravTej
 *
 */
public class subAdminDTO {

	private String subAdminFirstName;
	private String subAdminMiddleName;
	private String subAdminLastName;
	//private String subAdminMobileNumber;
	private String subAdminUserName;
	private String subAdminEmailId;
	private String subAdminLandmark;
	private String subAdminCity;
	private Long subAdminContactNumber;
	private String subAdminDivision;
	private String subAdminState;
	private String subAdminCountry;
	private String subAdminProfilePic;
	private int subAdminPrivillages;
	private String subAdminRole;
 private String subAdminGender;
 private String subAdminAddress;
 private String subAdminCreatedBy;
 private Timestamp currentTimeStamp;
 private String subAdminPassword;
	/**
	 * @return the subAdminFirstName
	 */
	public String getSubAdminFirstName() {
		return subAdminFirstName;
	}
	/**
	 * @param subAdminFirstName the subAdminFirstName to set
	 */
	public void setSubAdminFirstName(String subAdminFirstName) {
		this.subAdminFirstName = subAdminFirstName;
	}
	/**
	 * @return the subAdminMiddleName
	 */
	public String getSubAdminMiddleName() {
		return subAdminMiddleName;
	}
	/**
	 * @param subAdminMiddleName the subAdminMiddleName to set
	 */
	public void setSubAdminMiddleName(String subAdminMiddleName) {
		this.subAdminMiddleName = subAdminMiddleName;
	}
	/**
	 * @return the subAdminLastName
	 */
	public String getSubAdminLastName() {
		return subAdminLastName;
	}
	/**
	 * @param subAdminLastName the subAdminLastName to set
	 */
	public void setSubAdminLastName(String subAdminLastName) {
		this.subAdminLastName = subAdminLastName;
	}
	/**
	 * @return the subAdminUserName
	 */
	public String getSubAdminUserName() {
		return subAdminUserName;
	}
	/**
	 * @param subAdminUserName the subAdminUserName to set
	 */
	public void setSubAdminUserName(String subAdminUserName) {
		this.subAdminUserName = subAdminUserName+"@shetkari-bazzar.com";
	}
	/**
	 * @return the subAdminEmailId
	 */
	public String getSubAdminEmailId() {
		return subAdminEmailId;
	}
	/**
	 * @param subAdminEmailId the subAdminEmailId to set
	 */
	public void setSubAdminEmailId(String subAdminEmailId) {
		this.subAdminEmailId = subAdminEmailId;
	}
	/**
	 * @return the subAdminLandmark
	 */
	public String getSubAdminLandmark() {
		return subAdminLandmark;
	}
	/**
	 * @param subAdminLandmark the subAdminLandmark to set
	 */
	public void setSubAdminLandmark(String subAdminLandmark) {
		this.subAdminLandmark = subAdminLandmark;
	}
	/**
	 * @return the subAdminCity
	 */
	public String getSubAdminCity() {
		return subAdminCity;
	}
	/**
	 * @param subAdminCity the subAdminCity to set
	 */
	public void setSubAdminCity(String subAdminCity) {
		this.subAdminCity = subAdminCity;
	}
	/**
	 * @return the subAdminContactNumber
	 */
	public Long getSubAdminContactNumber() {
		return subAdminContactNumber;
	}
	/**
	 * @param subAdminContactNumber the subAdminContactNumber to set
	 */
	public void setSubAdminContactNumber(Long subAdminContactNumber) {
		this.subAdminContactNumber = subAdminContactNumber;
	}
	/**
	 * @return the subAdminDivision
	 */
	public String getSubAdminDivision() {
		return subAdminDivision;
	}
	/**
	 * @param subAdminDivision the subAdminDivision to set
	 */
	public void setSubAdminDivision(String subAdminDivision) {
		this.subAdminDivision = subAdminDivision;
	}
	/**
	 * @return the subAdminState
	 */
	public String getSubAdminState() {
		return subAdminState;
	}
	/**
	 * @param subAdminState the subAdminState to set
	 */
	public void setSubAdminState(String subAdminState) {
		this.subAdminState = subAdminState;
	}
	/**
	 * @return the subAdminCountry
	 */
	public String getSubAdminCountry() {
		return subAdminCountry;
	}
	/**
	 * @param subAdminCountry the subAdminCountry to set
	 */
	public void setSubAdminCountry(String subAdminCountry) {
		this.subAdminCountry = subAdminCountry;
	}
	/**
	 * @return the subAdminProfilePic
	 */
	public String getSubAdminProfilePic() {
		return subAdminProfilePic;
	}
	/**
	 * @param subAdminProfilePic the subAdminProfilePic to set
	 */
	public void setSubAdminProfilePic(String subAdminProfilePic) {
		this.subAdminProfilePic = subAdminProfilePic;
	}
	/**
	 * @return the subAdminPrivillages
	 */
	public int getSubAdminPrivillages() {
		return subAdminPrivillages;
	}
	/**
	 * @param subAdminPrivillages the subAdminPrivillages to set
	 */
	public void setSubAdminPrivillages(int subAdminPrivillages) {
		this.subAdminPrivillages = subAdminPrivillages;
	}
	/**
	 * @return the subAdminRole
	 */
	public String getSubAdminRole() {
		return subAdminRole="ADMIN(COMPANY)-USER";
	}
	/**
	 * @param subAdminRole the subAdminRole to set
	 */
	public void setSubAdminRole(String subAdminRole) {
		
		this.subAdminRole = subAdminRole;
	}
	
	
	/**
	 * @return the subAdminGender
	 */
	public String getSubAdminGender() {
		return subAdminGender;
	}
	/**
	 * @param subAdminGender the subAdminGender to set
	 */
	public void setSubAdminGender(String subAdminGender) {
		this.subAdminGender = subAdminGender;
	}
	/**
	 * @return the subAdminAddress
	 */
	public String getSubAdminAddress() {
		return subAdminAddress;
	}
	/**
	 * @param subAdminAddress the subAdminAddress to set
	 */
	public void setSubAdminAddress(String subAdminAddress) {
		this.subAdminAddress = subAdminAddress;
	}
	
	/**
	 * @return the subAdminCreatedBy
	 */
	public String getSubAdminCreatedBy() {
		return subAdminCreatedBy;
	}
	/**
	 * @param subAdminCreatedBy the subAdminCreatedBy to set
	 */
	public void setSubAdminCreatedBy(String subAdminCreatedBy) {
		this.subAdminCreatedBy = subAdminCreatedBy;
	}
	
	
	
	/**
	 * @return the currentTimeStamp
	 */
	public Timestamp getCurrentTimeStamp() {
		return currentTimeStamp;
	}
	/**
	 * @param currentTimeStamp the currentTimeStamp to set
	 */
	public void setCurrentTimeStamp() {
		
		java.util.Date date= new java.util.Date();
		 
		
		this.currentTimeStamp = new Timestamp(date.getTime());
	}
	/**
	 * @return the subAdminPassword
	 */
	public String getSubAdminPassword() {
		return subAdminPassword;
	}
	/**
	 * @param subAdminPassword the subAdminPassword to set
	 */
	public void setSubAdminPassword(String subAdminPassword) {
		
	/*String	password=subAdminPassword;
		 MessageDigest md=null;
		try {
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	        md.update(password.getBytes());
	        
	        byte byteData[] = md.digest();
	 
	        //convert the byte to hex format method 1
	        StringBuffer sb = new StringBuffer();
	        for (int i = 0; i < byteData.length; i++) {
	         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
	        }*/
		
		//this.subAdminPassword=sb.toString();
		
		this.subAdminPassword=EncryptionUtility.MD5(subAdminPassword);
	
	
	}
	
	
	
}
