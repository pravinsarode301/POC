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
public class CompanyRequirementDTO {

	private String companyName;
	private int companyId;
	private String productName;
	private int productId;
	private String subProductName;
	private int subProductId;
	private int productQuantity;
	private String productUnit;
	private double productMinRate;
	private double productMaxRate;
	private String productForCity;
	private Date startDateOfProduct;
	private Date endDateOfProduct;
	private String productDescription;
	private String productImagePath;
	private int returnIntStatus;
	
	private Timestamp requirement_added_date;
	
	
	
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
	 * @return the productQuantity
	 */
	public int getProductQuantity() {
		return productQuantity;
	}
	/**
	 * @param productQuantity the productQuantity to set
	 */
	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}
	/**
	 * @return the productUnit
	 */
	public String getProductUnit() {
		return productUnit;
	}
	/**
	 * @param productUnit the productUnit to set
	 */
	public void setProductUnit(String productUnit) {
		this.productUnit = productUnit;
	}
	/**
	 * @return the productMinRate
	 */
	public double getProductMinRate() {
		return productMinRate;
	}
	/**
	 * @param productMinRate the productMinRate to set
	 */
	public void setProductMinRate(double productMinRate) {
		this.productMinRate = productMinRate;
	}
	/**
	 * @return the productMaxRate
	 */
	public double getProductMaxRate() {
		return productMaxRate;
	}
	/**
	 * @param productMaxRate the productMaxRate to set
	 */
	public void setProductMaxRate(double productMaxRate) {
		this.productMaxRate = productMaxRate;
	}
	/**
	 * @return the productForCity
	 */
	public String getProductForCity() {
		return productForCity;
	}
	/**
	 * @param productForCity the productForCity to set
	 */
	public void setProductForCity(String productForCity) {
		this.productForCity = productForCity;
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
	/**
	 * @return the productImagePath
	 */
	public String getProductImagePath() {
		return productImagePath;
	}
	/**
	 * @param productImagePath the productImagePath to set
	 */
	public void setProductImagePath(String productImagePath) {
		this.productImagePath = productImagePath;
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
	 * @return the requirement_added_date
	 */
	public Timestamp getRequirement_added_date() {
		
		
		return requirement_added_date=DateConvertor.getCurrentTimestamp();
	}
	/**
	 * @param requirement_added_date the requirement_added_date to set
	 */
	public void setRequirement_added_date(Timestamp requirement_added_date) {
		this.requirement_added_date = requirement_added_date;
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
	 * @return the subProductName
	 */
	public String getSubProductName() {
		return subProductName;
	}
	/**
	 * @param subProductName the subProductName to set
	 */
	public void setSubProductName(String subProductName) {
		this.subProductName = subProductName;
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
	/**
	 * @return the startDateOfProduct
	 */
	public Date getStartDateOfProduct() {
		return startDateOfProduct;
	}
	/**
	 * @param startDateOfProduct the startDateOfProduct to set
	 * @throws ParseException 
	 */
	public void setStartDateOfProduct(String startDateOfProduct) throws ParseException {
		this.startDateOfProduct = DateConvertor.sqlDateConvertor(startDateOfProduct);
	}
	/**
	 * @return the endDateOfProduct
	 */
	public Date getEndDateOfProduct() {
		return endDateOfProduct;
	}
	/**
	 * @param endDateOfProduct the endDateOfProduct to set
	 * @throws ParseException 
	 */
	public void setEndDateOfProduct(String endDateOfProduct) throws ParseException {
		this.endDateOfProduct = DateConvertor.sqlDateConvertor(endDateOfProduct);
	}
	
	
	
	
	
	
	
}
