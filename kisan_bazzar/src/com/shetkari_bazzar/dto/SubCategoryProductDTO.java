/**
 * 
 */
package com.shetkari_bazzar.dto;

import java.sql.Timestamp;

import com.shetkari_bazzar.dao.DateConvertor;

/**
 * @author pravtej
 *
 */
public class SubCategoryProductDTO {

	private int subCategoryProductId;
	private int mainCategoryProductId;
	private String subCategoryProductName;
	private String subCategoryProductImagePath;
	private boolean returnStatus; 
	private int returnIntStatus;
	private String created_by;
	private Timestamp created_date;
	private String subProductDescription;
	/**
	 * @return the subCategoryProductId
	 */
	public int getSubCategoryProductId() {
		return subCategoryProductId;
	}
	/**
	 * @param subCategoryProductId the subCategoryProductId to set
	 */
	public void setSubCategoryProductId(int subCategoryProductId) {
		this.subCategoryProductId = subCategoryProductId;
	}
	/**
	 * @return the mainCategoryProductId
	 */
	public int getMainCategoryProductId() {
		return mainCategoryProductId;
	}
	/**
	 * @param mainCategoryProductId the mainCategoryProductId to set
	 */
	public void setMainCategoryProductId(int mainCategoryProductId) {
		this.mainCategoryProductId = mainCategoryProductId;
	}
	/**
	 * @return the subCategoryProductName
	 */
	public String getSubCategoryProductName() {
		return subCategoryProductName;
	}
	/**
	 * @param subCategoryProductName the subCategoryProductName to set
	 */
	public void setSubCategoryProductName(String subCategoryProductName) {
		this.subCategoryProductName = subCategoryProductName;
	}
	/**
	 * @return the subCategoryProductImagePath
	 */
	public String getSubCategoryProductImagePath() {
		return subCategoryProductImagePath;
	}
	/**
	 * @param subCategoryProductImagePath the subCategoryProductImagePath to set
	 */
	public void setSubCategoryProductImagePath(String subCategoryProductImagePath) {
		this.subCategoryProductImagePath = subCategoryProductImagePath;
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
	 * @return the created_by
	 */
	public String getCreated_by() {
		return created_by;
	}
	/**
	 * @param created_by the created_by to set
	 */
	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}
	/**
	 * @return the created_date
	 */
	public Timestamp getCreated_date() {
		
		
		
		return created_date;
	}
	/**
	 * @param created_date the created_date to set
	 */
	public void setCreated_date() {
		this.created_date = DateConvertor.getCurrentTimestamp();
	}
	/**
	 * @return the subProductDescription
	 */
	public String getSubProductDescription() {
		return subProductDescription;
	}
	/**
	 * @param subProductDescription the subProductDescription to set
	 */
	public void setSubProductDescription(String subProductDescription) {
		this.subProductDescription = subProductDescription;
	}
	
	
	
	
	
	
}
