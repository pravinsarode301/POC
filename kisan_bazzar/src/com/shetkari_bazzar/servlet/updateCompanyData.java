package com.shetkari_bazzar.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
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

import com.shetkari_bazzar.dto.CompanyDTO;
import com.shetkari_bazzar.helper.CompanyHelper;
import com.shetkari_bazzar.helper.CompanyHelperImpl;
import com.sun.org.apache.xml.internal.security.utils.HelperNodeList;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class updateCompanyData
 */
@WebServlet("/updateCompanyData")
public class updateCompanyData extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final String UPLOAD_DIRECTORY = "C:/uploads";

	private boolean isMultipart;
	private String filePath;
	private int maxFileSize = 50 * 1024 * 50;
	private int maxMemSize = 4 * 1024;
	private File file;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public updateCompanyData() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");
		CompanyDTO CDTO = new CompanyDTO();
		CompanyHelper help = new CompanyHelperImpl();
		
		
		
		
		
	//	CDTO.setStatus(request.getParameter("status"));
		//CDTO.setCompanyId(Integer.parseInt(request.getParameter("companyId")));
	//	CDTO.setCompanyName(request.getParameter("companyName"));
		//CDTO.setCompanyRegId(request.getParameter("companyRegId"));
	//	CDTO.setAuthorisedPersonName(request.getParameter("authorisedPersonName"));
	//	CDTO.setAuthorisedPersonMobileNumber(Long.parseLong(request.getParameter("authorisedPersonMobileNumber")));
		//CDTO.setAuthorisedPersonEmail(request.getParameter("authorisedPersonEmail"));
		// CDTO.setCompanyAddress1(request.getParameter("companyAddress1"));
	//	CDTO.setCompanyWebsite(request.getParameter("companyWebsite"));
		//CDTO.setCompanyContactNumber(Long.parseLong(request.getParameter("companyContactNumber")));
		//CDTO.setCompanyFaxNumber(Long.parseLong(request.getParameter("companyFaxNumber")));
		//CDTO.setCompanyEmail(request.getParameter("companyEmailId"));
	//	CDTO.setCompanyCountry(request.getParameter("companyCountry"));
	//	CDTO.setCompanyState(request.getParameter("companyState"));
	//	CDTO.setCompanyCity(request.getParameter("companyCity"));
		//CDTO.setCompanyLandmark(request.getParameter("companyLandmark"));
	//	CDTO.setCompanyRegistrationDate(request.getParameter("companyRegistrationDate"));
		//CDTO.setProfilePic(request.getParameter("profilePic"));
		// CDTO.setCreatedBy(request.getParameter("sessionUser"));

		/*for new code*/
		
		// process only if its multipart content
		CDTO.setStatus("comSpecsData");
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

				try {
					// Parse the request to get file items.
					List fileItems = upload.parseRequest(request);

					// Process the uploaded file items
					Iterator i = fileItems.iterator();

					String root = getServletContext().getRealPath("/");
					 System.out.println("root"+root);
                       File path = new File(root + "/uploads");
                       System.out.println("path"+path);
                       if (!path.exists()) {
                           boolean status = path.mkdirs();
                           System.out.println("status"+status);
                       }
					while (i.hasNext()) {
						FileItem fi = (FileItem) i.next();

						if (fi.isFormField()) {
							// System.out.println(fi.getFieldName());
							String formFieldName = fi.getFieldName();
							/*System.out.println("formFieldName" + formFieldName);
							System.out.println("formString" + fi.getString());*/

							switch (formFieldName) {
							/*case "status":
								CDTO.setStatus(fi.getString());*/
							case "companyId":
								CDTO.setCompanyId(Integer.parseInt(fi.getString()));
							case "companyName":
								CDTO.setCompanyName(fi.getString());
								break;
							case "companyRegId":
								CDTO.setCompanyRegId(fi.getString());
								break;
							case "authorisedPersonName":
								CDTO.setAuthorisedPersonName(fi.getString());
								break;
							case "authorisedPersonMobileNumber":
								CDTO.setAuthorisedPersonMobileNumber(Long.parseLong(fi.getString()));
								break;
							case "authorisedPersonEmail":
								CDTO.setAuthorisedPersonEmail(fi.getString());
								break;
							case "companyWebsite":
								CDTO.setCompanyWebsite(fi.getString());
								break;
							case "companyEmailId":
								CDTO.setCompanyEmail(fi.getString());
								break;
							case "companyFaxNumber":
								CDTO.setCompanyFaxNumber(Long.parseLong(fi.getString()));
								break;
							case "companyContactNumber":
								CDTO.setCompanyContactNumber(Long.parseLong(fi.getString()));
								break;
							case "companyRegisterAddress":
								CDTO.setCompanyRegisterAddress(fi.getString());
								break;

							case "companyCurrentAddress":
								CDTO.setCompanyCurrentAddress(fi.getString());
								break;
							case "companyCountry":
								CDTO.setCompanyCountry(fi.getString());
								break;
							case "companyState":
								CDTO.setCompanyState(fi.getString());
								break;
							case "companyCity":
								CDTO.setCompanyCity(fi.getString());
								break;
							case "companyLandmark":
								CDTO.setCompanyLandmark(fi.getString());
								break;
							case "companyRegistrationDate":
								CDTO.setCompanyRegistrationDate(fi.getString());
								break;

							case "sessionUser":
								//System.out.println("sessionUser :" + fi.getString());
								CDTO.setCreatedBy(fi.getString());
								break;
							default:
								break;
							}

							

						if (!fi.isFormField()) {
							// Get the uploaded file parameters
							String fieldName = fi.getFieldName();
							String fileName = fi.getName();
							String contentType = fi.getContentType();
							boolean isInMemory = fi.isInMemory();
							long sizeInBytes = fi.getSize();
							 
	                            
							// Write the file
							if (fileName.lastIndexOf("\\") >= 0) {
								file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\")));

							} else {
								file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\") + 1));

							}
							fi.write(file);
							// out.println("filepath"+file.getAbsolutePath());
							String proPic = file.getAbsolutePath();
							CDTO.setProfilePic(proPic);
						 response.getWriter().println("Uploaded Filename: " + fileName + "<br>");
						 response.getWriter().println(filePath + file.getAbsolutePath());
						}
					}

					}} catch(java.lang.NumberFormatException r){
					System.out.println(r);
				}catch (Exception ex) {
					System.out.println(ex);
				}

		
		
		int result =help.updateCompanyData(CDTO);
		String resultStatus;
		
		
	/*	System.out.println("data check");
		System.out.println(request.getParameter("status"));
		System.out.println(CDTO.getStatus());
		System.out.println(CDTO.getCompanyId());*/
		ResultSet rt=(ResultSet) help.gridCompanyData(CDTO);
		request.setAttribute("rt", rt);
		request.setAttribute("status", CDTO.getStatus());
		if(result==1){
			resultStatus="Success ! Details updated successfully";
			request.setAttribute("resultStatus", resultStatus);
			
		}
		else{
			
			resultStatus="Sorry please try Again !";
			request.setAttribute("resultStatus", resultStatus);
			
		}
		
		
		request.getRequestDispatcher(SuperAdminPanel + "/editCompany.jsp").forward(request, response);
	
		/*
		
		 * PrintWriter out=response.getWriter();
		 * 
		 * out.println(CDTO.getCompanyName());
		 * out.println(CDTO.getCompanyRegId());
		 * out.println(CDTO.getAuthorisedPersonName());
		 * out.println(CDTO.getAuthorisedPersonEmail());
		 * out.println(CDTO.getAuthorisedPersonMobileNumber());
		 * out.println(CDTO.getCompanyWebsite());
		 * out.println(CDTO.getCompanyFaxNumber());
		 * out.println(CDTO.getCompanyContactNumber());
		 * out.println(CDTO.getCompanyEmail());
		 * out.println(CDTO.getCompanyLandmark());
		 * out.println(CDTO.getCompanyCity());
		 * out.println(CDTO.getCompanyState());
		 * out.println(CDTO.getCompanyCountry());
		 * out.println(CDTO.getCompanyRegistrationDate());
		 * out.println(CDTO.getProfilePic());
		 

	}
*/
}
}