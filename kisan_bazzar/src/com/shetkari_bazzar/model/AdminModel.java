/**
 * 
 */
package com.shetkari_bazzar.model;

import java.sql.ResultSet;

import com.shetkari_bazzar.dto.SubCategoryProductDTO;
import com.shetkari_bazzar.dto.productsDTO;

/**
 * @author pravtej
 *
 */
public interface AdminModel {
	
	
	  
	public productsDTO addProducts(productsDTO PDTO);
		public SubCategoryProductDTO addSubCategoryProducts(SubCategoryProductDTO SCPDTO);
	  public ResultSet gridProductsDetails(String SQL_QUERY);
	  

}
