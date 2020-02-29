/**
 * 
 */
package com.shetkari_bazzar.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.shetkari_bazzar.dao.db_utility;
import com.shetkari_bazzar.dto.SubCategoryProductDTO;
import com.shetkari_bazzar.dto.productsDTO;

/**
 * @author pravtej
 *
 */
public class AdminModelImpl implements AdminModel {

	Connection con = null;
	ResultSet rt = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	
	@Override
	public productsDTO addProducts(productsDTO PDTO) {
		// TODO Auto-generated method stub

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = db_utility.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//String SQL_QUERY="INSERT INTO `portal_products`(`ProductName`, `ImageName`, `CreatedBy`, `CreatedDate`) VALUES (?,?,?,?)";
		String SQL_QUERY="INSERT INTO `portal_products(main category)`(`product_name`, `product_image`,`product_description`, `created_by`, `created_date`) VALUES (?,?,?,?,?)";
		pstmt = db_utility.preparedStatement(con, SQL_QUERY);
		
		try{
		pstmt.setString(1, PDTO.getProductName());
		pstmt.setString(2, PDTO.getImageName());
		pstmt.setString(3, PDTO.getProductDescription());
		pstmt.setString(4,PDTO.getCreatedBy());
		pstmt.setTimestamp(5, PDTO.getCreatedDate());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		PDTO.setReturnIntStatus(db_utility.executeUpdate(pstmt));
		
        return PDTO;
	}
	
	
	@Override
	public ResultSet gridProductsDetails(String SQL_QUERY) {
		// TODO Auto-generated method stub
		try {
			con = db_utility.getConnection();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
			stmt = db_utility.createStatement(con);
			rt = db_utility.executeQuery(stmt, SQL_QUERY);
			return rt;
		

		
		
	}
	
	
	@Override
	public SubCategoryProductDTO addSubCategoryProducts(SubCategoryProductDTO SCPDTO) {
		// TODO Auto-generated method stub
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = db_utility.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		String SQL_QUERY="INSERT INTO `portal_products(sub category)`(`main_product_id`, `sub_product_name`, `sub_product_image_path`, `sub_product_description`, `created_by`, `created_date`) VALUES (?,?,?,?,?,?)";
		
		pstmt = db_utility.preparedStatement(con, SQL_QUERY);
		
		try{
		pstmt.setInt(1, SCPDTO.getMainCategoryProductId());
		pstmt.setString(2, SCPDTO.getSubCategoryProductName());
		pstmt.setString(3, SCPDTO.getSubCategoryProductImagePath());
		pstmt.setString(4,SCPDTO.getSubProductDescription());
		pstmt.setString(4,SCPDTO.getSubProductDescription());
		pstmt.setString(5,SCPDTO.getCreated_by());
		pstmt.setTimestamp(6, SCPDTO.getCreated_date());
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		SCPDTO.setReturnIntStatus(db_utility.executeUpdate(pstmt));
		
        return SCPDTO;
	}
	
	
}
