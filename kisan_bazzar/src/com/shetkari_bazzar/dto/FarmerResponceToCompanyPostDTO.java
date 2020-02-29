/**
 * 
 */
package com.shetkari_bazzar.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;

import com.shetkari_bazzar.dao.DateConvertor;

/**
 * @author pravtej
 *
 */
public class FarmerResponceToCompanyPostDTO {
	
	private int compRequirementId;
	private int subProductId;
	private String userFullName;
	private Long productQuantity;
	private Long userContactNumber;
	private String userGender;
	private String userAddress;
	private String ProductForCity;
	private Date productAddedDate;
	private double productExpectedCost;
	private Timestamp postRespsonceAddedDate;
	private String productImage;
	private int returnIntStatus;
	private int userId;
	private int companyId;
	private String companyName;
	
	
	
	/**
	 * @return the userFullName
	 */
	public String getUserFullName() {
		return userFullName;
	}
	/**
	 * @param userFullName the userFullName to set
	 */
	public void setUserFullName(String userFullName) {
		this.userFullName = userFullName;
	}
	/**
	 * @return the productQuantity
	 */
	public Long getProductQuantity() {
		return productQuantity;
	}
	/**
	 * @param productQuantity the productQuantity to set
	 */
	public void setProductQuantity(Long productQuantity) {
		this.productQuantity = productQuantity;
	}
	/**
	 * @return the userContactNumber
	 */
	public Long getUserContactNumber() {
		return userContactNumber;
	}
	/**
	 * @param userContactNumber the userContactNumber to set
	 */
	public void setUserContactNumber(Long userContactNumber) {
		this.userContactNumber = userContactNumber;
	}
	/**
	 * @return the userGender
	 */
	public String getUserGender() {
		return userGender;
	}
	/**
	 * @param userGender the userGender to set
	 */
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	/**
	 * @return the userAddress
	 */
	public String getUserAddress() {
		return userAddress;
	}
	/**
	 * @param userAddress the userAddress to set
	 */
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	/**
	 * @return the productForCity
	 */
	public String getProductForCity() {
		return ProductForCity;
	}
	/**
	 * @param productForCity the productForCity to set
	 */
	public void setProductForCity(String productForCity) {
		ProductForCity = productForCity;
	}
	/**
	 * @return the productAddedDate
	 */
	public Date getProductAddedDate() {
		return productAddedDate;
	}
	/**
	 * @param productAddedDate the productAddedDate to set
	 * @throws ParseException 
	 */
	public void setProductAddedDate(String productAddedDate) throws ParseException {
		this.productAddedDate = DateConvertor.sqlDateConvertor(productAddedDate);
	}
	/**
	 * @return the productExpectedCost
	 */
	public double getProductExpectedCost() {
		return productExpectedCost;
	}
	/**
	 * @param productExpectedCost the productExpectedCost to set
	 */
	public void setProductExpectedCost(double productExpectedCost) {
		this.productExpectedCost = productExpectedCost;
	}
	/**
	 * @return the postRespsonceAddedDate
	 */
	public Timestamp getPostRespsonceAddedDate() {
		return postRespsonceAddedDate;
	}
	/**
	 * @param postRespsonceAddedDate the postRespsonceAddedDate to set
	 */
	public void setPostRespsonceAddedDate() {
		
		this.postRespsonceAddedDate = DateConvertor.getCurrentTimestamp();
	}
	/**
	 * @return the productImage
	 */
	public String getProductImage() {
		return productImage;
	}
	/**
	 * @param productImage the productImage to set
	 */
	public void setProductImage(String productImage) {
		this.productImage = productImage;
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
	 * @return the companyId
	 */
	public int getCompanyId() {
		return companyId;
	}
	/**
	 * @param companyId the companyId to set
	 */
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	/**
	 * @return the companyName
	 */
	public String getCompanyName() {
		return companyName;
	}
	/**
	 * @param companyName the companyName to set
	 */
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	/**
	 * @return the compRequirementId
	 */
	public int getCompRequirementId() {
		return compRequirementId;
	}
	/**
	 * @param compRequirementId the compRequirementId to set
	 */
	public void setCompRequirementId(int compRequirementId) {
		this.compRequirementId = compRequirementId;
	}
	/**
	 * @return the subProductId
	 */
	public int getSubProductId() {
		return subProductId;
	}
	/**
	 * @param subProductId the subProductId to set
	 */
	public void setSubProductId(int subProductId) {
		this.subProductId = subProductId;
	}
	
	
	
	
	
	
}
