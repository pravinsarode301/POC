/**
 * 
 */
package com.shetkari_bazzar.dto;

import java.sql.Timestamp;

/**
 * @author pravtej
 *
 */
public  class productsDTO {
	
	
	private String productName;
	private String imageName;
	private String createdBy;
	private Timestamp createdDate;
	private int productId;
	private boolean returnStatus; 
	private int returnIntStatus;
	private String productDescription;
	
	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}
	/**
	 * @param productName the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}
	/**
	 * @return the imageName
	 */
	public String getImageName() {
		return imageName;
	}
	/**
	 * @param imageName the imageName to set
	 */
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	/**
	 * @return the createdBy
	 */
	public String getCreatedBy() {
		return createdBy;
	}
	/**
	 * @param createdBy the createdBy to set
	 */
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
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
		java.util.Date date = new java.util.Date();

		this.createdDate = new Timestamp(date.getTime());
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
	 * @return the productId
	 */
	public int getProductId() {
		return productId;
	}
	/**
	 * @param productId the productId to set
	 */
	public void setProductId(int productId) {
		this.productId = productId;
	}
	/**
	 * @return the productDescription
	 */
	public String getProductDescription() {
		return productDescription;
	}
	/**
	 * @param productDescription the productDescription to set
	 */
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	

	
	
	
	

}
