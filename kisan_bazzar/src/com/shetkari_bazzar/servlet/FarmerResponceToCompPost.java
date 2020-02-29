package com.shetkari_bazzar.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.shetkari_bazzar.dto.CompanyRequirementDTO;
import com.shetkari_bazzar.dto.FarmerResponceToCompanyPostDTO;
import com.shetkari_bazzar.helper.SuperAdminHelper;

/**
 * Servlet implementation class FarmerResponceToCompPost1
 */
@WebServlet("/FarmerResponceToCompPost")
public class FarmerResponceToCompPost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private boolean isMultipart;
	private String filePath;
	private int maxFileSize = 50 * 1024 * 50;
	private int maxMemSize = 4 * 1024;
	private File file;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FarmerResponceToCompPost() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		

		
		
		FarmerResponceToCompanyPostDTO FRTCP=new FarmerResponceToCompanyPostDTO();
		
		isMultipart = ServletFileUpload.isMultipartContent(request);
		response.setContentType("text/html");

		if (!isMultipart) {

			return;
		}
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// maximum size that will be stored in memory
		factory.setSizeThreshold(maxMemSize);
		// Location to save data that is larger than maxMemSize.
		factory.setRepository(new File("c:\\temp"));

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
		// maximum file size to be uploaded.
		upload.setSizeMax(maxFileSize);

		String root = getServletContext().getInitParameter("file-upload");
		// System.out.println("root"+root);
		File path = new File(root + "/UserResponseToCompanyPost");
		System.out.println("path" + path);
		if (!path.exists()) {
			boolean status = path.mkdirs();
			System.out.println("status" + status);
		}
		try {
			// Parse the request to get file items.
			List fileItems = upload.parseRequest(request);

			// Process the uploaded file items
			Iterator i = fileItems.iterator();

			while (i.hasNext()) {
				FileItem fi = (FileItem) i.next();

				if (fi.isFormField()) {
					String formFieldName = fi.getFieldName();
					System.out.println(formFieldName);

					switch (formFieldName) {
					
					case "companyId":
						FRTCP.setCompanyId(Integer.parseInt(fi.getString()));
						break;
					case "companyName":
						FRTCP.setCompanyName(fi.getString());
						break;
					case "subProductId":
						FRTCP.setSubProductId(Integer.parseInt(fi.getString()));
						break;
					case "compRequirementId":
						FRTCP.setCompRequirementId(Integer.parseInt(fi.getString()));
						break;
						
					case "userFullName":
						FRTCP.setUserFullName(fi.getString());
						break;
					case "productQuantity":
						FRTCP.setProductQuantity(Long.parseLong(fi.getString()));
						break;

					case "userContactNumber":
						FRTCP.setUserContactNumber(Long.parseLong(fi.getString()));
						break;
					case "userGender":
						FRTCP.setUserGender(fi.getString());
						break;

					case "userAddress":
						FRTCP.setUserAddress(fi.getString());
						break;
					case "ProductForCity":
						FRTCP.setProductForCity(fi.getString());
						break;

					case "productAddedDate":
						FRTCP.setProductAddedDate(fi.getString());
						break;
					case "productExpectedCost":
						FRTCP.setProductExpectedCost(Long.parseLong(fi.getString()));
						break;
					
					default:
						break;
					}

				}
				if (!fi.isFormField()) {
					
					
					String fieldName = fi.getFieldName();
					String fileName = fi.getName();
					String contentType = fi.getContentType();
					boolean isInMemory = fi.isInMemory();
					long sizeInBytes = fi.getSize();
					// Write the file
					if (fileName.lastIndexOf("\\") >= 0) {
						file = new File(path + "\\" + fileName.substring(fileName.lastIndexOf("\\")));

					} else {
						file = new File(path + "\\" + fileName.substring(fileName.lastIndexOf("\\") + 1));

					}
					fi.write(file);
					
					String proPic = file.getAbsolutePath();
					FRTCP.setProductImage(proPic);



				}
			}
		} catch (Exception e) {

		}
		
		SuperAdminHelper SAH=new SuperAdminHelper();
		FRTCP =SAH.insertUserResponceToPost(FRTCP);

		
		/*to load the data*/
		
		CompanyRequirementDTO CRDTO =new CompanyRequirementDTO();
		
		
		CRDTO.setSubProductId(FRTCP.getSubProductId());
		
		
		
		ResultSet rt=SAH.viewReleavantCompaniesProductsRequirement(CRDTO);
		
		request.setAttribute("releavantCompanies", rt);
		
		
		String UsersPanel = getServletContext().getInitParameter("UsersJsp");
     	
		
     	/*!to load the data*/
		
		
		if(FRTCP.getReturnIntStatus()==1)
		{
			request.setAttribute("addResponseStatus", "Your response has been succesfully recorderd");
		}else{
			request.setAttribute("addResponseStatus", "Error occured while recording your response");
		}
		
		
		
		
  		request.getRequestDispatcher(UsersPanel+"/releavantCompaniesForProducts.jsp").forward(request, response);;
	}

}
