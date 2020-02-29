/**
 * 
 */
package com.shetkari_bazzar.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;

import com.shetkari_bazzar.dao.DateConvertor;

/**
 * @author PravTej
 *
 */
public class FarmerDTO {

	private String farmerFirstName;
	private String farmerCountry;
	private String farmerAddress;
	private String farmerLastName;
	private Long farmerContactNumber;
	private String farmerEmailid;
	private String farmerLandmark;
	private String farmerCity;
	private String farmerDistrict;
	private String farmerState;
	
	private int farmerPincode;
	private int farmerId;
	private ArrayList<String> productName;
	private ArrayList<String> productType;
	private ArrayList<Integer> productQuantity;
	private int totalFarmersRegistred;
	private String status;
	private int returnStatus;
	private int innnerClassReturnStatus;
	private String farmerUserName;
	private String farmerRole;
	private String farmerPassword;
	private Timestamp createdDate;
	private Date farmerDateOfBirth;
	private String farmerGender;
	private String profilePicPath;

	/**
	 * @return the farmerId
	 */
	public int getFarmerId() {
		return farmerId;
	}

	/**
	 * @param farmerId
	 *            the farmerId to set
	 */
	public void setFarmerId(int farmerId) {
		this.farmerId = farmerId;
	}

	/**
	 * @return the productName
	 */
	public ArrayList<String> getProductName() {
		return productName;
	}

	/**
	 * @param productName
	 *            the productName to set
	 */
	public void setProductName(ArrayList<String> productName) {
		this.productName = productName;
	}

	/**
	 * @return the productType
	 */
	public ArrayList<String> getProductType() {
		return productType;
	}

	/**
	 * @param productType
	 *            the productType to set
	 */
	public void setProductType(ArrayList<String> productType) {
		this.productType = productType;
	}

	/**
	 * @return the productQuantity
	 */
	public ArrayList<Integer> getProductQuantity() {
		return productQuantity;
	}

	/**
	 * @param productQuantity
	 *            the productQuantity to set
	 */
	public void setProductQuantity(ArrayList<Integer> productQuantity) {
		this.productQuantity = productQuantity;
	}

	/**
	 * @return the totalFarmersRegistred
	 */
	public int getTotalFarmersRegistred() {
		return totalFarmersRegistred;
	}

	/**
	 * @param totalFarmersRegistred
	 *            the totalFarmersRegistred to set
	 */
	public void setTotalFarmersRegistred(int totalFarmersRegistred) {
		this.totalFarmersRegistred = totalFarmersRegistred;
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
	 * @return the farmerFirstName
	 */
	public String getFarmerFirstName() {
		return farmerFirstName;
	}

	/**
	 * @param farmerFirstName
	 *            the farmerFirstName to set
	 */
	public void setFarmerFirstName(String farmerFirstName) {
		this.farmerFirstName = farmerFirstName;
	}

	/**
	 * @return the farmerCountry
	 */
	public String getFarmerCountry() {
		return farmerCountry;
	}

	/**
	 * @param farmerCountry
	 *            the farmerCountry to set
	 */
	public void setFarmerCountry(String farmerCountry) {
		this.farmerCountry = farmerCountry;
	}

	/**
	 * @return the farmerAddress
	 */
	public String getFarmerAddress() {
		return farmerAddress;
	}

	/**
	 * @param farmerAddress
	 *            the farmerAddress to set
	 */
	public void setFarmerAddress(String farmerAddress) {
		this.farmerAddress = farmerAddress;
	}

	/**
	 * @return the farmerLastName
	 */
	public String getFarmerLastName() {
		return farmerLastName;
	}

	/**
	 * @param farmerLastName
	 *            the farmerLastName to set
	 */
	public void setFarmerLastName(String farmerLastName) {
		this.farmerLastName = farmerLastName;
	}

	/**
	 * @return the farmerContactNumber
	 */
	public Long getFarmerContactNumber() {
		return farmerContactNumber;
	}

	/**
	 * @param farmerContactNumber
	 *            the farmerContactNumber to set
	 */
	public void setFarmerContactNumber(Long farmerContactNumber) {
		this.farmerContactNumber = farmerContactNumber;
	}

	/**
	 * @return the farmerEmailid
	 */
	public String getFarmerEmailid() {
		return farmerEmailid;
	}

	/**
	 * @param farmerEmailid
	 *            the farmerEmailid to set
	 */
	public void setFarmerEmailid(String farmerEmailid) {
		this.farmerEmailid = farmerEmailid;
	}

	/**
	 * @return the farmerLandmark
	 */
	public String getFarmerLandmark() {
		return farmerLandmark;
	}

	/**
	 * @param farmerLandmark
	 *            the farmerLandmark to set
	 */
	public void setFarmerLandmark(String farmerLandmark) {
		this.farmerLandmark = farmerLandmark;
	}

	/**
	 * @return the farmerCity
	 */
	public String getFarmerCity() {
		return farmerCity;
	}

	/**
	 * @param farmerCity
	 *            the farmerCity to set
	 */
	public void setFarmerCity(String farmerCity) {
		this.farmerCity = farmerCity;
	}

	/**
	 * @return the farmerDistrict
	 */
	public String getFarmerDistrict() {
		return farmerDistrict;
	}

	/**
	 * @param farmerDistrict
	 *            the farmerDistrict to set
	 */
	public void setFarmerDistrict(String farmerDistrict) {
		this.farmerDistrict = farmerDistrict;
	}

	/**
	 * @return the farmerState
	 */
	public String getFarmerState() {
		return farmerState;
	}

	/**
	 * @param farmerState
	 *            the farmerState to set
	 */
	public void setFarmerState(String farmerState) {
		this.farmerState = farmerState;
	}

	/**
	 * @return the farmerPincode
	 */
	public int getFarmerPincode() {
		return farmerPincode;
	}

	/**
	 * @param farmerPincode
	 *            the farmerPincode to set
	 */
	public void setFarmerPincode(int farmerPincode) {
		this.farmerPincode = farmerPincode;
	}

	/**
	 * @return the returnStatus
	 */
	public int getReturnStatus() {
		return returnStatus;
	}

	/**
	 * @param returnStatus the returnStatus to set
	 */
	public void setReturnStatus(int returnStatus) {
		this.returnStatus = returnStatus;
	}

	/**
	 * @return the farmerPassword
	 */
	public String getFarmerPassword() {
		return farmerPassword;
	}

	/**
	 * @param farmerPassword the farmerPassword to set
	 */
	public void setFarmerPassword(String farmerPassword) {
		this.farmerPassword = farmerPassword;
	}

	/**
	 * @return the createdDate
	 */
	public Timestamp getCreatedDate() {
		return createdDate;
	}

	/**
	 * @param createdDate the createdDate to set
	 */
	public void setCreatedDate() {
		
		java.util.Date date= new java.util.Date();
		 
		
		this.createdDate = new Timestamp(date.getTime());
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
	 * @return the farmerUserName
	 */
	public String getFarmerUserName() {
		return farmerUserName;
	}

	/**
	 * @param farmerUserName the farmerUserName to set
	 */
	public void setFarmerUserName(String farmerUserName) {
		this.farmerUserName = farmerUserName;
	}

	/**
	 * @return the farmerRole
	 */
	public String getFarmerRole() {
		final String role="FARMER-USER";
		return farmerRole=role;
	}

	/**
	 * @param farmerRole the farmerRole to set
	 */
/*	public void setFarmerRole(String farmerRole) {
		this.farmerRole = farmerRole;
	}
	*/
	
	/**
	 * @param farmerRole the farmerRole to set
	 */
	public void setFarmerRole() {
	final String role="FARMER-USER";
		this.farmerRole = role;
	}

	/**
	 * @return the farmerDateOfBirth
	 */
	public Date getFarmerDateOfBirth() {
		return farmerDateOfBirth;
	}

	/**
	 * @param farmerDateOfBirth the farmerDateOfBirth to set
	 * @throws ParseException 
	 */
	public void setFarmerDateOfBirth(String farmerDateOfBirth) throws ParseException {
		DateConvertor date=new DateConvertor();
		
		this.farmerDateOfBirth = date.sqlDateConvertor(farmerDateOfBirth);
	}

	/**
	 * @return the farmnerGender
	 */
	public String getFarmerGender() {
		return farmerGender;
	}

	/**
	 * @param farmnerGender the farmnerGender to set
	 */
	public void setFarmerGender(String farmerGender) {
		this.farmerGender = farmerGender;
	}

	/**
	 * @return the profilePicPath
	 */
	public String getProfilePicPath() {
		return profilePicPath;
	}

	/**
	 * @param profilePicPath the profilePicPath to set
	 */
	public void setProfilePicPath(String profilePicPath) {
		this.profilePicPath = profilePicPath;
	}

	
	
	

}
