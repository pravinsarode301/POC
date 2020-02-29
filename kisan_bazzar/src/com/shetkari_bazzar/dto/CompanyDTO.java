package com.shetkari_bazzar.dto;

import java.io.File;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import com.shetkari_bazzar.dao.DateConvertor;
import com.shetkari_bazzar.dao.EncryptionUtility;
import com.shetkari_bazzar.dao.UserNameUtility;

public class CompanyDTO {

	private String companyUserName;
	private String companyCurrentAddress;
	private String companyRegisterAddress;
	private String companyName;
	private String companyRegId;
	private String authorisedPersonName;
	private Long authorisedPersonMobileNumber;
	private String authorisedPersonEmail;
	private String companyWebsite;
	private String companyEmail;
	private Long companyContactNumber;
	private Long companyFaxNumber;
	private String companyLandmark;
	private String companyCity;
	private String companyState;
	private String companyCountry;
	private String companyRegistrationDate;
	private String companyPassword;
	private String companyRepassword;
	private int companyId;
	private String profilePic;
	private String status;
	private Timestamp currentTimeStamp;
	private String CreatedBy;
	private int totalCompniesRegistred;
	private int innnerClassReturnStatus;
	private String companyRole;
	private String CompanyWelcomeName;
	private boolean returnStatus;
	
	

	/**
	 * @return the companyName
	 */
	public String getCompanyName() {
		return companyName;
	}

	/**
	 * @param companyName
	 *            the companyName to set
	 */
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	/**
	 * @return the companyRegId
	 */
	public String getCompanyRegId() {
		return companyRegId;
	}

	/**
	 * @param companyRegId
	 *            the companyRegId to set
	 */
	public void setCompanyRegId(String companyRegId) {
		this.companyRegId = companyRegId;
	}

	/**
	 * @return the authorisedPersonName
	 */
	public String getAuthorisedPersonName() {
		return authorisedPersonName;
	}

	/**
	 * @param authorisedPersonName
	 *            the authorisedPersonName to set
	 */
	public void setAuthorisedPersonName(String authorisedPersonName) {
		this.authorisedPersonName = authorisedPersonName;
	}

	/**
	 * @return the authorisedPersonMobileNumber
	 */
	public Long getAuthorisedPersonMobileNumber() {
		return authorisedPersonMobileNumber;
	}

	/**
	 * @param authorisedPersonMobileNumber
	 *            the authorisedPersonMobileNumber to set
	 */
	public void setAuthorisedPersonMobileNumber(Long authorisedPersonMobileNumber) {
		this.authorisedPersonMobileNumber = authorisedPersonMobileNumber;
	}

	/**
	 * @return the authorisedPersonEmail
	 */
	public String getAuthorisedPersonEmail() {
		return authorisedPersonEmail;
	}

	/**
	 * @param authorisedPersonEmail
	 *            the authorisedPersonEmail to set
	 */
	public void setAuthorisedPersonEmail(String authorisedPersonEmail) {
		this.authorisedPersonEmail = authorisedPersonEmail;
	}

	/**
	 * @return the companyWebsite
	 */
	public String getCompanyWebsite() {
		return companyWebsite;
	}

	/**
	 * @param companyWebsite
	 *            the companyWebsite to set
	 */
	public void setCompanyWebsite(String companyWebsite) {
		this.companyWebsite = companyWebsite;
	}

	/**
	 * @return the companyEmail
	 */
	public String getCompanyEmail() {
		return companyEmail;
	}

	/**
	 * @param companyEmail
	 *            the companyEmail to set
	 */
	public void setCompanyEmail(String companyEmail) {
		this.companyEmail = companyEmail;
	}

	/**
	 * @return the companyContactNumber
	 */
	public Long getCompanyContactNumber() {
		return companyContactNumber;
	}

	/**
	 * @param companyContactNumber
	 *            the companyContactNumber to set
	 */
	public void setCompanyContactNumber(Long companyContactNumber) {
		this.companyContactNumber = companyContactNumber;
	}

	/**
	 * @return the companyFaxNumber
	 */
	public Long getCompanyFaxNumber() {
		return companyFaxNumber;
	}

	/**
	 * @param companyFaxNumber
	 *            the companyFaxNumber to set
	 */
	public void setCompanyFaxNumber(Long companyFaxNumber) {
		this.companyFaxNumber = companyFaxNumber;
	}

	/**
	 * @return the companyLandmark
	 */
	public String getCompanyLandmark() {
		return companyLandmark;
	}

	/**
	 * @param companyLandmark
	 *            the companyLandmark to set
	 */
	public void setCompanyLandmark(String companyLandmark) {
		this.companyLandmark = companyLandmark;
	}

	/**
	 * @return the companyCity
	 */
	public String getCompanyCity() {
		return companyCity;
	}

	/**
	 * @param companyCity
	 *            the companyCity to set
	 */
	public void setCompanyCity(String companyCity) {
		this.companyCity = companyCity;
	}

	/**
	 * @return the companyState
	 */
	public String getCompanyState() {
		return companyState;
	}

	/**
	 * @param companyState
	 *            the companyState to set
	 */
	public void setCompanyState(String companyState) {
		this.companyState = companyState;
	}

	/**
	 * @return the companyCountry
	 */
	public String getCompanyCountry() {
		return companyCountry;
	}

	/**
	 * @param companyCountry
	 *            the companyCountry to set
	 */
	public void setCompanyCountry(String companyCountry) {
		this.companyCountry = companyCountry;
	}

	/**
	 * @return the companyRegistrationDate
	 */
	public String getCompanyRegistrationDate() {
		return companyRegistrationDate;
	}

	/**
	 * @param companyRegistrationDate
	 *            the companyRegistrationDate to set
	 */
	public void setCompanyRegistrationDate(String companyRegistrationDate) {

		this.companyRegistrationDate = companyRegistrationDate;
	}

	/**
	 * @return the companyPassword
	 */
	public String getCompanyPassword() {
		return companyPassword;
	}

	/**
	 * @param companyPassword
	 *            the companyPassword to set
	 */
	public void setCompanyPassword(String companyPassword) {
		this.companyPassword = EncryptionUtility.MD5(companyPassword);
	}

	/**
	 * @return the companyRepassword
	 */
	public String getCompanyRepassword() {
		return companyRepassword;
	}

	/**
	 * @param companyRepassword
	 *            the companyRepassword to set
	 */
	public void setCompanyRepassword(String companyRepassword) {
		this.companyRepassword = companyRepassword;
	}

	/**
	 * @return the companyId
	 */
	public int getCompanyId() {
		return companyId;
	}

	/**
	 * @param companyId
	 *            the companyId to set
	 */
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	/**
	 * @return the profilePic
	 */
	public String getProfilePic() {
		return profilePic;
	}

	/**
	 * @param profilePic
	 *            the profilePic to set
	 */
	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status
	 *            the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * @return the currentTimeStamp
	 */
	public Timestamp getCurrentTimeStamp() {
		return currentTimeStamp;
	}

	/**
	 * @param currentTimeStamp
	 *            the currentTimeStamp to set
	 */
	public void setCurrentTimeStamp() {

		java.util.Date date = new java.util.Date();

		this.currentTimeStamp = new Timestamp(date.getTime());
	}

	/**
	 * @return the createdBy
	 */
	public String getCreatedBy() {
		return CreatedBy;
	}

	/**
	 * @param createdBy
	 *            the createdBy to set
	 */
	public void setCreatedBy(String createdBy) {
		CreatedBy = createdBy;
	}

	/**
	 * @return the companyCurrentAddress
	 */
	public String getCompanyCurrentAddress() {
		return companyCurrentAddress;
	}

	/**
	 * @param companyCurrentAddress
	 *            the companyCurrentAddress to set
	 */
	public void setCompanyCurrentAddress(String companyCurrentAddress) {
		this.companyCurrentAddress = companyCurrentAddress;
	}

	/**
	 * @return the companyRegisterAddress
	 */
	public String getCompanyRegisterAddress() {
		return companyRegisterAddress;
	}

	/**
	 * @param companyRegisterAddress
	 *            the companyRegisterAddress to set
	 */
	public void setCompanyRegisterAddress(String companyRegisterAddress) {
		this.companyRegisterAddress = companyRegisterAddress;
	}

	/**
	 * @return the totalCompniesRegistred
	 */
	public int getTotalCompniesRegistred() {
		return totalCompniesRegistred;
	}

	/**
	 * @param totalCompniesRegistred the totalCompniesRegistred to set
	 */
	public void setTotalCompniesRegistred(int totalCompniesRegistred) {
		this.totalCompniesRegistred = totalCompniesRegistred;
	}

	/**
	 * @return the innnerClassReturnStatus
	 */
	public int getInnnerClassReturnStatus() {
		return innnerClassReturnStatus;
	}

	/**
	 * @param innnerClassReturnStatus the innnerClassReturnStatus to set
	 */
	public void setInnnerClassReturnStatus(int innnerClassReturnStatus) {
		this.innnerClassReturnStatus = innnerClassReturnStatus;
	}

	/**
	 * @return the companyUserName
	 */
	public String getCompanyUserName() {
		return companyUserName;
	}

	/**
	 * @param companyUserName the companyUserName to set
	 */
	public void setCompanyUserName(String companyUserName) {
		
		
		this.companyUserName = UserNameUtility.PortalUserName(companyUserName);;
	}

	/**
	 * @return the companyRole
	 */
	public String getCompanyRole() {
		return companyRole= "ADMIN(COMPANY)-USER";
	}

	/**
	 * @param companyRole the companyRole to set
	 */
	public void setCompanyRole(String companyRole) {
		this.companyRole = companyRole;
	}

	/**
	 * @return the companyWelcomeName
	 */
	public String getCompanyWelcomeName() {
		return CompanyWelcomeName;
	}

	/**
	 * @param companyWelcomeName the companyWelcomeName to set
	 */
	public void setCompanyWelcomeName(String companyWelcomeName) {
		CompanyWelcomeName = companyWelcomeName;
	}

	/**
	 * @return the returnStatus
	 */
	public boolean isReturnStatus() {
		return returnStatus;
	}

	/**
	 * @param returnStatus the returnStatus to set
	 */
	public void setReturnStatus(boolean returnStatus) {
		this.returnStatus = returnStatus;
	}

	
	
	
}
