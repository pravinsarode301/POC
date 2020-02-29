/**
 * 
 */
package com.shetkari_bazzar.helper;

import java.sql.ResultSet;

import com.shetkari_bazzar.dto.CompanyRequirementDTO;
import com.shetkari_bazzar.dto.FarmerResponceToCompanyPostDTO;
import com.shetkari_bazzar.dto.SubCategoryProductDTO;
import com.shetkari_bazzar.dto.changePasswordDTO;
import com.shetkari_bazzar.dto.productsDTO;
import com.shetkari_bazzar.services.TestService;
import com.shetkari_bazzar.services.TestServiceImpl;

/**
 * @author PravTej
 *
 */
public class SuperAdminHelper {
	TestService test=new TestServiceImpl();
	ResultSet rt;
public int changePassword(changePasswordDTO CPDTO){
	int status;
	
	status=test.updateNewPassword(CPDTO);
	
	
	return status;

}	

public productsDTO insertProducts(productsDTO PDTO){
	
	
		PDTO = test.addProductsDetails(PDTO);
	return PDTO;
}

public SubCategoryProductDTO insertSubCategoryProducts(SubCategoryProductDTO SCPDTO){
	
	
	SCPDTO = test.addProductsDetails(SCPDTO);
return SCPDTO;
}

public ResultSet viewPortalProducts() {
	
	
	rt=test.gridProducts();
	return rt;
}

public ResultSet viewSubCategoryPortalProducts(SubCategoryProductDTO SCPDTO) {
	
	
	rt=test.gridSubCategoryProducts(SCPDTO);
	return rt;
}

public ResultSet viewReleavantCompaniesProductsRequirement(CompanyRequirementDTO SCPDTO) {
	
	
	rt=test.gridCompanyRequirementsForProducts(SCPDTO);
	return rt;
}


public FarmerResponceToCompanyPostDTO insertUserResponceToPost(FarmerResponceToCompanyPostDTO FRTCPDTO){
	
	
	FRTCPDTO = test.addUserResponceToPost(FRTCPDTO);
return FRTCPDTO;
}


}
