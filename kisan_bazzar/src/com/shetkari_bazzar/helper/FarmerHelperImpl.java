/**
 * 
 */
package com.shetkari_bazzar.helper;

import java.sql.ResultSet;

import com.shetkari_bazzar.dto.FarmerDTO;
import com.shetkari_bazzar.services.TestService;
import com.shetkari_bazzar.services.TestServiceImpl;

/**
 * @author PravTej
 *
 */
public class FarmerHelperImpl implements FarmerHelper {
	/* required object */

	TestService test = new TestServiceImpl();
	FarmerDTO FDTO = new FarmerDTO();
	ResultSet rt = null;

	@Override
	public ResultSet GridFarmer(FarmerDTO FDTO) {
		// TODO Auto-generated method stub
		rt = test.GridFarmer(FDTO);

		return rt;

	}

	@Override
	public FarmerDTO totalRegistredFarmer() {
		// TODO Auto-generated method stub

		FDTO = test.totalRegFarmer();
		return FDTO;

	}

	@Override
	public int removeFarmerDetails(FarmerDTO FDTO) {
		// TODO Auto-generated method stub
		return test.removeFarmer(FDTO);
	}
	
	
	
	@Override
	public FarmerDTO updateFarmerData(FarmerDTO FDTO) {
		// TODO Auto-generated method stub
		
		FDTO=test.updateFarmerDetails(FDTO);
		
		return FDTO;
	}

	
	@Override
	public FarmerDTO registerFarmer(FarmerDTO FDTO) {
		// TODO Auto-generated method stub
	
		TestService test=new TestServiceImpl();		
		FDTO=test.registerData(FDTO);
		return FDTO;
		
		
	}
	
}
