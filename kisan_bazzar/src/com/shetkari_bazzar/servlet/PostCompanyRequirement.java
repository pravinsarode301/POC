package com.shetkari_bazzar.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.shetkari_bazzar.dto.CompanyRequirementDTO;
import com.shetkari_bazzar.dto.productsDTO;
import com.shetkari_bazzar.helper.CompanyHelper;
import com.shetkari_bazzar.helper.CompanyHelperImpl;
import com.shetkari_bazzar.helper.SuperAdminHelper;

/**
 * Servlet implementation class PostCompanyRequirement
 */
@WebServlet("/PostCompanyRequirement")
public class PostCompanyRequirement extends HttpServlet {
	private boolean isMultipart;
	private String filePath;
	private int maxFileSize = 50 * 1024 * 50;
	private int maxMemSize = 4 * 1024;
	private File file;

	

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		/* required object */
		HttpSession session=request.getSession(false);
		
	
		System.out.println("HELO AM HERE I N PostCompanyRequirement");
		CompanyRequirementDTO PRDTO = new CompanyRequirementDTO();
			ResultSet rt=null;
			SuperAdminHelper SAH=new SuperAdminHelper();
		// process only if its multipart content

		isMultipart = ServletFileUpload.isMultipartContent(request);
		///response.setContentType("text/html");

		if (!isMultipart) {
System.out.println("data is not multipart");
			return;
		}else{
			System.out.println("data is multipart");
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
		File path = new File(root + "/ProductRequirementUploads");
		//System.out.println("path" + path);
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
				System.out.println("am here");
				FileItem fi = (FileItem) i.next();

				if (fi.isFormField()) {
					String formFieldName = fi.getFieldName();
					System.out.println("formFieldName :" +formFieldName+" value :"+ fi.getString());
					

					switch (formFieldName) {

					case "companyId":
						PRDTO.setCompanyId(Integer.parseInt(fi.getString()));

						break;
					case "productField":
						
						String string = fi.getString();
						
						System.out.println("productField "+string);
						String[] parts = string.split("/");
						String part1 = parts[0]; // 004
						String part2 = parts[1]; // 034556
						
						PRDTO.setProductName(part1);
						
						PRDTO.setProductId(Integer.parseInt(part2));
						System.out.println("part1"+PRDTO.getProductName());
						System.out.println("part1"+PRDTO.getProductId());
						
						break;
					case "subProductField":
						
						String string1 = fi.getString();
						
						String[] partss = string1.split("/");
						String part11 = partss[0]; // 004
						
						String part22 = partss[1]; // 034556
						
						PRDTO.setSubProductName(part11);
						PRDTO.setSubProductId(Integer.parseInt(part22));
						
						System.out.println(PRDTO.getSubProductName());
						System.out.println(PRDTO.getSubProductId());
						break;
					case "productQuantity":
						PRDTO.setProductQuantity(Integer.parseInt(fi.getString()));
						
						break;
					case "productUnit":
						PRDTO.setProductUnit(fi.getString());
						
						break;
					case "productMinRate":
						PRDTO.setProductMinRate(Double.parseDouble(fi.getString()));
						break;
					case "productMaxRate":
						PRDTO.setProductMaxRate(Double.parseDouble(fi.getString()));
						break;
					case "productForCity":
						PRDTO.setProductForCity(fi.getString());
						break;
					case "startDateOfProduct":
					
						PRDTO.setStartDateOfProduct(fi.getString());
						break;
					case "endDateOfProduct":
						
						PRDTO.setEndDateOfProduct(fi.getString());
						break;
					case "productDescription":
						PRDTO.setProductDescription(fi.getString());
						break;

					default:
						break;
				}

				}

				if (!fi.isFormField()) {
					// Get the uploaded file parameters
					
					String fieldName = fi.getFieldName();
					String fileName = fi.getName();
					System.out.println("formFieldName :" +fieldName+" name :"+ fi.getString());
					String contentType = fi.getContentType();
					System.out.println(contentType);
					boolean isInMemory = fi.isInMemory();
					long sizeInBytes = fi.getSize();
					// Write the file
					if (fileName.lastIndexOf("\\") >= 0) {
						file = new File(path + "\\" + fileName.substring(fileName.lastIndexOf("\\")));

					} else {
						file = new File(path + "\\" + fileName.substring(fileName.lastIndexOf("\\") + 1));

					}

					String proPic = file.getAbsolutePath();
					PRDTO.setProductImagePath(proPic);
					System.out.println(proPic);

				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

	

		CompanyHelper CH=new CompanyHelperImpl();
		PRDTO =CH.addRequirements(PRDTO);
		System.out.println(PRDTO.getReturnIntStatus());
		
		if(PRDTO.getReturnIntStatus()==1){
			request.setAttribute("postMsg", "Your requirement has been successfully placed !");
		}else{
			request.setAttribute("postMsg", "Error occured while posting requirement ,please try after sometime !");
		}
		
		
		rt=SAH.viewPortalProducts();
		request.setAttribute("productGrid", rt);
		String UsersPanel = getServletContext().getInitParameter("UsersJsp");
		request.getRequestDispatcher(UsersPanel+"/postCompanyRequirement.jsp").forward(request, response);;
		
		
		
	}

}
