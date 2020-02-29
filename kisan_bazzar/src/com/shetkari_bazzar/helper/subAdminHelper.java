/**
 * 
 */
package com.shetkari_bazzar.helper;

import com.shetkari_bazzar.dto.subAdminDTO;
import com.shetkari_bazzar.services.TestService;
import com.shetkari_bazzar.services.TestServiceImpl;

/**
 * @author PravTej
 *
 */
public class subAdminHelper {

	
	public int registerUser(subAdminDTO SADTO)
	{
		
		TestService test=new TestServiceImpl();
		return test.addUser(SADTO);
		
		
		
	}
	
	
}
